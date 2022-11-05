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
		String writer = req.getParameter("writer");
		String subject = req.getParameter("subject");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String content = req.getParameter("content");
		
		try {
			if(writer == null || writer == "") {
				throw new Exception("'작성자 이름은 공백일 수 없습니다.'");
			} else if(writer.length() > 20 || writer.length() < 2) {
				throw new Exception("'작성자 이름은 최소 2자, 최대 20자로 설정해야 됩니다.'");
			}
			
			if(subject == null || subject == "") {
				throw new Exception("'제목은 공백일 수 없습니다.'");
			} else if(subject.length() > 100 && subject.length() < 2) {
				throw new Exception("'제목은 최소 2자, 최대 100자로 설정해야 됩니다.'");
			}

			if(email == null || email == "") {
				throw new Exception("'이메일은 공백일 수 없습니다.'");
			} else if(subject.length() > 50 && subject.length() < 8) {
				throw new Exception("'제목은 최소 8자, 최대 50자로 설정해야 됩니다.'");
			}
			
			if(password == null || password == "") {
				throw new Exception("'게시글 비밀번호는 공백일 수 없습니다.'");
			} else if(subject.length() > 10 && subject.length() < 4) {
				throw new Exception("'게시글 비밀번호는 최소 4자, 최대 10자로 설정해야 됩니다.'");
			}

			if(content == null || content == "") {
				throw new Exception("'게시글은 공백일 수 없습니다.'");
			} else if(subject.length() > 500 && subject.length() < 2) {
				throw new Exception("'게시글은 최소 2자, 최대 500자로 설정해야 됩니다.'");
			}
			
			BoardNewBean bBean = new BoardNewBean();
			
			bBean.setWriter(writer);
			bBean.setSubject(subject);
			bBean.setEmail(email);
			bBean.setPassword(password);
			bBean.setContent(content);
			
			BoardNewDao bDao = new BoardNewDao();
			bDao.insertArticle(bBean);
			req.setAttribute("code", 200);
			
		} catch (Exception e) {
			req.setAttribute("code", 400);
			req.setAttribute("errMessage", e.getMessage());
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("BoardListController");
		rd.forward(req, resp);
	}
}
