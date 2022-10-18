<%@page import="dto.CarListBean"%>
<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	int no = Integer.valueOf(request.getParameter("no"));
	int qty = Integer.valueOf(request.getParameter("qty"));
	String img = request.getParameter("img");
	RentCarDao rDao = new RentCarDao();
	CarListBean car = rDao.getCarInfo(no);
%>

<div align="center">
	<form action="RentCarMain.jsp?center=CarReserveResult.jsp" method="POST">
	<table width="1000">
		<tr height="100">
			<td align="center" colspan="3">
				<font size="6" color="grey"> 옵션 선택 </font>
			</td>
		</tr>
		<tr>
			<td rowspan="7" width="500" align="center">
				<img alt="car image" src="img/<%= car.getImg() %>" width="450">
			</td>
			<td width="250" align="center"> 대여 기간</td>
			<td width="250" align="center">
				<select name="duration">
					<option value="1" >1일</option>
					<option value="2" >2일</option>
					<option value="3" >3일</option>
					<option value="4" >4일</option>
					<option value="5" >5일</option>
					<option value="6" >6일</option>
					<option value="7" >7일</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">대여일</td>
			<td width="250" align="center"><input type="date" name="date" size="15" id="date"></td>
		</tr>
		<tr>
			<td width="250" align="center"> 보험적용</td>
			<td width="250" align="center">
				<select name="assurance">
					<option value="1" >적용 (1일 1만원)</option>
					<option value="0" >비적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center"> Wifi</td>
			<td width="250" align="center">
				<select name="wifi">
					<option value="1" >적용 (1일 1만원)</option>
					<option value="0" >비적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center"> 네비게이션</td>
			<td width="250" align="center">
				<select name="navigation">
					<option value="1" >적용 (무료)</option>
					<option value="0" >비적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center"> 베이비시트</td>
			<td width="250" align="center">
				<select name="baby_seat">
					<option value="1" >적용 (1일 1만원)</option>
					<option value="0" >비적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="hidden" name="no" value="<%= no%>">
				<input type="hidden" name="qty" value="<%= qty%>">
				<input type="submit" value="차량예약하기" id="submitBtn" disabled>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
<script>
	const submitBtn = document.querySelector("#submitBtn");
	const date = document.querySelector("#date");
	date.addEventListener("change", function () {
		submitBtn.disabled = date.value != null ? false: true; 
	})
</script>
</html>