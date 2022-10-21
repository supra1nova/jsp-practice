<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div align="center">
	<h2>구구단 계산기</h2>
	
	<form action="Gugudan.jsp" method="POST">
	진행할 구구단 : <input type="text" name="guguParent" value="${param.guguParent}">
	<%
		String guguParentString = request.getParameter("guguParent");
		String regex = "[-0-9]+";
		Boolean res = Pattern.matches(regex, guguParentString);
		int guguParent = 0;
		if(guguParentString != null && guguParentString != "" && res){
			guguParent = Integer.valueOf(guguParentString);
		} else {
	%>
			<p><font color="red"> 값이 올바르지 않습니다. 유효한 숫자 값을 넣어주세요. </font></p>
	<%
		}
		if(guguParent != 0){
	%>
			<p><table width="900" border="1" align="center" >
				<tr height="40">
			
	<%
			for(int i = 1 ; i < 10; i++){
	%>
	
					<td width="100" align="center" >
						${param.guguParent} * <%= i %> = <%= Integer.valueOf(guguParent) * i %>
					</td>
	<%
			}
	%>
				</tr>
			</table></p>
	<%
		}
	%>
		
	<input type="submit" value="계산하기">
	</form>
</div>

</body>
</html>