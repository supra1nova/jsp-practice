package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardNewBean;
import model.BoardNewDao;

@WebServlet("/BoardWriteProcController")
public class BoardWriteProcController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String writer = req.getParameter("writer");
		String subject = req.getParameter("subject");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String content = req.getParameter("content");
		
		// 비밀번호가 일치할 시 업데이트 후 200 번 코드 전달 or 업데이트 하지 않고 400 코드 전달
		if((writer != null && writer != "") && (subject != null && subject != "") 
				&& (email != null && subject !="") && (password != null && password != "") && (content != null && content != "")) {
			BoardNewBean bBean = new BoardNewBean();
			bBean.setWriter(writer);
			bBean.setSubject(subject);
			bBean.setEmail(email);
			bBean.setPassword(password);
			bBean.setContent(content);
			
			BoardNewDao bDao = new BoardNewDao();
			bDao.insertArticle(bBean);
			req.setAttribute("code", "200");
		} else {
			req.setAttribute("code", "400");
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("BoardListController");
		rd.forward(req, resp);
	}
}
