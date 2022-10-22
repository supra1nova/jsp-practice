<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

<!-- 변수선언 -->
<c:set var="sum" value="0" />

<!-- 위의 코드는 JSP scriptlet 의 request.setAttribute()와 동일하다. -->
<%-- <%
	request.setAttribute("sum" 0);
%> --%>


<!-- if 문 사용 방법 -->
<c:if test="${sum > -1}">
	안녕하세요
</c:if>

<!-- 반복문 -->
<c:forEach var="i" begin="1" end="10" step="${i += 2}">	<!-- step은 기본적으로 1씩 증가하나, custom 가능하다. 주의할 점은 ++ 는 먹히지 않는다. -->
<%-- <c:forEach var="i" begin="1" end="10" > --%>
	<c:set var="sum" value="${sum = sum + i}" />	
</c:forEach>

${sum }

</body>
</html>