package Bean;

import java.sql.*;
import java.text.*;
import Bean.MemberBean;

public class Member {
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://plare.cf:3306/web";
	private String db_id = "web";
	private String db_pwd = "web";
	
	public Member() {
		// JDBC 드라이버 연결
		try {
			Class.forName(jdbc_driver);
		} catch(Exception e) {
			System.out.println("Fail to load JDBC DRIVER");
		}
	}
	
	public MemberBean login(MemberBean member) {
		// 로그인 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean memberBean = new MemberBean();
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			String sql = "select email,nickname,nickname_latest_changed,phone,address,address_detail,referrer from member where email=? and password=?";
			// 파라미터 값으로 넘어온 이메일과 비밀번호에 해당되는 유저의 모든 정보를 불러오는 sql문
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			// 해당되는 result set은 한 개뿐이기 때문에 반복문을 사용하지 않음  
			
			memberBean.setEmail(rs.getString("email"));
			memberBean.setNickname(rs.getString("nickname"));
			memberBean.setNickname_latest_changed(rs.getDate("nickname_latest_changed"));
			memberBean.setPhone(rs.getString("phone"));
			memberBean.setAddress(rs.getString("address"));
			memberBean.setAddress_detail(rs.getString("address_detail"));
			memberBean.setReferrer(rs.getString("referrer"));
			// 해당 회원의 모든 정보를 UserBean 객체에 setter로 삽입
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
			if(rs!=null)
				try{rs.close();}catch(SQLException sqle){}
		}
		
		return memberBean;
		
	}
	
	public void register(MemberBean member) {
		// 회원가입 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String referrer_email = null;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			if(member.getReferrer() != "") {
				referrer_email = search_referrer(member.getReferrer());
			}
			
			String birthday = member.getBirthday_year()+"-"+member.getBirthday_month()+"-"+member.getBirthday_day();
			
			String sql = "insert into member(email, password, nickname, nickname_latest_changed, birthday, phone, address, address_detail, referrer) values(?, ?, ?, now(), ?, ?, ?, ?, ?)";
			// 받아온 모든 정보를 DB에 저장하는 sql문
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, birthday);
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getAddress_detail());
			pstmt.setString(8, referrer_email);
			
			pstmt.executeUpdate();
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		
	}
	
	public String search_referrer(String referrer_nickname) {
		// 추천인의 정보를 저장하는 메소드
		// 닉네임은 변경 가능하기 때문에 닉네임에 대응하는 이메일을 검색하여 DB에 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String referrer_email = null;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select email from member where nickname=?";
			// 입력된 닉네임에 대응하는 이메일을 검색
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, referrer_nickname);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			referrer_email = rs.getString("email");
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		
		return referrer_email;
	}
	
	public boolean email_double_check(String email) {
		// 이메일 중복 확인 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select * from member where email=?";
			// 입력된 이메일과 똑같은 이메일을 사용하는 회원이 존재하는지 검색
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				// 결과 값이 null인 경우, 즉 이메일이 중복되지 않는 경우 true 반환
				check = true;
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		
		return check;
	}
	
	public boolean nickname_double_check(String nickname) {
		// 닉네임 중복 확인 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select * from member where nickname=?";
			// 입력된 닉네임과 똑같은 닉네임을 사용하는 회원이 존재하는지 검색
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				// 결과 값이 null인 경우, 즉 이메일이 중복되지 않는 경우 true 반환
				check = true;
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		
		return check; 
	}
	
	public void delete_member(String email) {
		// 회원탈퇴 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
		
			String sql = "delete from member where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			pstmt.executeUpdate();
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
	}
	
	public String find_email(String phone) {
		// 이메일 찾기 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select email from member where phone=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			email = rs.getString("email");
			
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
			if(rs!=null)
				try{rs.close();}catch(SQLException sqle){}
		}
		
		return email;
	}
	
	public String find_password(String email, String phone) {
		// 비밀번호 찾기 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select password from member where email=? and phone=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			password = rs.getString("password");
			
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
			if(rs!=null)
				try{rs.close();}catch(SQLException sqle){}
		}
		
		return password;
	}
	
	public void change_info(MemberBean member, String email) {
		// 회원 정보 수정 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String birthday = member.getBirthday_year()+"-"+member.getBirthday_month()+"-"+member.getBirthday_day();
			
			String sql = "update member set password=?, nickname=?, phone=?, birthday=?, address=?, address_detail=? where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, birthday);
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getAddress_detail());
			pstmt.setString(7, email);

			pstmt.executeUpdate();
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
	}
	
	public boolean password_check(String email, String password) {
		// 회원 정보 수정 시 비밀번호가 맞는지 확인하는 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);

			String sql = "select password from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			String password_sql = rs.getString("password");
			System.out.println(password_sql);
			
			if(password_sql.equals(password)) {
				check = true;
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
			if(rs!=null)
				try{rs.close();}catch(SQLException sqle){}
		} 

		return check;
	}
	
	public MemberBean load_info(String email) {
		// 정보수정시 정보로드 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean memberBean = new MemberBean();
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			String sql = "select nickname,nickname_latest_changed,birthday,phone,address,address_detail,referrer from member where email=?";
			// 파라미터 값으로 넘어온 이메일과 비밀번호에 해당되는 유저의 모든 정보를 불러오는 sql문
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			// 해당되는 result set은 한 개뿐이기 때문에 반복문을 사용하지 않음  
			SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
			String birthday = date_format.format(rs.getDate("birthday"));
			
			String birthday_string[] = birthday.split("-",3);
			
			memberBean.setNickname(rs.getString("nickname"));
			memberBean.setNickname_latest_changed(rs.getDate("nickname_latest_changed"));
			memberBean.setBirthday_year(birthday_string[0]);
			memberBean.setBirthday_month(birthday_string[1]);
			memberBean.setBirthday_day(birthday_string[2]);
			memberBean.setPhone(rs.getString("phone"));
			memberBean.setAddress(rs.getString("address"));
			memberBean.setAddress_detail(rs.getString("address_detail"));
			memberBean.setReferrer(rs.getString("referrer"));
			// 해당 회원의 모든 정보를 UserBean 객체에 setter로 삽입
			String address = rs.getString("address");
			
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement("select sido,sigungu,roadname,building1,building2,dongname,buildingname from zipcode where buildingcode=? limit 1");
			pstmt.setString(1, address);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			String sido = rs.getString("sido");
			String sigungu = rs.getString("sigungu");
			String roadname = rs.getString("roadname");
			int building1 = rs.getInt("building1");
			int building2 = rs.getInt("building2");
			String dongname = rs.getString("dongname");
			String buildingname = rs.getString("buildingname");
			
			String bar = "-";
			String building1s = "";
			String building2s = "";
			if(building1 > 0) {building1s = String.valueOf(building1);} else {building1s = "";}
			if(building2 > 0) {building2s = String.valueOf(building2);} else {building2s = "";bar = "";}
			if(dongname == null) {dongname = "";}
			if(buildingname == null) {buildingname = "";}
			
			String address_result_road = sido+" "+sigungu+" "+roadname+" "+building1s+bar+building2s+"("+dongname+", "+buildingname+")";
			address_result_road = address_result_road.trim().replaceAll(" +"," ");
			memberBean.setAddress_road(address_result_road);
			
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
			if(rs!=null)
				try{rs.close();}catch(SQLException sqle){}
		}
		return memberBean;
	}
	
	/* 사용하지않으나 참고용으로 남겨둠
	public String[][] search_address(String address_find) {
		// 주소검색 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String address_results[][] = null;
		int i = 0;
		
		try {
			conn = DriverManager.getConnection(jdbc_url, db_id, db_pwd);
			
			String sql = "select zipcode,sido,sigungu,roadname,building1,building2,dongname,buildingname,jibun1,jibun2,roadname_en,sigungu_en,sido_en"+
			" from zipcode"+
			" where zipcode regexp ?"+
			" and sido regexp ?"+
			" and sigungu regexp ?"+
			" and roadname regexp ?"+
			" and building1 regexp ?"+
			" and building2 regexp ?"+
			" and dongname regexp ?"+
			" and buildingname regexp ?"+
			" and jibun1 regexp ?"+
			" and jibun2 regexp ?";
			// 주소검색
			
			address_find = address_find.substring(0,50);
			address_find = address_find.trim().replaceAll(" +"," ");
			address_find = address_find.replace(" ","|");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address_find);
			pstmt.setString(2, address_find);
			pstmt.setString(3, address_find);
			pstmt.setString(4, address_find);
			pstmt.setString(5, address_find);
			pstmt.setString(6, address_find);
			pstmt.setString(7, address_find);
			pstmt.setString(8, address_find);
			pstmt.setString(9, address_find);
			pstmt.setString(10, address_find);
			rs = pstmt.executeQuery();
			
			String zipcode = rs.getString("zipcode");
			String sido = rs.getString("sido");
			String sigungu = rs.getString("sigungu");
			String roadname = rs.getString("roadname");
			String building1 = rs.getString("building1");
			String building2 = rs.getString("building2");
			String dongname = rs.getString("dongname");
			String buildingname = rs.getString("buildingname");
			String jibun1 = rs.getString("jibun1");
			String jibun2 = rs.getString("jibun2");
			String roadname_en = rs.getString("roadname_en");
			String sigungu_en = rs.getString("sigungu_en");
			String sido_en = rs.getString("sido_en");
			
			while(rs.next()) {
				address_results[i][0] = rs.getString("zipcode");
				address_results[i][1] = rs.getString("sido");
				address_results[i][2] = rs.getString("sigungu");
				address_results[i][3] = rs.getString("roadname");
				address_results[i][4] = rs.getString("building1");
				address_results[i][5] = rs.getString("building2");
				address_results[i][6] = rs.getString("dongname");
				address_results[i][7] = rs.getString("buildingname");
				address_results[i][8] = rs.getString("jibun1");
				address_results[i][9] = rs.getString("jibun2");
				address_results[i][10] = rs.getString("roadname_en");
				address_results[i][11] = rs.getString("sigungu_en");
				address_results[i][12] = rs.getString("sido_en");
				i++;
			}
			
			address_results[0][0] = "";
			
			address_results[0] = zipcode;
			address_results[1] = sido+" "+sigungu+" "+roadname+" "+building1+"-"+building2+"("+dongname+", "+buildingname+")";
			address_results[2] = sido+" "+sigungu+" "+dongname+" "+jibun1+"-"+jibun2+" "+buildingname;
			address_results[3] = building1+"-"+building2+", "+roadname_en+", "+sigungu_en+", "+sido_en;
			
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		return address_results;
	}
	*/
}