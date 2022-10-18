<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bBean" class="dto.BoardBean">
	<jsp:setProperty name="bBean" property="*" />
</jsp:useBean>

<%
	BoardDao bDao = new BoardDao();
	bDao.reWriteBoard(bBean);
	
	response.sendRedirect("RentCarMain.jsp?center=BoardList.jsp");
%>

</body>
</html>
