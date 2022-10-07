<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div style="text-align:center">

	<table border="1" width="800">
		<tr width="150">
			<td align="center" colspan="2">
				<jsp:include page="Top.jsp">
					<jsp:param value="aaa" name="id"/>
				</jsp:include>
			</td>
		</tr>
		<tr height="400">
			<td align="center" width="200">
				<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td align="center" width="600">
				<jsp:include page="Center.jsp"></jsp:include>
			</td>
		</tr>
		<tr height="100">
			<td align="center" width="800" colspan="2">
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	
</div>

</body>
</html>