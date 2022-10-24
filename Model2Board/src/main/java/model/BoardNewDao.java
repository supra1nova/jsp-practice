package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardNewDao {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public void getCon() {
		try {
			Context initCtxt = new InitialContext();
			DataSource ds = (DataSource) initCtxt.lookup("java:comp/env/jdbc_maria");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getAllCount() {
		int count = 0;
		try {
			getCon();
			
			String sql = "SELECT COUNT(*) FROM jspPractice1.board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return count;
	}

	public ArrayList<BoardNewBean> getArticlesInPage(int startRow, int size) {
		ArrayList<BoardNewBean> bArr = new ArrayList<>();
		getCon();
		try {
			
			String sql = "SELECT * FROM jspPractice1.board ORDER BY ref DESC, re_step ASC LIMIT ? , ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardNewBean bBean = new BoardNewBean();
				bBean.setNum(rs.getInt(1));
				bBean.setWriter(rs.getString(2));
				bBean.setEmail(rs.getString(3));
				bBean.setSubject(rs.getString(4));
				bBean.setPassword(rs.getString(5));
				bBean.setReg_date(rs.getDate(6).toLocalDate());
				bBean.setRef(rs.getInt(7));
				bBean.setRe_step(rs.getInt(8));
				bBean.setRe_level(rs.getInt(9));
				bBean.setReadcount(rs.getInt(10));
				bBean.setContent(rs.getString(11));
				bArr.add(bBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return bArr;
	}
	
	public void insertArticle(BoardNewBean bBean) {
		getCon();
		try {
			int ref = 0;
			int re_step = 1;
			int re_level = 1;
			
			String sql = "SELECT MAX(ref) FROM jspPractice1.board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO jspPractice1.board(writer, email, subject, password, reg_date, ref, re_step, re_level, readcount, content) "
					+ " VALUES( ?, ?, ?, ?, CURDATE(), ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bBean.getWriter());
			pstmt.setString(2, bBean.getEmail());
			pstmt.setString(3, bBean.getSubject());
			pstmt.setString(4, bBean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bBean.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}
	
	public BoardNewBean getArticle(int num) {
		BoardNewBean bBean = null;
		getCon();
		try {
			String sql = "UPDATE jspPractice1.board SET readcount = readcount + 1 WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "SELECT * FROM jspPractice1.board WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bBean = new BoardNewBean();
				bBean.setNum(rs.getInt(1));
				bBean.setWriter(rs.getString(2));
				bBean.setEmail(rs.getString(3));
				bBean.setSubject(rs.getString(4));
				bBean.setPassword(rs.getString(5));
				bBean.setReg_date(rs.getDate(6).toLocalDate());
				bBean.setRef(rs.getInt(7));
				bBean.setRe_step(rs.getInt(8));
				bBean.setRe_level(rs.getInt(9));
				bBean.setReadcount(rs.getInt(10));
				bBean.setContent(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if(pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return bBean;
	}
}
