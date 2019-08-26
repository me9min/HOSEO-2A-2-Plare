package Bean;

import java.sql.Date;

public class MemberBean {
	private String email;
	private String password;
	private String nickname;
	private Date birthday;
	private String phone;
	private String address;
	private String referrer;
	private String nickname_latest_changed;
	
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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
	public String getReferrer() {
		return referrer;
	}
	public void setReferrer(String referrer) {
		this.referrer = referrer;
	}
	public String getNickname_latest_changed() {
		return nickname_latest_changed;
	}
	public void setNickname_latest_changed(String nickname_latest_changed) {
		this.nickname_latest_changed = nickname_latest_changed;
	}
}
