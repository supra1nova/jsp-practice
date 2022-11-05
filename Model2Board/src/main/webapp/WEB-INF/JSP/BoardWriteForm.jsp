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
<!-- <script type="text/javascript">
	window.history.forward();
	function noBack(){window.history.forward();}
</script> -->

<!-- <body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload=""> -->
<body>
	<div style="margin-top: 20px">

		<h2 style="text-align: center">새로운 글 작성</h2>
		
		<div align="center">
			<div style="width: 80%; height: 60px; display: flex; justify-content: right" ></div>
		</div>
		
		<div align="center" class="table-responsive">
			<form action="BoardWriteProcController" method="POST">
				<table style="width: 80%" class="table table-sm">
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('writer').focus()">작성자</th>
						<td align="center" width="80%" class="align-middle" style="margin: 0; padding: 0"> <input type="text" name="writer" id="writer" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10"></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('subject').focus()">제목</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="text" name="subject" id="subject" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10"></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('email').focus()">이메일</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="email" name="email" id="email" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10"></td>
					</tr>
					<tr height="40">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('password').focus()">비밀번호</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <input type="password" name="password" id="password" autocomplete="false" style="width: 97%; margin: 0; left-padding: 10px" class="border border-opacity-10"></td>
					</tr>
					<tr height="250">
						<th style="width: 20%" class="text-center bg-dark text-white align-middle" onClick="document.getElementById('content').focus()">글 내용</th>
						<td width="80%" align="center" class="align-middle" style="margin: 0; padding: 0"> <textarea style="width: 97%; margin: 0; left-padding: 10px" rows="10" name="content" id="content" class="border border-opacity-10"></textarea></td>
					</tr>
				</table>
				<div>
					<input type="submit" class="btn btn-outline-dark" value="글쓰기"> &nbsp;&nbsp; 
					<input type="reset" class="btn btn-outline-dark" value="다시 작성"> &nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark" value="전체 게시글" onclick="location.href='BoardListController'" >
				</div>
			</form>
		</div>
		
	</div>
</body>
</html>