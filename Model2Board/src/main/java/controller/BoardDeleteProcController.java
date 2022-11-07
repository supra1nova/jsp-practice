package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardNewDao;

@WebServlet("/BoardDeleteProcController")
public class BoardDeleteProcController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}

	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String password = req.getParameter("password");
		int num = Integer.valueOf(req.getParameter("num"));
		BoardNewDao bDao = new BoardNewDao();
		Boolean res = bDao.checkPassword(num, password);
		RequestDispatcher rd = null;
		if(res) {
			bDao.deleteArticle(num);
			req.setAttribute("code", 200);
			 rd = req.getRequestDispatcher("BoardListController");
		} else {
			req.setAttribute("code", 400);
			req.setAttribute("errMessage", "게시글 비밀번호가 일치하지 않습니다.");
			 rd = req.getRequestDispatcher("BoardDeleteController?num=" + num);
		}
		
		rd.forward(req, resp);
	}

}
