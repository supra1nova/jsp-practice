package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;

@WebServlet("/Mproc2")
public class MemberJoinProc2 extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}

	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberBean bean = new MemberBean();
		bean.setId(req.getParameter("id"));
		bean.setPassword(req.getParameter("password"));
		bean.setEmail(req.getParameter("email"));
		bean.setTel(req.getParameter("tel"));
		bean.setAddress(req.getParameter("address"));
		
		req.setAttribute("bean", bean);
		RequestDispatcher rd = req.getRequestDispatcher("MemberView.jsp");
		rd.forward(req, resp);
	}
}
