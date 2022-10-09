<%@page import="model.BoardBean"%>
<%@page import="model.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>


<h1 style="text-align:center" >전체 글 보기</h1>
<div style="display: flex; justify-content: center; margin-bottom: 10px">

<%
	BoardDao bDao = new BoardDao();
	

	// 화면에 보여질 게시글의 갯수 설정
	int pageSize=10;
	// 현재 클릭한 카운터 번호값을 가져온다.
	String pageNum = request.getParameter("pageNum");
	// 만약 목록으로 가기 클릭을 통해 넘어오거나 수정/삭제 등 다른 게시글에서 목록 페이지로 넘어오면 pageNum값이 없으므로 null 처리
	if(pageNum == null){
		pageNum="1";
	}
	// 전체 글의 갯수를 저장하는 변수 선언
	int count = 0;
	// 페이지 넘버링 변수 선언
	int number = 0; 
	// 현재 보고자 하는 페이지 숫자를 저장
	int currentPage = Integer.parseInt(pageNum);
	// 전체 db 내 저장된 게시물 숫자 가져오기
	count = bDao.getAllCount(); 
	// 현재 페이지에 보여줄 시작 번호를 설정 -> db 에서 불러올 시작 번호
	int startRow = (currentPage-1) * pageSize + 1;
	
	// 최신 10개를 기준으로 게시글을 리턴 받아주는 메서드 호출
	ArrayList<BoardBean> arr = bDao.getAllBoard(startRow, pageSize);
	
	//테이블에 표시할 번호를 지정
	number = count - (currentPage -1) * pageSize;
%>

	<table width="700" border="1" bgcolor="beige">
		<tr height="40">
			<td align="right" colspan="5">
				<input type="button" onclick="location.href='BoardWriteForm.jsp'" value="글쓰기">
			</td>
		</tr>
		<tr height="40">
			<td width="50" align="center"> 번호</td>
			<td width="320" align="center"> 제목</td>
			<td width="100" align="center"> 작성자</td>
			<td width="150" align="center"> 작성일</td>
			<td width="80" align="center"> 조회수</td>
		</tr>		

<%
	for(int i=0; i<arr.size(); i++){
		BoardBean bean = arr.get(i);
%>
		<tr bgcolor="white">
			<td width="50" align="center"> <%= number-- %> </td>
			<td width="50" align="left"> <a href="BoardInfo.jsp?num=<%= bean.getNum() %>" style="text-decoration: none; color: black">
			<%
				if(bean.getRe_step() > 1){
					for(int j = 0 ; j < (bean.getRe_step()-1) * 5 ; j++ ){
			%>
						&nbsp;
			<%
					}
				}
			%>
			<%= bean.getSubject() %></a> </td>
			<td width="50" align="center"> <%= bean.getWriter() %> </td>
			<td width="50" align="center"> <%= bean.getReg_date() %> </td>
			<td width="50" align="center"> <%= bean.getReadcount() %> </td>
		</tr>
<%
	}
%>
	
	</table>
</div>
<div style="display: flex; justify-content: center">
	<p>
		<% 
			if(count >0){
				// 전체 페이지를 구해본다.
				int pageCount = count/pageSize+(count%pageSize == 0 ? 0 : 1); // 카운터링 숫자를 얼마까지 보여줄 것인지 결정
				
				// 시작 페이지 숫자를 설정한다.
				int startPage=1;
				if(currentPage % 10 != 0){
					startPage = (int)(currentPage/10)*10+1;
				} else {
					startPage = (int)((currentPage/10)-1)*10+1;
				}
				
				// 마지막 페이지 숫자를 설정한다.
				int pageBlock=10; // 카운터링 처리숫자
				int endPage = startPage+pageBlock-1;	// 화면에 보여질 페이지의 마지막 숫자
				
				// 마지막 페이지(endPage) 설정
				if(endPage > pageCount) endPage = pageCount;
				
				// 이전 링크 생성 함수
				if(startPage > 10){
				
		%>
					<a href="BoardList.jsp?pageNum=<%= startPage-10 %>"> [이전] </a>
		<%
				}
				
				// 페이징 처리
				for(int i = startPage; i <= endPage; i++){
		%>
					<a href="BoardList.jsp?pageNum=<%= i %>">&nbsp;<%= i %>&nbsp;</a>
		<%
				}
				
				// 다음 링크 생성 함수
				if(endPage < pageCount){
		%>
					<a href="BoardList.jsp?pageNum=<%= startPage + 10 %>">&nbsp;[다음]&nbsp;</a>
		<%
				}
			}
		%>
	</p>
</div>

</body>
</html>
