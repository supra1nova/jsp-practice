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
		BoardNewBean bBean = new BoardNewBean();
		bBean.setWriter(req.getParameter("writer"));
		bBean.setSubject(req.getParameter("subject"));
		bBean.setEmail(req.getParameter("email"));
		bBean.setPassword(req.getParameter("password"));
		bBean.setContent(req.getParameter("content"));
		
		BoardNewDao bDao = new BoardNewDao();
		bDao.insertArticle(bBean);
		
		RequestDispatcher rd = req.getRequestDispatcher("BoardListController");
		rd.forward(req, resp);
	}
}
