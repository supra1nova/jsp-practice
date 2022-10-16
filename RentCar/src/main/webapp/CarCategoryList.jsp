<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	/* 카테고리 분류 값을 받아온다 */
	int category = Integer.valueOf(request.getParameter("category"));
	RentCarDao rDao = new RentCarDao();
	ArrayList<CarListBean> cars = rDao.getCategoryCars(category);
	String type = category == 1 ? "소형" : (category == 2 ? "중형" : "대형");
%>

<div align="center">
	<table width="1000">
		<tr height="60">
			<td align="center" colspan="3">
				<font size="6" color="grey"> <%= type%> 자동차</font>
			</td>
		</tr>
	<% 
		for(int i = 0; i < cars.size(); i++){
			CarListBean bean = cars.get(i);
			if(i%3==0){
	%>
		<tr height="220">
		<%
			}
		%> 
			<td width="333" align="center">
				<a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%= bean.getNo()%>">
					<img alt=" <%= bean.getName() %>" src="img/<%= bean.getImg() %>" width="300" height="200">
				</a>
				<p>
					<font size="3" color="grey"><b><%= bean.getName() %></b></font>
				</p>
			</td>
	<%
		}
	%>
	
	</table>
</div>

</body>
</html>