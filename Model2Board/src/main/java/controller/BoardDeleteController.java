package controller;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardNewBean;
import model.BoardNewDao;

@WebServlet("/BoardDeleteController")
public class BoardDeleteController extends HttpServlet {
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
		BoardNewBean bBean = bDao.getArticleWithoutReadCounting(num);
		req.setAttribute("bBean", bBean);
		RequestDispatcher rd = req.getRequestDispatcher("BoardDeleteForm.jsp");
		rd.forward(req, resp);
	}
	
}
