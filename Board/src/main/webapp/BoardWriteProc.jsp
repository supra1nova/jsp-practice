<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 게시글 작성한 데이터를 한번에 읽어온다(mapping) by useBean, setProperty -->
<jsp:useBean id="boardBean" class="model.BoardBean">
	<jsp:setProperty name="boardBean" property="*" />
</jsp:useBean>

<%
	BoardDao bDao = new BoardDao();
	bDao.insertBoard(boardBean);
	
	response.sendRedirect("BoardList.jsp");
%>

</body>
</html>