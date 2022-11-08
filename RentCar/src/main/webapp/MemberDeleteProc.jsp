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
		Boolean res = false;
		try{
			// 패스워드를 비교
			res = mDao.checkPass(mBean.getId(), mBean.getPass1());
		} catch(Exception e){
			
	%>
			<script>
				alert("패스워드의 값이 유효하지 않습니다. 다시 한 번 확인해 주세요.");
				history.go(-1);
			</script>
	<%
		}
		
		
		if(res){
			// MemberDao클래스의 회원수정 메서드를 호출
			mDao.deleteMember(mBean.getId());
			session.setAttribute("id", null);
	%>
			
			<script>
				alert("회원이 탈퇴되었습니다.");
				window.location.href="RentCarMain.jsp"
			</script>
		
	<%
			// response.sendRedirect("RentCarMain.jsp");			

		} else{
	%>
	
		<script>
			alert("패스워드가 일치하지 않습니다. 다시 확인해 주세요.");
			history.go(-1);
		</script>
	
	<%
		}
	%>

</body>
</html>