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

@WebServlet("/BoardReWriteController")
public class BoardReWriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(req, resp);
	}

	private void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int num = Integer.valueOf(req.getParameter("num"));
		BoardNewDao bDao = new BoardNewDao();
		String prevTitle = bDao.getArticleSubject(num);
		req.setAttribute("prevTitle", prevTitle);
		req.setAttribute("ref", req.getParameter("ref"));
		req.setAttribute("reStep", req.getParameter("re_step"));
		req.setAttribute("reLevel", req.getParameter("re_level"));
		
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/JSP/BoardReWriteForm.jsp");
		rd.forward(req, resp);
	}
}
