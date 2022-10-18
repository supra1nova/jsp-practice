<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 프로젝트 내 만들어질 폴더명 변수 선언
	String realFolder = "";
	// 실제 만들어질 폴더명 설정
	String saveFolder = "/upload";
	// 한글 설정
	String encType="UTF-8";
	// 저장될 파일 사이즈 설정
	int maxSize = 1024*1024;	// 약 1 mega byte
	// 파일이 저장될 경로값을 읽어오는 객체 선언
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());	 // 파일 이름 자동 변경
%>
	당신의 이름은 <%= multi.getParameter("name") %>
<%
		response.sendRedirect("FileUp.jsp");
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("FileUp.jsp");
	}
%>

</body>
</html>