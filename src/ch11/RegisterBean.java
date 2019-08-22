package ch11;

public class RegisterBean {
	
	private String mem_email;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_zipcode;
	
	public String getMem_email() {
		return mem_email;
	}
	public String getMem_passwd() {
		return mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
}
