package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// db 연결 및 select, insert, update, delete 작업을 실행해주는 클래스.
public class MemberDao {
	
	String id = "jspmanager";
	String pass = "1111";
	String url = "jdbc:mariadb://localhost:3306/jspPractice1";

	Connection con;	// DB에 접근할 수 있도록 설정
	PreparedStatement pstmt;	// DB에서 쿼리를 실행시켜주는 객체
	ResultSet rs;	// DB의 테이블 결과를 리턴받아 JAVA에 저장시켜주는 객체
	
	// db에 접근할 수 있도록 도와주는 메서드
	public void getCon() {
		try {
			// 1. DB 선언 - jdbc 드라이버 정의
			Class.forName("org.mariadb.jdbc.Driver");
			// 2. DB 접속
			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspPractice1?user=" + id + "&password=" + pass);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB에 회원 정보를 저장시키는 메서드
	public void insertMember(MemberBean mBean) throws SQLException {
		try{
			
			getCon();
			
			// 3. 접속후 쿼리 준비해 쿼리를 사용하도록 설정
			String sql = "insert into jspPractice1.member VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPass1());
			pstmt.setString(3, mBean.getEmail());
			pstmt.setString(4, mBean.getTel());
			pstmt.setString(5, mBean.getHodbby());
			pstmt.setString(6, mBean.getJob());
			pstmt.setString(7, mBean.getAge());
			pstmt.setString(8, mBean.getInfo());
			
			// 4. sql에서 쿼리를 실행하도록 설정
			pstmt.executeUpdate();
			
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			con.close();
		}
	}
	
	public ArrayList<MemberBean> allSelectMember() throws SQLException{
		ArrayList<MemberBean> arr = new ArrayList<>();
		
		// IO, DB, thread, network는 반드시 예외 처리를 해야한다!!
		try {
			getCon();
			
			// 쿼리 준
			String sql = "Select * from jspPractice1.member";
			
			// 쿼리를 실행시켜주는 객체 선언
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
				bean.setHodbby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				// 패키징된 memberBean 클래스를 array에 저장
				arr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 반납
			con.close()
			;
		}
		
		return arr;
	}
}
