package Bean;

import java.util.*;
import java.sql.*;
import java.text.*;
import javax.sql.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.*;
import Bean.MemberBean;
import Bean.Database;
import com.RemoveTag;

public class Member {
	private static Member instance = new Member();
	//.jsp페이지에서 DB연동빈인 MemberBean클래스의 메소드에 접근시 필요
	public static Member getInstance() {
		return instance;
	}
	RemoveTag rt = new RemoveTag();
	
	public MemberBean login(MemberBean member) {
		// 로그인 메소드
		Connection conn = Database.connect();
		MemberBean memberBean = new MemberBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
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
	
	public void register(MemberBean member) throws Exception {
		// 회원가입 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		String referrer_email = null;
		
		try {
			if(member.getReferrer() != "") {
				referrer_email = search_referrer(member.getReferrer());
			}
			
			String birthday = member.getBirthday_year()+"-"+member.getBirthday_month()+"-"+member.getBirthday_day();
			
			String sql = "insert into member(email, password, nickname, nickname_latest_changed, birthday, phone, address, address_detail, referrer) values(?, ?, ?, now(), ?, ?, ?, ?, ?)";
			// 받아온 모든 정보를 DB에 저장하는 sql문
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, rt.removeHtmlTag(member.getNickname()));
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
		// 추천인의 정보를 불러오는 메소드
		// 닉네임은 변경 가능하기 때문에 닉네임에 대응하는 이메일을 검색하여 DB에 저장해야하기 때문에 이 메소드를 사용함
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String referrer_email = null;
		
		try {
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
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
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
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		
		try {
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
	
	public boolean delete_member(String email, String pw) {
		// 회원탈퇴 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean success = false;
		
		try {
			pstmt = conn.prepareStatement("select password from member where email=?");
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			String cpw = rs.getString("password");
			
			if(pw == cpw) {
				pstmt = conn.prepareStatement("delete from member where email=?");
				pstmt.setString(1, email);
				
				pstmt.executeUpdate();
				
				success = true;
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		return success;
	}
	
	public String find_email(String nickname) {
		// 이메일 찾기 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		
		try {
			String sql = "select email from member where nickname=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			
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
	
	public String find_password(String email) {
		// 비밀번호 찾기 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		
		try {
			String sql = "select password from member where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
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
	
	public void change_info(MemberBean member, String email) throws Exception {
		// 회원 정보 수정 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;

		try {
			String birthday = member.getBirthday_year()+"-"+member.getBirthday_month()+"-"+member.getBirthday_day();
			
			String sql = "update member set password=?, nickname=?, phone=?, birthday=?, address=?, address_detail=? where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, rt.removeHtmlTag(member.getNickname()));
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
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			String sql = "select password from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			String password_sql = rs.getString("password");
			
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
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean memberBean = new MemberBean();
		
		try {
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
			
			pstmt = conn.prepareStatement("select zipcode,sido,sigungu,roadname,building1,building2,dongname,buildingname from zipcode where buildingcode=? limit 1");
			pstmt.setString(1, address);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			String zipcode = rs.getString("zipcode");
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
			memberBean.setZipcode(zipcode);
			
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
	
	public StringBuffer emailCode(String email) {
		// 이메일 인증 코드를 발송하고 랜덤하게 생성된 코드를 반환하는 메소드
		String host = "smtp.naver.com";
        String user = "plare2019_2a02"; //자신의 네이버 계정
        String password = "int=hell";//자신의 네이버 패스워드
        
        //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<5;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        //email 전송
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "Plare"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            //메일 제목
            msg.setSubject("Plare 비밀번호 찾기 인증 메일입니다.");
            //메일 내용
            msg.setText("인증 번호는 " + temp + " 입니다.");
            
            Transport.send(msg);
            System.out.println("인증 번호 이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        return temp;
	}
	
	public void tempPassword(String email) {
		// 이메일 인증 코드를 발송하고 랜덤하게 생성된 코드를 반환하는 메소드
		String host = "smtp.naver.com";
		String user = "plare2019_2a02"; //자신의 네이버 계정
		String password = "int=hell";//자신의 네이버 패스워드
        
        //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        //email 전송
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "Plare"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            //메일 제목
            msg.setSubject("Plare 임시 비밀번호 발급 이메일입니다.");
            //메일 내용
            msg.setText("임시 비밀번호는 " + temp + " 입니다. 해당 비밀번호를 사용하여 로그인해주세요.");
            
            Transport.send(msg);
            System.out.println("임시 비밀번호 이메일 전송");
            
            Connection conn = Database.connect();
    		PreparedStatement pstmt = null;
			
			String sql = "update member set password=? where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.toString());
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	/* 사용하지않으나 참고용으로 남겨둠
	public String[][] search_address(String address_find) {
		// 주소검색 메소드
		connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String address_results[][] = null;
		int i = 0;
		
		try {
			conn = DriverManager.getconnection(jdbc_url, db_id, db_pwd);
			
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