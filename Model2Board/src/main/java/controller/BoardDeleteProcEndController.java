package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardDeleteProcEndController")
public class BoardDeleteProcEndController extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}

	public void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		RequestDispatcher rd = null;
		String code = String.valueOf(req.getAttribute("code"));
		String num = req.getParameter("num");
		if(code.equals("200")) {
			rd = req.getRequestDispatcher("BoardListController");
		} else {
			rd = req.getRequestDispatcher("BoardDeleteController?num=" + num);
		}
		
		rd.forward(req, resp);
	}

}
