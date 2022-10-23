<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>

<h2 align="center"> 게시글 목록</h2>
<div align="center">
	<table width="700" border="1">
		<tr height="40" align="right" bgcolor="beige">
			<td colspan="5">
				<input style="text-align:center" type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
			</td>
		</tr>
		<tr height="40" align="center" bgcolor="beige">
			<td width="80">no</td>
			<td width="320">제목</td>
			<td width="100">글쓴이</td>
			<td width="30">조회</td>
			<td width="70">게시일</td>
		</tr>
		<c:set var="number" value="${number }" />
		<c:forEach var="bean" items="${bArr }">
		<tr height="40" align="center">
			<td width="80">${number }</td>
			<td width="320" align="left">
				<c:if test="${bean.re_step >1 }">
					<c:forEach var="i" begin="1" end="${(bean.re_step - 1) * 3 }">
						&nbsp;
					</c:forEach>
				</c:if>
				<a href="BoardInfoControl?num=${bean.num }">${bean.subject }</a>
			</td>
			<td width="130">${bean.writer }</td>
			<td width="50">${bean.readcount }</td>
			<td width="120">${bean.reg_date }</td>
		</tr>
		<c:set var="number" value="${number-1 }" />
		</c:forEach>
	</table>
</div>
<p align="center">

<!-- 페이지 카운터링 소스 작성 -->
	<c:if test="${allCount > 0 }">
		<!-- 페이지 갭 설정 -->
		<c:set var="pageBlock" value="${5 }" />
		<c:set var="allPageCount" value="${allCount / countPage + (allCount % countPage == 0 ? 0 : 1) }" />
		<c:set var="startPage" value="${1 }" />
		<c:if test="${currentPage % pageBlock != 0 }">
			<!-- 결과를 정수형으로 리턴 받아야 하기에 fmt 사용 -->
			<fmt:parseNumber var="result" value="${currentPage/pageBlock }" integerOnly="true" />
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>
		<c:if test="${currentPage % pageBlock == 0 }">
			<!-- 결과를 정수형으로 리턴 받아야 하기에 fmt 사용 -->
			<fmt:parseNumber var="result" value="${currentPage/pageBlock }" integerOnly="true" />
			<c:set var="startPage" value="${(result-1) * pageBlock + 1 }" />
		</c:if>
	
		<!-- 마지막 페이지 확인 -->
		<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
		<c:if test="${endPage > allPageCount }">
			<c:set var="endPage" value="${allPageCount }" />
		</c:if>
		
		<!-- 이전 링크를 걸지 파악 -->
		<c:if test="${startPage > pageBlock }">
			<a href="BoardListController?pageNum=${startPage - pageBlock}">이전</a>
		</c:if>
		
		<!-- 페이지 번호 출력 -->
		<c:forEach var="i" begin="${startPage }" end="${endPage }" >
			<a href="BoardListController?pageNum=${i}"> [${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage < allPageCount }">
			<a href="BoardListController?pageNum=${startPage + pageBlock}">다음</a>
		</c:if>
	</c:if>
</p>

</body>
</html>