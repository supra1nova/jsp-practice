<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div style="margin-top: 20px">


		<h2 style="text-align: center">답변글 입력하기</h2>
		
		<div align="center">
			<div style="width: 80%; height: 60px; display: flex; justify-content: right" ></div>
		</div>
		
		<div align="center" class="table-responsive">
			<form action="BoardReWriteProcController" method="POST">
				<table style="width: 80%" class="table table-sm">
					 <tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('writer').focus()">작성자</th>
						<td align="center" width="80%" class="align-middle" style="margin: 0; padding: 0"> <input type="text" name="writer" id="writer" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10" placeholder="작성자 이름을 입력해 주세요."></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('subject').focus()">제목</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="text" name="subject" id="subject" style="width: 97%; margin: 0; left-padding: 10px" value="${prevTitle }" class="border border-opacity-10" placeholder="글 제목을 입력해 주세요."></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('email').focus()">이메일</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="email" name="email" id="email" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10" placeholder="이메일을 입력해 주세요."></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('password').focus()">비밀번호</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="password" name="password" id="password"  style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10" placeholder="게시글 비밀번호를 입력해 주세요."></td>
					</tr>
					<tr height="250">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('content').focus()">글내용</th>
						<td colspan="3" align="center" class="align-middle" style="margin: 0; padding: 0"> <textarea style="width: 97%; margin: 0; left-padding: 10px" rows="10" name="content" id="content" class="border border-opacity-10" placeholder="글 내용을 입력해 주세요."></textarea></td>
					</tr>
					
					<!-- form에서 사용자로부터 입력받지 않고 답글 관련 데이터를 넘길 수 있도록 hidden 처리 -->
				</table>
				<div>
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="hidden" name="ref" value="${ref }">
					<input type="hidden" name="re_step" value="${reStep }">
					<input type="hidden" name="re_level" value="${reLevel }">
					<input type="submit" class="btn btn-outline-dark" value="저장">&nbsp;&nbsp;
					<input type="reset" class="btn btn-outline-dark" value="초기화">&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark" value="취소" onclick="history.go(-1)">&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark" value="전체글보기" onclick="location.href='BoardListController?pageNum=' + ${currentPage}">
				</div>
			</form>
		</div>
</div>

</body>
</html>