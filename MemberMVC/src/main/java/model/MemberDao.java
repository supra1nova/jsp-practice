package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Context initCtxt = new InitialContext();
			DataSource ds = (DataSource) initCtxt.lookup("java:comp/env/jdbc_maria");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 한 사람에 대한 정보를 저장하는 메서드
	public void insertMember(MemberBean mBean) throws SQLException {
		getCon();
		try {
			String sql = "INSERT INTO jspPractice1.member(ID, PASS1, EMAIL, TEL, JOB, HOBBY, AGE, INFO) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPass1());
			pstmt.setString(3, mBean.getEmail());
			pstmt.setString(4, mBean.getTel());
			pstmt.setString(5, mBean.getJob());
			pstmt.setString(6, mBean.getHobby());
			pstmt.setString(7, mBean.getAge());
			pstmt.setString(8, mBean.getInfo());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				pstmt.close();
				con.close();
		}
	}
	
	public ArrayList<MemberBean> getAllMember() throws SQLException {
		ArrayList<MemberBean> arr = new ArrayList<>();
		getCon();
		try {
			String sql = "SELECT * FROM jspPractice1.member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				MemberBean mBean = new MemberBean();
				mBean.setId(rs.getString(1));
				mBean.setPass1(rs.getString(2));
				mBean.setEmail(rs.getString(3));
				mBean.setTel(rs.getString(4));
				mBean.setHobby(rs.getString(5));
				mBean.setJob(rs.getString(6));
				mBean.setAge(rs.getString(7));
				mBean.setInfo(rs.getString(8));
				arr.add(mBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return arr;
	}
}
