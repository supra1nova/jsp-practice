package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() throws SQLException {
		try {
			Context ctxt = new InitialContext();
			DataSource ds = (DataSource) ctxt.lookup("java:comp/env/jdbc_maria");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void insertBoard(BoardBean bean) throws SQLException {
		// 	bean클래스를 통해 넘어오지 않은 데이터들을 초기화
		int ref=0;
		int re_step=1;
		int re_level=1;
		
		try {
			getCon();
			
			// 가장 큰 ref 값을 읽어오는 쿼리 준비 및 실행
			String refsql = "SELECT max(ref) FROM jspPractice1.board";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			// 작성하려는 게시글의 데이터를 테이블에 저장
			String sql = "INSERT INTO jspPractice1.board("
					+ "writer, email, subject, password, reg_date, ref, re_step, re_level, readcount, content"
					+ ") VALUES("
					+ "?, ?, ?, ?, CURDATE(), ?, ?, ?, 0, ?"
					+ ")";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
	}
	
	public ArrayList<BoardBean> getAllBoard() throws SQLException{
		ArrayList<BoardBean> bDao = new ArrayList<>();
		try {
			getCon();
			
			String sql = "SELECT * FROM jspPractice1.board ORDER BY ref desc, re_step asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toLocalDate());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				bDao.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return bDao;
	}
	
	public BoardBean getOneBoard(int num) throws SQLException {
		BoardBean bean = new BoardBean();
		try {
			getCon();
			
			// 조회수 증가
			String readsql = "UPDATE jspPractice1.board SET readcount = readcount+1 WHERE num = ?";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 게시글 데이터 조회 
			String sql = "SELECT * FROM jspPractice1.board WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toLocalDate());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return bean;
	}
}

