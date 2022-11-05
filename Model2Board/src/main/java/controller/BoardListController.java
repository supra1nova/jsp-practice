package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardNewBean;
import model.BoardNewDao;

@WebServlet("/BoardListController")
public class BoardListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		reqPro(req, resp);
	}
	
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 화면에 보여질 게시글의 갯수를 지정한다.
		int countPage = 5;
		
		// 현재 페이지 번호를 읽어온다.
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		// 전체 게시글 갯수를 초기화한다.
		int allCount = 0;
		
		// jsp 페이지 내에서 보여질 게시글 넘버링 숫자값을 저장하는 변수
		int number = 0;
		
		// 현재 페이지 문자를 숫자로 형변환
		int currentPage = Integer.parseInt(pageNum);
		
		// 전체 게시글의 갯수를 가져와야 하기에 dao 객체 생성
		BoardNewDao bDao = new BoardNewDao();
		allCount = bDao.getAllCount();
		
		// 현재 페이지에서 시작될 번호 설정
		int startRow = (currentPage - 1) * countPage + 1;
		
		// 정해진 게시글 갯수를 기준으로 게시글을 리턴 받아주는 메서드 호출
		ArrayList<BoardNewBean> bArr = null;
		bArr = bDao.getArticlesInPage((startRow-1), countPage);
		number = allCount - (currentPage - 1) * countPage;
		
		// BoardList.jsp 로 request 객체에 담아 넘긴다.
		req.setAttribute("bArr", bArr);	// 게시글 list
		req.setAttribute("number", number);	// 한 페이지 내 게시글 시작 번호(첫 시작은 전체 게시글 숫자와 동일함)
		req.setAttribute("countPage", countPage);	// 한 페이지 내 들어갈 게시글 
		req.setAttribute("allCount", allCount);	// 전체 게시글 숫자
		req.setAttribute("currentPage", currentPage);	// 현재 페이지 번호
		
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/JSP/BoardList.jsp");
		rd.forward(req, resp);
	}
}
