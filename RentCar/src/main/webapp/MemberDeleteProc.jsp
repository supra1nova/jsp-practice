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
		
		// 패스워드를 비교
		Boolean res = mDao.checkPass(mBean.getId(), mBean.getPass1());
		if(res){
			// MemberDao클래스의 회원수정 메서드를 호출
			mDao.deleteMember(mBean.getId());
			session.setAttribute("id", null);
			response.sendRedirect("RentCarMain.jsp?center=MemberList.jsp");
			
		} else{
	%>
	
		<script>
			alert("패스워드가 맞지 않습니다. 다시 확인해보세요.");
			history.go(-1);
		</script>
	
	<%
		}
	%>

</body>
</html>