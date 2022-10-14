package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentCarDao {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 커넥션풀을 이용한 db 연결
	public void getCon() {
		
		try {
			Context initCtxt = new InitialContext();
			Context envCtxt = (Context)initCtxt.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtxt.lookup("jdbc_maria");
			con = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
