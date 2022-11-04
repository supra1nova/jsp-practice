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

@WebServlet("/BoardUpdateController")
public class BoardUpdateController extends HttpServlet {
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
		Integer artNum = Integer.valueOf(req.getParameter("artNum"));
		// 게시글 순차 번호가 넘어왔으면 attribute에 추가 
		if(artNum != null) {
			req.setAttribute("artNum", artNum);
		}
		BoardNewDao bDao = new BoardNewDao();
		BoardNewBean bBean = bDao.getArticleWithoutReadCounting(num);
		req.setAttribute("bBean", bBean);
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/JSP/BoardUpdateForm.jsp");
		rd.forward(req, resp);
	}
}
