<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">파일 업로드</h2>
<div align="center">
	<form action="FileUpLoadProc.jsp" method="POST" enctype="multipart/form-data">
	<table width="350" border="1" bordercolor="grey" style="text-align: center">
		<tr height="40" align="center">
			<td width="150"> 이름</td>
			<td width="200"> <input type="text" name="name"></td>
		</tr>
		<tr height="40">
			<td width="150"> 파일 선택</td>
			<td width="200"> <input type="file" name="filedata"></td>
		</tr>
		<tr height="40">
			<td colspan="2"> <input type="submit" value="파일 업로드"></td>
		</tr>
	</table>
	</form>
</div>


<table width="1000" align="center" border="1" style="text-align: center">
	<thead>
		<tr>
			<td width="200">name</td>
			<td>image</td>
		</tr>
	</thead>
	<tbody>
		<%	        
			String path = "/Users/kd/Documents/workspace-eclipse-ee(jsp)/JSP3/src/main/webapp/upload";
			System.out.println(path);
			File dir = new File(path);
			if( dir != null){
				String[] filenames = dir.list();
				for(String filename : filenames){
					System.out.println(filename);
%>
					<tr>
						<td><%= filename %></td>
						<td><img src="<%= "./upload/" + filename %>" width="400"></td>
					</tr>
<%
				}
			}
		
		%>
	</tbody>
</table>

</body>
</html>