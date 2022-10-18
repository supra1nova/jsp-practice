<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	String id = (String)session.getAttribute("id");
	String date = (String)request.getParameter("date");
	if(id != null && date != null){
		RentCarDao rDao = new RentCarDao();
		rDao.removeReservation(id, date);
%>
	<script>
		location.href="RentCarMain.jsp?center=CarReservationView.jsp";
	</script> -->

<%
	} else {
%>
	<script>
		alert("삭제 작업에 실패했습니다.");
		history.go(-1);
	</script>
<% 
	}
%>
</body>
</html>