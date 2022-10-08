<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// 아이디 저장 체크 박스가 체크되었는지 값을 읽어옴
	String save = request.getParameter("save");
	
	// 체크되었는지 확인 후 아이디를 쿠키에 저장
	if(save != null){
		// 쿠키를 사용하기 위해서는 쿠키 클래스를 생성 및 아이디 값을 등록
		Cookie cookie = new Cookie("id", id);
		// 쿠키 유효시간 설정
		cookie.setMaxAge(60*3);	// 10분간 유효
		// response에 쿠키 값을 저장한다.
		response.addCookie(cookie);
		
		out.write("쿠키 생성 완료");
	}
	
%>

</body>
</html>