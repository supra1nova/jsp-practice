<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<!--
	별찍기 연습
     *
    ***
   *****
  *******
 *********
-->

<p>
	<c:forEach var="i" begin="1" end="5">
		<c:forEach var="j" begin="1" end="${5-i}">
			&nbsp;	
		</c:forEach>
		<c:forEach var="k" begin="1" end="${i*2-1}">
			*
		</c:forEach>
		<br>
	</c:forEach>
</p>

<p>
	<c:forEach var="i" begin="0" end="4">
		<c:forEach var="j" begin="${i+1}" end="${4}">
			&nbsp;	
		</c:forEach>
		<c:forEach var="k" begin="1" end="${1+(i*2)}">
			*
		</c:forEach>
		<br>
	</c:forEach>
</p>

</body>
</html>