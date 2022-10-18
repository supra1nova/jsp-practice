package dto;

public class CarReserveBean {
	
	private int reserve_no;
	private int no;	// 자동차 번호
	private String id;	// 유저 아이디
	private int qty;	// 렌트 수량 
	private int duration;	// 렌트 기간
	private String date;	// 렌트 일자
	private int assurance;
	private int wifi;
	private int navigation;
	private int baby_seat;
	
	public int getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAssurance() {
		return assurance;
	}
	public void setAssurance(int assurance) {
		this.assurance = assurance;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getNavigation() {
		return navigation;
	}
	public void setNavigation(int navigation) {
		this.navigation = navigation;
	}
	public int getBaby_seat() {
		return baby_seat;
	}
	public void setBaby_seat(int baby_seat) {
		this.baby_seat = baby_seat;
	}	
}
