<%@page import="dto.MemberBean"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass1 = request.getParameter("pass1");
	
	RentCarDao rDao = new RentCarDao();
	int res = rDao.getMember(id, pass1);
	
	if(res == 0){
%>
		<script>
			alert("회원 아이디 또는 패스워드가 틀립니다.");
			location.href="RentCarMain.jsp?center=MemberLogin.jsp";
		</script>
<%
	} else {
		session.setAttribute("id", id);
		MemberDao mDao = new MemberDao();
		MemberBean mBean = mDao.oneSelectMember(id);
		Boolean result = mBean.getType().equals("a");
		if(result) {
			response.sendRedirect("RentCarMain.jsp?center=Admin.jsp");
		} else { 
			response.sendRedirect("RentCarMain.jsp");
		}
	}
%>
</body>
</html>