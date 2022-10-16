<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<jsp:useBean id="bean" class="model.BoardBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%
	String password = request.getParameter("password");
	int num = Integer.valueOf(request.getParameter("num").trim());
	BoardDao bDao = new BoardDao();
	Boolean res = bDao.checkPass(num, password);
	if(res){
		bDao.deleteBoard(num);
		response.sendRedirect("RentCarMain.jsp?center=BoardList.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
		history.go(-1);
	</script>
<%
	}
%>


</body>
</html>
