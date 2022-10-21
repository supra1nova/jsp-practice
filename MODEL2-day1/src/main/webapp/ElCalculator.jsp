<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<h2 align="center">계산기</h2>
<div align="center">
<form action="ElCalculatorProc.jsp" method="POST">
	 <table width="400" border="1">
	 	<tr height="40">
	 		<td align="center" width="100"><input type="text" name="exp1"></td>
	 		<td align="center" width="100">
	 			<select name="exp2">
	 				<option value="+"> + </option>
	 				<option value="-"> - </option>
	 				<option value="*"> * </option>
	 				<option value="/"> / </option>
	 			</select>
 			</td>
	 		<td align="center" width="100"><input type="text" name="exp3"></td>
	 		<td align="center" width="100"><input type="submit" value="결과보기"></td>
	 	</tr>
	 </table>
</form>
</div>

<div align="center">
<form action="ElCalculator.jsp" method="POST">
	 <table width="400" border="1">
	 	<tr height="40">
	 		<td align="center" width="75"><input type="text" name="nexp1" value="${param.nexp1}"></td>
	 		<td align="center" width="50">
	 			<select name="nexp2" >
	 				<option value="+"> + </option>
	 				<option value="-"> - </option>
	 				<option value="*"> * </option>
	 				<option value="/"> / </option>
	 			</select>
 			</td>
	 		<td align="center" width="75"><input type="text" name="nexp3" value="${param.nexp3}"></td>
	 		<td align="center" width="50"> = </td>
	 		<td align="center" width="100">
	 			<%
	 				String nexp2 = request.getParameter("nexp2");
	 				if(nexp2 == null){
	 					nexp2 = "+";
	 				}
	 				if(nexp2.equals("+")){
	 			%>
	 					<input type="text" name="nexp4" value="${param.nexp1 + param.nexp3 }">
	 			<%
	 				} else if(nexp2.equals("-")){
	 			%>
	 					<input type="text" name="nexp4" value="${param.nexp1 - param.nexp3 }">
	 			<%
	 				} else if(nexp2.equals("*")){
	 			%>
	 					<input type="text" name="nexp4" value="${param.nexp1 * param.nexp3 }">
				<%
	 				} else if(nexp2.equals("/")){
	 			%>
	 					<input type="text" name="nexp4" value="${param.nexp1 / param.nexp3 }">
	 			<%
	 				} else {
				%>
						alert("잘못된 계산입니다.")
						<input type="text" name="nexp4" value="0">
				<%
	 				}
	 			%>
 			</td>
	 		<td align="center" width="50"><input type="submit" value="결과보기"></td>
	 	</tr>
	 </table>
</form>
</div>

</body>
</html>