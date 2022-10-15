<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	/* DB에 연결해 최신순 자동차 3대만 뿌려주도록 데이터를 가져온다 */
	RentCarDao rDao = new RentCarDao();
	ArrayList<CarListBean> cars = rDao.getNewCars();
%>

<div align="center">
	<table width="1000">
		<tr height="60">
			<td align="center" colspan="3">
				<font size="6" color="grey"> 최신형 자동차</font>
			</td>
		</tr>
		<tr height="240">
		<%
			for(CarListBean car : cars){
		%>
			<td width="333" align="center">
				<a href="CarReserveInfo.jsp?no=<%= car.getNo()%>">
					<img alt="<%= car.getName() %>" src="img/<%= car.getImg() %>" width="300" height="200">
				</a>
				<p><%= car.getName() %></p>
			</td>
		<% } %>
		</tr>
	</table>
	
	<p>
		<font size="4" color="blue"><b>차량 검색 하기</b>
	</p>
	<div style="margin: 0; padding: 0; width: 400px; height: 50px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<form action="RentCarMain.jsp?center=CarCategoryList.jsp" method="POST">
				<font size="4" color="grey"><b>차량 검색 하기</b></font> &nbsp;&nbsp;
				<select name="category">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
				</select>&nbsp;&nbsp;
				<input type="submit" value="검색">&nbsp;&nbsp;
			</form>
	</div>
	<div>	
		<button onclick="location.href='RentCarMain.jsp?center=CarAllList.jsp'"> 전체 검색</button>
	</div>
	
	
</div>

</body>
</html>