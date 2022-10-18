package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CarListBean;
import dto.CarReserveBean;
import dto.CarViewBean;

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
				car.setImg(rs.getString(7));
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
	
	public CarListBean getCarInfo(int no) throws SQLException {
		CarListBean car = new CarListBean();
		getCon();
		try {
			String sql = "SELECT * FROM jspPractice1.RentCar WHERE no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				car.setNo(rs.getInt(1));
				car.setName(rs.getString(2));
				car.setCategory(rs.getInt(3));
				car.setPrice(rs.getInt(4));
				car.setUsepeople(rs.getInt(5));
				car.setCompany(rs.getString(6));
				car.setImg(rs.getString(7));
				car.setInfo(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		
		return car; 
	}
	
	public int getMember(String id, String pass1) throws SQLException {
		int res = 0;
		getCon();
		try {
			String sql = "SELECT COUNT(*) FROM jspPractice1.member WHERE id=? AND pass1=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return res;
	}
	
	public void setReserveCar(CarReserveBean reserve ) throws SQLException {
		int res = 0;
		getCon();
		try {
			String sql = "INSERT INTO jspPractice1.car_reserve("
					+ "no, id, qty, duration, date, assurance, wifi, navigation, baby_seat) VALUES("
					+ "?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserve.getNo());
			pstmt.setString(2, reserve.getId());
			pstmt.setInt(3, reserve.getQty());
			pstmt.setInt(4, reserve.getDuration());
			pstmt.setString(5, reserve.getDate());
			pstmt.setInt(6, reserve.getAssurance());
			pstmt.setInt(7, reserve.getWifi());
			pstmt.setInt(8, reserve.getNavigation());
			pstmt.setInt(9, reserve.getBaby_seat());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
	}
	
	public ArrayList<CarViewBean> getReservationList(String id) throws SQLException{
		ArrayList<CarViewBean> carReservationList = new ArrayList<>();
		getCon();
		try {
//			String sql = "SELECT * FROM jspPractice1.RentCar NATURAL JOIN jspPractice1.car_reserve"
			String sql = "SELECT * FROM jspPractice1.reservation_list_test"
					+ " WHERE id=? ORDER BY date ASC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CarViewBean reservation = new CarViewBean();
				reservation.setName(rs.getString(2));
				reservation.setPrice(rs.getInt(4));
				reservation.setImg(rs.getString(7));
				reservation.setQty(rs.getInt(11));
				reservation.setDuration(rs.getInt(12));
				reservation.setDate(rs.getString(13));
				reservation.setAssurance(rs.getInt(14));
				reservation.setWifi(rs.getInt(15));
				reservation.setNavigation(rs.getInt(16));
				reservation.setBaby_seat(rs.getInt(17));
				carReservationList.add(reservation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return carReservationList;
	}
	
	public void removeReservation(String id, String date) throws SQLException {
		getCon();
		try {
			String sql = "DELETE FROM jspPractice1.car_reserve WHERE id = ? AND date = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, date);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			con.close();
		}
	}
}
