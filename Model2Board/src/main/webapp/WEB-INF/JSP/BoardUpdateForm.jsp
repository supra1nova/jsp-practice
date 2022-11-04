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
	
		<h2 style="text-align: center">게시글 수정</h2>
		
		<div align="center">
			<div style="width: 80%; height: 60px; display: flex; justify-content: right" ></div>
		</div>
		
		<div align="center" class="table-responsive">
			<form action="BoardUpdateProcController" method="POST">
				<table style="width: 80%" class="table table-sm">
					<tr height="40">
						<th width="120" class="text-center bg-dark text-white align-middle"> 작성자</th>
						<td align="center" width="180" class="align-middle"> ${bBean.writer }</td>
						<th width="120" class="text-center bg-dark text-white align-middle"> 작성일</th>
						<td align="center" width="180" class="align-middle"> ${bBean.reg_date }</td>
					</tr>
					<tr height="40">
						<th width="120" class="bg-dark text-center text-white align-middle" onClick="document.getElementById('subject').focus()">제목</th>
						<td colspan="3" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="text" name="subject" id="subject" value="${bBean.subject}" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10" placeholder="글 제목을 입력해 주세요."></td>
					</tr>
					<tr height="40">
						<th width="120" class="bg-dark text-center text-white align-middle" onClick="document.getElementById('password').focus()">패스워드</th>
						<td colspan="3" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="password" name="password" id="password" autocomplete="false" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10" placeholder="게시글 비밀번호를 입력해 주세요."></td>
					</tr>
					<tr height="250">
						<th width="120" class="bg-dark text-center text-white align-middle" onClick="document.getElementById('content').focus()">글내용</th>
						<td colspan="3" align="center" class="align-middle" style="margin: 0; padding: 0"> <textarea style="width: 97%; margin: 0; left-padding: 10px; resize: none;" rows="10" name="content" id="content" class="border border-opacity-10" placeholder="글 내용을 입력해 주세요.">${bBean.content }</textarea></td>
					</tr>
				</table>
				<div>
					<input type="hidden" name="artNum" value="${artNum }">
					<input type="hidden" name="num" value="${bBean.num }">
					<input type="submit" class="btn btn-outline-dark" value="글수정">&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark" value="취소" onclick="history.go(-1)">&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark" onclick="location.href='BoardListController'" value="전체글보기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
