package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberDao;

@WebServlet("/proc")
public class MemberJoinProc extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberBean mBean = new MemberBean();
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		mBean.setId(request.getParameter("id"));
		mBean.setPass1(pass1);
		mBean.setPass2(pass2);
		mBean.setEmail(request.getParameter("email"));
		mBean.setTel(request.getParameter("tel"));
		
		// 하나의 스트링으로 데이터 연결
		String[] hobby = request.getParameterValues("hobby");
		String texthobby = "";
		if(hobby != null){
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < hobby.length; i++){
				sb.append(hobby[i]);
				sb.append(" ");
			}
			texthobby = String.valueOf(sb);
		}
		
		mBean.setHobby(texthobby);
		mBean.setJob(request.getParameter("job"));
		mBean.setAge(request.getParameter("age"));
		mBean.setInfo(request.getParameter("info"));
		
		if(pass1.equals(pass2)) {
			MemberDao mdao = new MemberDao();
			try {
				mdao.insertMember(mBean);

				// 하나의 작업이 끝났음에 따라 다른 컨트롤러를 호출(핵심!!!)
				RequestDispatcher rd = request.getRequestDispatcher("MemberListCon");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
				
				request.setAttribute("msg", "회원가입이 정상적으로 이뤄지지 않았습니다. 다시 시도해 주세요.");
				RequestDispatcher rd = request.getRequestDispatcher("LoginError.jsp");
				rd.forward(request, response);
			}
		} else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다");
			RequestDispatcher rd = request.getRequestDispatcher("LoginError.jsp");
			rd.forward(request, response);
		}
				
	}
}
