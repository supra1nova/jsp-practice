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
		BoardNewDao bDao = new BoardNewDao();
		
		// 비밀번호가 일치할 시 업데이트 후 200 번 코드 전달 or 업데이트 하지 않고 400 코드 전달
		if((subject != null && subject != "") && (password != null && password != "") && (content != null && content !="")) {
			res = bDao.checkPassword(num, password);
		}
		
		// 비밀번호가 일치할 시 업데이트 후 200 번 코드 전달 or 업데이트 하지 않고 400 코드 전달
		if(res) {
			bDao.updateArticle(subject, content, num);
			req.setAttribute("code", "200");
		} else {
			req.setAttribute("code", "400");
		}
		RequestDispatcher rd = req.getRequestDispatcher("BoardInfoController?pageNum=" + currentPage + "&num=" + num + "&artNum=" + artNum);
		rd.forward(req, resp);
	}
}
