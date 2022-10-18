<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("id") != null ) {
%>
		
		<!-- 게시글 작성한 데이터를 한번에 읽어온다(mapping) by useBean, setProperty -->
		<jsp:useBean id="bBean" class="dto.BoardBean">
			<jsp:setProperty name="bBean" property="*" />
		</jsp:useBean>
		
<%
		if(bBean.getPassword() != null) {
			BoardDao bDao = new BoardDao();
			bDao.insertBoard(bBean);
			response.sendRedirect("RentCarMain.jsp?center=BoardList.jsp");
		} 
		
	} 
%>
	<script>
		alert("유효한 입력 값이 없습니다.")
		history.go(-1);
	</script>

</body>
</html>