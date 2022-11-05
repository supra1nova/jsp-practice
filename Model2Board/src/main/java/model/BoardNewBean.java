package model;

import java.time.LocalDateTime;

public class BoardNewBean {
	private Integer num;
	private String writer;
	private String email;
	private String subject;
	private String password;
	private LocalDateTime reg_date;
	private LocalDateTime up_date;
	private Integer ref;
	private Integer re_step;
	private Integer re_level;
	private Integer readcount;
	private String content;
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public Integer getRef() {
		return ref;
	}
	public void setRef(Integer ref) {
		this.ref = ref;
	}
	public Integer getRe_step() {
		return re_step;
	}
	public void setRe_step(Integer re_step) {
		this.re_step = re_step;
	}
	public Integer getRe_level() {
		return re_level;
	}
	public void setRe_level(Integer re_level) {
		this.re_level = re_level;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getUp_date() {
		return up_date;
	}
	public void setUp_date(LocalDateTime up_date) {
		this.up_date = up_date;
	}
	
}
