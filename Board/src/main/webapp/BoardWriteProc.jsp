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
<jsp:useBean id="bBean" class="model.BoardBean">
	<jsp:setProperty name="bBean" property="*" />
</jsp:useBean>

<%
	BoardDao bDao = new BoardDao();
	bDao.insertBoard(bBean);
	
	response.sendRedirect("BoardList.jsp");
%>

</body>
</html>