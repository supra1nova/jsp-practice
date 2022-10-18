<%@page import="dto.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RentCarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	RentCarDao rDao = new RentCarDao();
	ArrayList<CarListBean> cars = rDao.getAllCars();
%>

<div align="center">
	<table width="1000">
		<tr height="60">
			<td align="center" colspan="3">
				<font size="6" color="grey"> 전체 렌트카 보기</font>
			</td>
		</tr>
	<%
		int i = 0;
		for(CarListBean car : cars){
			if(i % 3 == 0){
	%>
				<tr height="220">
			<%
			}
			%>
					<td width="333" align="center">
						<a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%= car.getNo()%>">
							<img alt="" src="img/<%= car.getImg()%>" width="300" height="200">
						</a>
						<p>
							<font size="3" color="grey"><b><%= car.getName() %></b></font>
						</p>
					</td>
	<%
			i++;
		}
	%>
	</table>
</div>
</body>
</html>