package member;

public class MemberBean {
	
	private String name, tel;
	private int age;
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	
	public String getTel() {
		return tel;
	}
	
	public int getAge() {
		return age;
	}
	
	public String getUserInfo() {
		return "<h3><font color='blue'>이름 : " + name + ", 전화번호 : " + tel + ", 나이 : " + age + "</font></h3>";
	}

}
