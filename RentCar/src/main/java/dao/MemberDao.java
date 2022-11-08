package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberBean;

// db 연결 및 select, insert, update, delete 작업을 실행해주는 클래스.
public class MemberDao {
	
	// 기존 java.sql.Connection를 이용한 DB 접근 방식
//	String id = "jspmanager";
//	String pass = "1111";
//	String url = "jdbc:mariadb://localhost:3306/jspPractice1";

	Connection con;	// DB에 접근할 수 있도록 설정
	PreparedStatement pstmt;	// DB에서 쿼리를 실행시켜주는 객체
	ResultSet rs;	// DB의 테이블 결과를 리턴받아 JAVA에 저장시켜주는 객체
	
	// db에 접근할 수 있도록 도와주는 메서드
	public void getCon() {
		
		// 기존 JDBC + java.sql.Connection를 이용한 DB 접근 방식 
//		try {
//			// 1. DB 선언 - jdbc 드라이버 정의
//			Class.forName("org.mariadb.jdbc.Driver");
//			// 2. DB 접속
//			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspPractice1?user=" + id + "&password=" + pass);
//
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		
		
		// 커넥션 풀을 이용해 DB에 접근하는 방식
		try {
			// 외부에서 DB를 읽어야 하므로 컨텍스트설
			Context initctx = new InitialContext();
			
//			// tomcat 서버 내 정보를 담아 놓은 곳으로 이동
//			Context envctx = (Context)initctx.lookup("java:comp/env");
//			// datasource 객체를 선언
//			DataSource ds = (DataSource) envctx.lookup("jdbc_maria");
			
			// 위의 2줄과 같은 코드
			DataSource ds = (DataSource)initctx.lookup("java:comp/env/jdbc_maria");
			
			// datasource 를 기준으로 커넥션을 연결
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB에 회원 정보를 저장시키는 메서드
	public void insertMember(MemberBean mBean) throws SQLException {
		getCon();
		try{
			// 3. 접속후 쿼리 준비해 쿼리를 사용하도록 설정
			String sql = "INSERT INTO jspPractice1.member(id, pass1, email, tel, job, hobby, age, info) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPass1());
			pstmt.setString(3, mBean.getEmail());
			pstmt.setString(4, mBean.getTel());
			pstmt.setString(5, mBean.getJob());
			pstmt.setString(6, mBean.getHobby());
			pstmt.setString(7, mBean.getAge());
			pstmt.setString(8, mBean.getInfo());
			
			// 4. sql에서 쿼리를 실행하도록 설정
			pstmt.executeUpdate();
			
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
	}
	
	public ArrayList<MemberBean> allSelectMember() throws SQLException{
		ArrayList<MemberBean> arr = new ArrayList<>();
		getCon();

		// IO, DB, thread, network는 반드시 예외 처리를 해야한다!!
		try {
			// 쿼리 준비
			String sql = "SELECT * FROM jspPractice1.member";
			
			// 쿼리를 실행시켜주는 객체 선언/정의
			pstmt = con.prepareStatement(sql);
			
			// 쿼리를 실행 시킨 결과를 리턴해서 수신
			rs = pstmt.executeQuery();
			
			// 반복문을 사용해 rs에 저장된 데이터를 추출해야함
			while(rs.next()) {	// 저장된 데이터가 존재하는 만큼 반복하겠다는 뜻
				MemberBean bean = new MemberBean(); // 칼럼으로 나뉘어진 데이터를 빈클래스에 저장
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setJob(rs.getString(5));
				bean.setHobby(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				// 패키징된 memberBean 클래스를 array에 저장
				arr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return arr;
	}
	
	public MemberBean oneSelectMember(String id) throws SQLException {
		MemberBean mBean = new MemberBean();
		getCon();
		try {
			// 쿼리 준비
			String sql = "SELECT * FROM jspPractice1.member WHERE id = ?";
			
			// 쿼리를 실행시켜주는 객체 선언/정의, 그리고 매핑
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 쿼리를 실행 시킨 결과를 리턴해서 수신
			rs = pstmt.executeQuery();

			// 만약 레코드가 있다면 
			if(rs.next()) {
				mBean.setId(rs.getString(1));
				mBean.setPass1(rs.getString(2));
				mBean.setEmail(rs.getString(3));
				if(rs.getString(4) == null) {
					mBean.setTel("-");
				} else {
					mBean.setTel(rs.getString(4));
				}
				mBean.setJob(rs.getString(5));
				mBean.setHobby(rs.getString(6));
				mBean.setAge(rs.getString(7));
				if(rs.getString(7) == null) {
					mBean.setAge("-");
				} else {
					mBean.setAge(rs.getString(7));
				}
				mBean.setInfo(rs.getString(8));
				if(rs.getString(8) == null) {
					mBean.setInfo("-");
				} else {
					mBean.setInfo(rs.getString(8));
				}
				mBean.setType(rs.getString(9));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return mBean;
	}
	
	// 회원의 패스워드 값을 리턴하는 메서드
	public String getPass(String id) throws SQLException {
		String pass = "";
		getCon();
		try {
			String sql = "SELECT pass1 FROM jspPractice1.member WHERE id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
		
		return pass;
	}
	

	// 회원의 패스워드 값을 받아 DB와 체크한 뒤 boolean을 리턴하는 메서드
	public Boolean checkPass(String id, String pass) throws SQLException {
		
		String pass1 = "";
		getCon();
		try {
			String sql = "SELECT pass1 FROM jspPractice1.member WHERE id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass1 = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return pass.equals(pass1);
	}
	
	// 회원 정보 수정 메서드
	public void updateMember(MemberBean mBean) throws SQLException {
		getCon();
		try {
			String sql = "UPDATE jspPractice1.member SET email = ?, tel = ?, job = ?, "
					+ " hobby = ?, age = ?, info = ? WHERE id = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getEmail());
			pstmt.setString(2, mBean.getTel());
			pstmt.setString(3, mBean.getJob());
			pstmt.setString(4, mBean.getHobby());
			pstmt.setString(5, mBean.getAge());
			pstmt.setString(6, mBean.getInfo());
			pstmt.setString(7, mBean.getId());
			
			// insert, update, delete는 executeUpdate를 사용한다.
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
		
	}
	
	// 회원 삭제 메서드
	public void deleteMember(String id) throws SQLException {
		getCon();
		try {
			String sql = "DELETE FROM jspPractice1.member WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			pstmt.close();
			con.close();
		}
	}
	
	public String getMemberEmail(String id) throws SQLException {
		String email = null;
		getCon();
		try {
			String sql = "SELECT email FROM jspPractice1.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return email;
	}
	
	public Boolean validateEmail(String email) throws SQLException {
		Boolean res = true;
		getCon();
		try {
			String sql = "SELECT email FROM jspPractice1.member WHERE email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) res = false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return res;
	}
	
	public Boolean validateId(String id) throws SQLException {
		Boolean res = true;
		getCon();
		try {
			String sql = "SELECT id FROM jspPractice1.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) res = false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return res;
	}
	
	public String getMemberType(String id) throws SQLException {
		String mType = "u";
		getCon();
		try {
			String sql = "SELECT type FROM jspPractice1.MEMBER WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mType = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return mType;
	}
}
