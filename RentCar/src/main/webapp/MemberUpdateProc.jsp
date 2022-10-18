<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="mBean" class="dto.MemberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>
	
<% 
	MemberDao mDao = new MemberDao();
	if(mBean.getPass1() == null){
%>
	<script>
		alert("패스워드가 입력되지 않았습니다. 다시 확인해보세요.");
		history.go(-1);
	</script>
<%
	} else {
	
		// 스트링으로 저장된 패스워드를 가져옴
		Boolean res = mDao.checkPass(mBean.getId(), mBean.getPass1());
		
		// 수정하기 위해 작성한 패스워드 값과 DB 패스워드 값을 비교
		if(res && mBean.getType().equals("u")){
			// MemberDao클래스의 회원수정 메서드를 호출
			mDao.updateMember(mBean);
%>
		<script>
			location.href="RentCarMain.jsp?center=MemberInfo.jsp?id=<%= mBean.getId() %>"
		</script>
<%
			
		} else if(res && mBean.getType().equals("a")){
			mDao.updateMember(mBean);
%>
		<script>
			location.href="RentCarMain.jsp?center=AdminInfo.jsp?id=<%= mBean.getId() %>"
		</script>
<%
		
		} else{
%>

		<script>
			alert("패스워드가 맞지 않습니다. 다시 확인해보세요.");
			history.go(-1);
		</script>

<%
		}
	}
%>

</body>
</html>