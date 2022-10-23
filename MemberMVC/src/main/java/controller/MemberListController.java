package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDao;

@WebServlet("/MemberListCon")
public class MemberListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB에 연결해서 회원의 모든 정보를 리턴한다.
		MemberDao mDao = new MemberDao();
		ArrayList<MemberBean> arr = null;
		try {
			arr = mDao.getAllMember();
			
			request.setAttribute("arr", arr);
			RequestDispatcher rd = request.getRequestDispatcher("MemberList.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			
			request.setAttribute("msg", "회원 목록을 불러올 수 없습니다.");
			RequestDispatcher rd = request.getRequestDispatcher("ErrorPage.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
