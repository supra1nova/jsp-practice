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

@WebServlet("/BoardInfoController")
public class BoardInfoController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.valueOf(req.getParameter("num"));
		BoardNewDao bDao = new BoardNewDao();
		BoardNewBean bBean = bDao.getArticle(num);
		req.setAttribute("bBean", bBean);
		RequestDispatcher rd = req.getRequestDispatcher("BoardInfo.jsp");
		rd.forward(req, resp);
	}
}
