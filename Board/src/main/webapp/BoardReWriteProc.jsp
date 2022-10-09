<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bBean" class="model.BoardBean">
	<jsp:setProperty name="bBean" property="*" />
</jsp:useBean>

<%
	BoardDao bDao = new BoardDao();
	bDao.reWriteBoard(bBean);
	
	response.sendRedirect("BoardList.jsp");
%>

</body>
</html>
