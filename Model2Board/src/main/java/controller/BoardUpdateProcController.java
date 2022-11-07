package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardNewDao;

@WebServlet("/BoardUpdateProcController")
public class BoardUpdateProcController extends HttpServlet {
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
		
		Integer artNum = Integer.valueOf(req.getParameter("artNum"));
		Integer currentPage = Integer.valueOf(req.getParameter("currentPage"));
		
		int num = Integer.valueOf(req.getParameter("num"));
		String subject = req.getParameter("subject");
		String password = req.getParameter("password");
		String content = req.getParameter("content");
		
		Boolean res = false;
		
		try {
			if(subject == null || subject == "") {
				throw new Exception("제목은 공백일 수 없습니다.");
			} else if(subject.length() > 100 || subject.length() < 2) {
				throw new Exception("제목은 최소 2자, 최대 100자로 설정해야 됩니다.");
			}
			
			if(password == null || password == "") {
				throw new Exception("게시글 비밀번호는 공백일 수 없습니다.");
			} else if(password.length() > 10 || password.length() < 4) {
				throw new Exception("게시글 비밀번호는 최소 4자, 최대 10자로 설정해야 됩니다.");
			}

			if(content == null || content == "") {
				throw new Exception("게시글은 공백일 수 없습니다.");
			} else if(content.length() > 500 || content.length() < 2) {
				throw new Exception("게시글은 최소 2자, 최대 500자로 설정해야 됩니다.");
			}
			BoardNewDao bDao = new BoardNewDao();
			res = bDao.checkPassword(num, password);
			
			if(res) {
				bDao.updateArticle(subject, content, num);
				req.setAttribute("code", 200);
			} else {
				throw new Exception("게시글 비밀번호가 일치하지 않습니다.");
			}
			
		} catch (Exception e) {
			req.setAttribute("code", 400);
			req.setAttribute("errMessage", e.getMessage());
		}
		 
		RequestDispatcher rd = req.getRequestDispatcher("BoardInfoController?pageNum=" + currentPage + "&num=" + num + "&artNum=" + artNum);
		rd.forward(req, resp);
	}
}
