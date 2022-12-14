<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<body>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeBtn">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Button trigger modal -->
	<input id=modalBtn type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" />
	
	<script>
		const modalBtn = document.querySelector("#modalBtn");
		const closeBtn = document.querySelector("#closeBtn");
	</script>

	<div style="margin-top: 20px">
	
		<!-- ??? ?????? ?????? ??? code ?????? ????????????, ??? ?????? 400?????? ??????????????? ?????? ???????????? ???. ?????? ???????????? ????????????. -->
		<c:choose>
			<c:when test="${code == 400}" >
				<script>
					document.addEventListener("DOMContentLoaded", function(e){
						e.preventDefault();
						modalBtn.click()
						closeBtn.addEventListener("click", function(){history.go(-1)});
					});	
					document.querySelector("#staticBackdropLabel").innerHTML = "??????";
					console.log(${errMessage});
					document.querySelector(".modal-body").innerText = ${errMessage};
				</script>
			</c:when>
			<c:when test="${code == 200}" >
				<script>
				document.addEventListener("DOMContentLoaded", function(e){
					e.preventDefault();
					modalBtn.click()
				});	
				document.querySelector("#staticBackdropLabel").innerHTML = "??????";
				document.querySelector(".modal-body").innerHTML = "????????? ????????? ???????????? ?????????????????????.";
				</script>
			</c:when>
		</c:choose>
		
		<h2 align="center"> ????????? ??????</h2>
		<div align="center">
			<div style="width: 80%; height: 60px; display: flex; justify-content: right" >
				<button style="text-align:center; height: 40px" type="button" class="btn btn-outline-dark" onclick="location.href='BoardWriteController'">?????????</button>
			</div>
		</div>
		
		<div align="center" class="table-responsive">
			<table style="width: 80%" class="table table-hover table-borderless">
				<thead class="bg-dark text-white align-middle text-center" >
					<tr height="40">
						<th width="80" class="align-middle">no</th>
						<th width="270" class="align-middle">??????</th>
						<th width="90" class="align-middle">?????????</th>
						<th width="40" class="align-middle">??????</th>
						<th width="60" class="align-middle">?????????</th>
						<th width="60" class="align-middle">????????????</th>
					</tr>
				</thead>
				<tbody style="border-bottom: 1px black solid">
					<c:set var="number" value="${number }" />
					<c:forEach var="bean" items="${bArr }">
						<tr height="40" align="center" onClick="location.href='BoardInfoController?pageNum=${currentPage}&num=${bean.num}&artNum=${number}'" style="cursor: pointer; border-bottom: 0.5px solid rgb(237,231,225)" >
							<td width="80" class="align-middle">${number }</td>
							<td width="320" align="left" class="align-middle">
								<c:if test="${bean.re_step >1 }">
									<c:forEach var="i" begin="1" end="${(bean.re_step - 1) * 3 }">
										&nbsp;
									</c:forEach>
									[re:]
								</c:if>
								<span class="text-dark align-middle">${bean.subject }</span>
							</td>
							<td width="130" class="align-middle">${bean.writer }</td>
							<td width="50" class="align-middle">${bean.readcount }</td>
							<td width="120" class="align-middle">${String.valueOf((bean.reg_date)).replace("T","<br>")}</td>
							<td width="120" class="align-middle">${String.valueOf((bean.up_date)).replace("T","<br>")}</td>
						</tr>
						<c:set var="number" value="${number-1 }" />
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<p align="center">
		<!-- ????????? ???????????? ?????? ?????? -->
			<c:if test="${allCount > 0 }">
				<!-- ????????? ??? ?????? -->
				<c:set var="pageBlock" value="${5 }" />
				<c:set var="allPageCount" value="${allCount / countPage + (allCount % countPage == 0 ? 0 : 1) }" />
				<c:set var="startPage" value="${1 }" />
				<c:if test="${currentPage % pageBlock != 0 }">
					<!-- ????????? ??????????????? ?????? ????????? ????????? fmt ?????? -->
					<fmt:parseNumber var="result" value="${currentPage/pageBlock }" integerOnly="true" />
					<c:set var="startPage" value="${ result * pageBlock + 1 }" />
				</c:if>
				<c:if test="${currentPage % pageBlock == 0 }">
					<!-- ????????? ??????????????? ?????? ????????? ????????? fmt ?????? -->
					<fmt:parseNumber var="result" value="${currentPage/pageBlock }" integerOnly="true" />
					<c:set var="startPage" value="${(result-1) * pageBlock + 1 }" />
				</c:if>
			
				<!-- ????????? ????????? ?????? -->
				<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
				<c:if test="${endPage > allPageCount }">
					<c:set var="endPage" value="${allPageCount }" />
				</c:if>
				
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<!-- ?????? ????????? ?????? ?????? -->
						<c:if test="${startPage > pageBlock }">
							<li class="page-item">
								<a href="BoardListController?pageNum=${startPage - pageBlock}" class="page-link text-dark" >??????</a>
							</li>
						</c:if>
						
						<!-- ????????? ?????? ?????? -->
						<c:forEach var="i" begin="${startPage }" end="${endPage }" >
							
								<c:choose >
									<c:when test="${i == currentPage }">
										<li class="page-item active"  aria-current="page">
											<a href="BoardListController?pageNum=${i}" class="page-link bg-dark border-dark" >${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a href="BoardListController?pageNum=${i}" class="page-link text-dark" >${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							
						</c:forEach>
						
						<c:if test="${endPage + 1 < allPageCount }">
							<li class="page-item">
								<a href="BoardListController?pageNum=${startPage + pageBlock}" class="page-link text-dark" >??????</a>
							</li>
						</c:if>
					</ul>
				</nav>
				
			</c:if>
		</p>
		
	</div>
</body>
</html>