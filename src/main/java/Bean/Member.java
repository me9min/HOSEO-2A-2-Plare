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
	
	public String steamidCheck(String email) {
		//스팀연동체크
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String steamid = null;
		
		try {
			pstmt = conn.prepareStatement("select steamid from member where email=?");
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			
			rs.next();
			steamid = rs.getString("steamid");
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
		return steamid;
	}
	
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
			
			rs.next();
			String cpw = rs.getString("password");
			
			if(pw.equals(cpw)) {
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
			String sql = "select nickname,nickname_latest_changed,birthday,phone,address,address_detail,referrer,kakaoid,kakako_profile_image from member where email=?";
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
			memberBean.setKakaoid(rs.getString("kakaoid"));
			memberBean.setKakako_profile_image(rs.getString("kakako_profile_image"));
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
	
	public boolean admin_check(String email) {
		// 로그인한 회원이 관리자 권한이 있는 계정인지 검사하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			String sql = "select flag from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			String flag = rs.getString("flag");
			
			if(flag != null) {
				if(flag.equals("z") || flag.equals("b")) {
					check = true;
				}
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
	
	public StringBuffer emailCode(String email) {
		// 이메일 인증 코드를 발송하고 랜덤하게 생성된 코드를 반환하는 메소드
		String host = "smtp.naver.com";
        String user = "plare2019_2a02"; //자신의 네이버 계정
        String password = "int=hell"; //자신의 네이버 패스워드
        
        //SMTP 서버 정보를 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성
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
            
            //메일 제목, MimeUtility를 이용하여 인코딩을 UTF-8로 바꾸어 한글 깨짐 방지
            msg.setSubject("Plare 비밀번호 찾기 인증 메일입니다.", "UTF-8");
            //메일 내용, charset을 UTF-8로 바꾸어 한글 깨짐 방지
            msg.setContent("인증 번호는 " + temp + " 입니다.", "text/html; charset=UTF-8");
            
            Transport.send(msg);
            System.out.println("인증 번호 이메일 전송");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return temp;
	}
	
	public void tempPassword(String email) {
		// 랜덤하게 생성된 임시 비밀번호를 이메일로 전송하는 메소드
		String host = "smtp.naver.com";
		String user = "plare2019_2a02"; //자신의 네이버 계정
		String password = "int=hell"; //자신의 네이버 패스워드
        
        //SMTP 서버 정보를 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성
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
            
            //메일 제목, MimeUtility를 이용하여 인코딩을 UTF-8로 바꾸어 한글 깨짐 방지
            msg.setSubject("Plare 임시 비밀번호 발급 이메일입니다.", "UTF-8");
            //메일 내용, charset을 UTF-8로 바꾸어 한글 깨짐 방지
            msg.setContent("임시 비밀번호는 " + temp + " 입니다. 해당 비밀번호를 사용하여 로그인해주세요.", "text/html; charset=UTF-8");
            
            Transport.send(msg);
            System.out.println("임시 비밀번호 이메일 전송");
            
            Connection conn = Database.connect();
    		PreparedStatement pstmt = null;
			
			String sql = "update member set password=? where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, temp.toString());
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void addCard(MemberBean card) throws Exception {
		// 카드 정보를 저장하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into member_card(email, card_bank, card_num, card_date, card_cvc, card_password) "
					+ "values(?, ?, ?, ?, ?, ?)";
			// 받아온 모든 정보를 DB에 저장하는 sql문
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, card.getEmail());
			pstmt.setString(2, card.getCard_bank());
			pstmt.setString(3, card.getCard_num());
			pstmt.setString(4, card.getCard_date());
			pstmt.setString(5, card.getCard_cvc());
			pstmt.setString(6, card.getCard_password());
			
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
	
	public boolean deleteCard(int id) {
		// 등록된 카드를 삭제하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		boolean success = false;
		
		try {
			pstmt = conn.prepareStatement("delete from member_card where id=?");
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();
				
			success = true;
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
	
	public int getCardCount(String email) {
		// 해당 회원의 이메일로 등록된 카드의 개수를 구하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			String sql = "select count(*) from member_card where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			count = rs.getInt(1);
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

		return count;
	}
	
	public MemberBean getLastCard(String email) {
		// 해당 회원이 등록한 카드의 정보를 리스트로 리턴하는 메소드
		Connection conn = Database.connect();
		MemberBean memberBean = new MemberBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member_card where email=? order by id desc limit 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			memberBean.setId(rs.getInt("id"));
			memberBean.setEmail(rs.getString("email"));
			memberBean.setCard_bank(rs.getString("card_bank"));
			memberBean.setCard_num(rs.getString("card_num"));
			memberBean.setCard_date(rs.getString("card_date"));
			memberBean.setCard_cvc(rs.getString("card_cvc"));
			memberBean.setCard_password(rs.getString("card_password"));
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
	
	public MemberBean getCard(int id) {
		// 해당 회원이 등록한 카드의 정보를 리스트로 리턴하는 메소드
		Connection conn = Database.connect();
		MemberBean memberBean = new MemberBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member_card where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			memberBean.setId(rs.getInt("id"));
			memberBean.setEmail(rs.getString("email"));
			memberBean.setCard_bank(rs.getString("card_bank"));
			memberBean.setCard_num(rs.getString("card_num"));
			memberBean.setCard_date(rs.getString("card_date"));
			memberBean.setCard_cvc(rs.getString("card_cvc"));
			memberBean.setCard_password(rs.getString("card_password"));
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
	
	public List<MemberBean> getCards(String email, int start, int end) {
		// 해당 회원이 등록한 카드의 정보를 리스트로 리턴하는 메소드
		Connection conn = Database.connect();
		List<MemberBean> cardList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member_card where email=? order by id limit ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cardList = new ArrayList<MemberBean>();
				do {
					MemberBean card = new MemberBean();
					card.setId(rs.getInt("id"));
					card.setEmail(rs.getString("email"));
					card.setCard_bank(rs.getString("card_bank"));
					card.setCard_num(rs.getString("card_num"));
					card.setCard_date(rs.getString("card_date"));
					card.setCard_cvc(rs.getString("card_cvc"));
					card.setCard_password(rs.getString("card_password"));
					
					cardList.add(card);
				} while(rs.next());
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
		
		return cardList;
	}
	
	public boolean hasPayPassword(String email) {
		// 결제 비밀번호를 설정했는지 boolean 값을 리턴하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			String sql = "select pay_password from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			if(rs.getString("pay_password") != null) {
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
	
	public void addPayPassword(String email, String password) throws Exception {
		// 결제 비밀번호를 설정하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set pay_password=? where email=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			
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
	
	public boolean payPasswordCheck(String email, String password) {
		// 신용카드 간편 결제 시 결제 비밀번호가 맞는지 확인하는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;

		try {
			String sql = "select pay_password from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();
			String password_sql = rs.getString("pay_password");
			
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
	
	public int getHistoryCount(String email) {
	      // 사용자의 결제 내역이 총 몇 개인지 가져오는 메소드 
	      Connection conn = Database.connect();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int count = 0;
	      
	      try {
	         String sql = "call history_selectCount(?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, email);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            count = rs.getInt(1);
	         }
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	      return count;   
	}
	
	public List<ShopBean> getHistoryList(String email, int start, int end) {
	      Connection conn = Database.connect();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<ShopBean> historyList = null;
	      
	      try {
	         pstmt = conn.prepareStatement("call history_selectHistory(?, ?, ?)");
	         pstmt.setString(1, email);
	         pstmt.setInt(2, start-1);
	         pstmt.setInt(3, end);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            historyList = new ArrayList<ShopBean>(end);
	            do {
	               ShopBean history = new ShopBean();
	               history.setId(rs.getInt("id"));
	               history.setPlayer_id(rs.getString("player_id"));
	               history.setItem_type(rs.getString("item_type"));
	               history.setItem_name(rs.getString("item_name"));
	               history.setUnique_id(rs.getString("unique_id"));
	               history.setDate_of_purchase(rs.getString("date_of_purchase"));
	               history.setPrice_of_purchase(rs.getString("price_of_purchase"));
	               
	               historyList.add(history);
	            } while(rs.next());
	         }
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	      return historyList;
	}
	
	public int getInventoryCount(String email, String category) {
		// 로그인한 사용자의 스팀 ID를 player_id로 가지고 있는 항목을 리턴하는 메소드
    	Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			if(category.equals("all")) {
				pstmt = conn.prepareStatement("call inventory_selectCount_all(?)");
				pstmt.setString(1, email);
			} else {
				if(category.equals("skin")) {
					category = "playerskin";
				} else if(category.equals("grenade")) {
					category = "grenadeskin";
				}
				pstmt = conn.prepareStatement("call inventory_selectCount(?, ?)");
				pstmt.setString(1, email);
				pstmt.setString(2, category);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return count;	
	}
	
	public String[] getInventoryId(String email, String category, int start, int end) {
    	// 로그인한 사용자의 스팀 ID를 player_id로 가지고 있는 항목을 리턴하는 메소드
    	Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] idList = new String[end];
		
		try {
			if(category.equals("all")) {
				pstmt = conn.prepareStatement("call inventory_selectId_all(?, ?, ?)");
				pstmt.setString(1, email);
				pstmt.setInt(2, start-1);
				pstmt.setInt(3, end);
			} else {
				if(category.equals("skin")) {
					category = "playerskin";
				} else if(category.equals("grenade")) {
					category = "grenadeskin";
				}
				pstmt = conn.prepareStatement("call inventory_selectId(?, ?, ?, ?)");
				pstmt.setString(1, email);
				pstmt.setString(2, category);
				pstmt.setInt(3, start-1);
				pstmt.setInt(4, end);
			}
			rs = pstmt.executeQuery();
			
			for(int i=0; rs.next(); i++) {
				idList[i] = rs.getString(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return idList;	
    }
	
	public void sellItem(String email, String id) {
		// 보유한 아이템을 되파는 메소드
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		
		try {
			String sql = "call inventory_sellItem(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
    
    public int InsertCart(String email, int mid) {
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int error = 3;
		
		try {
			String sql = "call cart_insertItem(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, mid);
			rs = pstmt.executeQuery();
			
			rs.next();
			error = rs.getInt("error");
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return error;	//0=성공, 1=이미구매한아이템, 2=이미장바구니에있는아이템, 3=DB연결실패
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