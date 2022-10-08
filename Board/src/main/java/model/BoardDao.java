package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(2, bean.getSubject());
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
}

