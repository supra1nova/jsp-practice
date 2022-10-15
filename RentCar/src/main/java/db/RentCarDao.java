package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public ArrayList<CarListBean> getNewCars() throws SQLException {
		ArrayList<CarListBean> cars = new ArrayList<>();
		getCon();
		try {
			String sql = "SELECT * FROM jspPractice1.RentCar ORDER BY no DESC LIMIT 0, 10;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0; 
			while(rs.next()) {
				CarListBean car = new CarListBean();
				car.setNo(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setCategory(rs.getInt(3));
				car.setPrice(rs.getInt(4));
				car.setUsepeople(rs.getInt(5));
				car.setCompany(rs.getString(6));
				car.setImg(rs.getString(7));
				car.setInfo(rs.getString(8));
				cars.add(car);
				count++;
				if(count > 2) break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
		return cars;
	}
	
	// 카테고리별 자동차 리스트를 저장하는 메서드
	public ArrayList<CarListBean> getCategoryCars(int category) throws SQLException{
		ArrayList<CarListBean> cars = new ArrayList<>();
		getCon();
		try {
			String sql = "SELECT * FROM jspPractice1.RentCar WHERE category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CarListBean car = new CarListBean();
				car.setNo(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setCategory(rs.getInt(3));
				car.setPrice(rs.getInt(4));
				car.setUsepeople(rs.getInt(5));
				car.setCompany(rs.getString(6));
				car.setImg(rs.getString(7));
				car.setInfo(rs.getString(8));
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return cars;
	}
	
	public ArrayList<CarListBean> getAllCars() throws SQLException{
		ArrayList<CarListBean> cars = new ArrayList<>();
		getCon();
		try {
			String sql = "SELECT * FROM jspPractice1.RentCar ORDER BY NO ASC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CarListBean car = new CarListBean();
				car.setNo(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setCategory(rs.getInt(3));
				car.setPrice(rs.getInt(4));
				car.setUsepeople(rs.getInt(5));
				car.setCompany(rs.getString(6));
				car.setImg(rs.getString(7));
				car.setInfo(rs.getString(8));
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return cars;
	}
}
