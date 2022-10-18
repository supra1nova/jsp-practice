<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CarListBean"%>
<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<body>

<%
	int no = Integer.valueOf(request.getParameter("no"));
	RentCarDao rDao = new RentCarDao();
	CarListBean car = rDao.getCarInfo(no);
	
	int category = car.getCategory();
	ArrayList<CarListBean> cars = rDao.getCategoryCars(category);
	String type = category == 1 ? "소형" : (category == 2 ? "중형" : "대형");
	NumberFormat numberFormat = NumberFormat.getInstance();
%>
<div align="center">
	<form action="RentCarMain.jsp?center=CarOptionSelect.jsp" method="POST">
	<table width="1000">
		<% 
			for(int i = 0; i < CarListBean.class.getDeclaredFields().length; i++){
		
			}
		%>
			<tr height="100">
				<td align="center" colspan="3">
					<font size="6" color="grey"> <%= car.getName() %> 차량 선택 </font>
				</td>
			</tr>
			<tr>
				<td rowspan="6" width="500" align="center">
					<img alt="" src="img/<%= car.getImg() %>" width="450">
				</td>
				<td width="250" align="center"> 차량 이름</td>
				<td width="250" align="center"> <%= car.getName() %></td>
			</tr>
			<tr>
				<td width="250" align="center"> 차량 수량</td>
				<td width="250" align="center">
					<select name="qty" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="250" align="center"> 차량분류</td>
				<td width="250" align="center"> <%= type %></td>
			</tr>
			<tr>
				<td width="250" align="center"> 대여가격 (1대/1일)</td>
				<td width="250" align="center"> <%= numberFormat.format(car.getPrice()) %> 원</td>
			</tr>
			<tr>
				<td width="250" align="center"> 제조사</td>
				<td width="250" align="center"> <%= car.getCompany() %></td>
			</tr>
			<tr>
				<td width="250" align="center" colspan="2">
					<input type="hidden" name="no" value="<%= car.getNo() %>">
					<input type="hidden" name="img" value="<%= car.getImg() %>">
					<input type="submit" value="옵션 선택 후 구매하기">
				</td>
			</tr>
			
	</table>
		<br><br><br>
		<font size="5"  color="grey" > 차량 정보 보기 </font>
		<p><%= car.getInfo() %></p>
	</form>
</div>

</body>
</html>