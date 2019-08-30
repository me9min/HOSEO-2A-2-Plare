package Bean;

import java.sql.*;

public class MemberBean {
	private String email;
	private String password;
	private String nickname;
	private Date nickname_latest_changed;
	private String birthday_year;
	private String birthday_month;
	private String birthday_day;
	private String phone;
	private String address;
	private String address_detail;
	private String referrer;
	
	private String address_road;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public Date getNickname_latest_changed() {
		return nickname_latest_changed;
	}
	public void setNickname_latest_changed(Date nickname_latest_changed) {
		this.nickname_latest_changed = nickname_latest_changed;
	}
	
	public String getBirthday_year() {
		return birthday_year;
	}
	public void setBirthday_year(String birthday_year) {
		this.birthday_year = birthday_year;
	}
	
	public String getBirthday_month() {
		return birthday_month;
	}
	public void setBirthday_month(String birthday_month) {
		this.birthday_month = birthday_month;
	}
	
	public String getBirthday_day() {
		return birthday_day;
	}
	public void setBirthday_day(String birthday_day) {
		this.birthday_day = birthday_day;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	
	public String getReferrer() {
		return referrer;
	}
	public void setReferrer(String referrer) {
		this.referrer = referrer;
	}
	
	
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
}
