<%@page import="model.BoardBean"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bean" class="model.BoardBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%
	BoardDao bDao = new BoardDao();
	Boolean checkPass = bDao.checkPass(bean.getNum(), bean.getPassword());
	if(checkPass){
		bDao.updateBoard(bean);
		response.sendRedirect("BoardList.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다. 다시 확인 후 수정해 주세요.");
		history.go(-1);
	</script>
<%
	}
%>

</body>
</html>
