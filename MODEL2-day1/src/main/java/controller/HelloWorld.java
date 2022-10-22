package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Hello")	// /Hello 라고 주소 url 에 입력해야 이 서블릿이 실행된다!! -> @annotation을 이용한 url 매핑
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	// 일괄처리 -> doGet() 또는 doPost() 모두 reqPro() 메소드가 실행되도록 함. 
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 화면에 HelloWolrd라고 출력을 하고 싶다 -> jsp 쪽으로 넘겨질 데이터 설정 필요
		String msg = "Hello World ! 안녕하세요!";
		Integer data = 12;
		
		// jsp 로 데이터를 request에 부착하여 넘겨준다.
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		// 서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체를 선언 -> RequestDispatcher. 그리고 이를 이용해 jsp 페이지로 request, response 를 넘김.
		RequestDispatcher rd = request.getRequestDispatcher("HelloWorld.jsp");
		rd.forward(request, response);
	}
}
