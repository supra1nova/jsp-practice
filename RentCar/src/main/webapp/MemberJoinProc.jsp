<%@page import="util.RegexValidator"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.mariadb.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

	String texthobby = null;
try{
	String[] hobby = request.getParameterValues("hobby");
	if(hobby.length != 0){
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < hobby.length; i++){
			sb.append(hobby[i]);
			sb.append(" ");
		}
		texthobby = String.valueOf(sb);
	}
} catch(Exception e){	
%>
	<script>
		alert("취미란에 최소 한개의 값이 선택되어야 합니다. 다시 한 번 확인해주세요.");
		history.go(-1);
	</script>
<%
}
%>

<jsp:useBean id="mBean" class="dto.MemberBean">
	<jsp:setProperty name="mBean" property="*" />
</jsp:useBean>

<%
try{
	if(mBean.getId() == null || mBean.getId() == ""){
		throw new Exception("아이디는 공란이 될 수 없습니다. 다시 한 번 확인해주세요.");
	} else if(!RegexValidator.registrationValidator(mBean.getId(), RegexValidator.ID_PATTERN)){
		throw new Exception("아이디 형식이 올바르지 않습니다. 다시 한 번 확인해주세요.");
	} else if(mBean.getPass1() == null || mBean.getPass1() == ""){
		throw new Exception("패스워드는 공란이 될 수 없습니다. 다시 한 번 확인해주세요.");
	} else if(!RegexValidator.registrationValidator(mBean.getPass1(), RegexValidator.PASS_PATTERN)){
		throw new Exception("패스워드 형식이 올바르지 않습니다. 다시 한 번 확인해주세요.");
	} else if(mBean.getPass2() == null || mBean.getPass2() == ""){
		throw new Exception("확인용 패스워드는 공란이 될 수 없습니다. 다시 한 번 확인해주세요.");
	} else if(!RegexValidator.registrationValidator(mBean.getPass2(), RegexValidator.PASS_PATTERN)){
		throw new Exception("확인용 패스워드 형식이 올바르지 않습니다. 다시 한 번 확인해주세요.");
	} else if(!(mBean.getPass1().equals(mBean.getPass1()))){
		throw new Exception("패스워드와 확인용 패스워드 값이 다릅니다. 다시 한 번 확인해주세요.");
	} else if(mBean.getEmail() == null || mBean.getEmail() == ""){
		throw new Exception("이메일 주소는 공란이 될 수 없습니다. 다시 한 번 확인해주세요.");
	} else if(!RegexValidator.registrationValidator(mBean.getEmail(), RegexValidator.EMAIL_PATTERN)){
		throw new Exception("이메일 주소 형식이 올바르지 않습니다. 다시 한 번 확인해주세요.");
	}
	
	mBean.setHobby(texthobby);
	MemberDao mdao = new MemberDao();	// DB 접근 객체 생성 
	if(!mdao.validateId(mBean.getId())){
		throw new Exception("아이디 값이 중복 되었습니다.");
	} else if(!mdao.validateEmail(mBean.getEmail())){
		throw new Exception("이메일 값이 중복 되었습니다.");
	}
	mdao.insertMember(mBean);	// 회원 가입 정보 DB 저장
	session.setAttribute("id", mBean.getId());
	response.sendRedirect("RentCarMain.jsp");	// 회원 가입 완료시 회원 정보를 보여주는 페이지로 이동시킴	
} catch(Exception e){
%>
	<script>
		alert( "<%= e.getMessage()%>");
		history.go(-1);
	</script>
<%
}
%>

</body>
</html>
