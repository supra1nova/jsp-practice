<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon-precomposed" href="favicon.ico">
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
		
		<!-- 업데이트를 진행하면 code 값이 발행되며, 이 값이 400이면 비밀번호가 맞지 않는다는 뜻. 수정 화면으로 돌아간다. -->
		<c:choose>
			<c:when test="${code == 400}" >
				<script>
					console.log("111111");
					document.addEventListener("DOMContentLoaded", function(e){
						e.preventDefault();
						modalBtn.click()
						closeBtn.addEventListener("click", function(){history.go(-1)});
					});	
					document.querySelector("#staticBackdropLabel").innerHTML = "실패";
					document.querySelector(".modal-body").innerHTML = '${errMessage}';
					console.log("2222");
				</script>
			</c:when>
			<c:when test="${code == 200}" >
				<script>
				document.addEventListener("DOMContentLoaded", function(e){
					e.preventDefault();
					modalBtn.click()
				});	
				document.querySelector("#staticBackdropLabel").innerHTML = "성공";
				document.querySelector(".modal-body").innerHTML = "요청한 작업이 올바르게 수행되었습니다.";
				</script>
			</c:when>
		</c:choose>
		
		<h2 style="text-align: center"> 게시글 보기</h2>
		
		<div align="center">
			<div style="width: 80%; height: 60px; display: flex; justify-content: right" ></div>
		</div>
		
		<div align="center" class="table-responsive">
			<table style="width: 80%" class="table table-sm">
				<tr height="40">
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 글 번호</th>
					<td style="width: 30%" align="center" class="align-middle"> ${artNum}</td>
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 조회수</th>
					<td style="width: 30%" align="center" class="align-middle"> ${bBean.readcount }</td>
				</tr>
				<tr height="40">
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 작성일</th>
					<td style="width: 30%" align="center" class="align-middle"> ${String.valueOf(bBean.reg_date).replace("T", " ") }</td>
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 수정일</th>
					<td style="width: 30%" align="center" class="align-middle"> ${String.valueOf(bBean.up_date).replace("T", " ") }</td>
				</tr>
				<tr height="40">
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 작성자</th>
					<td style="width: 30%" align="center" class="align-middle"> ${bBean.writer }</td>
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 이메일</th>
					<td style="width: 30%" align="center" class="align-middle"> ${bBean.email }</td>
				</tr>
				<tr height="40">
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 제목</th>
					<td align="left" colspan="3" style="padding-left: 20px" class="align-middle"> ${bBean.subject }</td>
				</tr>
				<tr height="250">
					<th style="width: 20%" class="text-center bg-dark text-white align-middle"> 글내용</th>
					<td align="left" colspan="3" style="padding-left: 20px" class="align-middle"> ${bBean.content }</td>
				</tr>
				
			</table>
			<div>
				<button type="button" class="btn btn-outline-dark" onclick="location.href='BoardReWriteController?pageNum=${currentPage}&num=${bBean.num }&ref=${bBean.ref }&re_step=${bBean.re_step }&re_level=${bBean.re_level }'" >답글쓰기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-dark" onclick="location.href='BoardUpdateController?pageNum=${currentPage}&num=${bBean.num}&artNum=${artNum}'">수정하기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-dark" onclick="location.href='BoardDeleteController?num=${bBean.num}'">삭제하기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-dark" onclick="location.href='BoardListController?pageNum=${currentPage}'">목록보기</button>
			</div>
		</div>
	</div>
</body>
</html>