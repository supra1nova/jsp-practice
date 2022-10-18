package dto;

import java.net.http.HttpClient.Builder;

public class MemberBean {

	private String id;
	private String pass1;
	private String pass2;
	private String email;
	private String tel;
	private String job;
	private String hobby;
	private String age;
	private String info;
	private String type;
	

	public MemberBean() {
		
	}
	
	public MemberBean(String id, String pass1, String pass2, String email, String tel, String job, String hobby,
			String age, String info) {
		super();
		this.id = id;
		this.pass1 = pass1;
		this.pass2 = pass2;
		this.email = email;
		this.tel = tel;
		this.job = job;
		this.hobby = hobby;
		this.age = age;
		this.info = info;
	}
	
	public MemberBean(String id, String pass1, String pass2, String email, String tel, String job, String hobby,
			String age, String info, String type) {
		super();
		this.id = id;
		this.pass1 = pass1;
		this.pass2 = pass2;
		this.email = email;
		this.tel = tel;
		this.job = job;
		this.hobby = hobby;
		this.age = age;
		this.info = info;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getPass2() {
		return pass2;
	}

	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pass1=" + pass1 + ", pass2=" + pass2 + ", email=" + email + ", tel=" + tel
				+ ", job=" + job + ", hobby=" + hobby + ", age=" + age + ", info=" + info + ", type=" + type + "]";
	}

}
