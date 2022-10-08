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
			DataSource ds = (DataSource) ctxt.lookup("java:comp/env/jdbc_mariadb");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// TODO : handle close
			rs.close();
			pstmt.close();
			con.close();
		}
	}
	
}

