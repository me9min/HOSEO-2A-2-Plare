package Kakao;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import com.google.gson.*;
import Bean.Database;

public class KakaoLogin {
	
	private static final String USER_AGENT = "Mozila/5.0";
	
	public static String getToken(String code) throws ClientProtocolException, IOException {
		
		System.out.println("---카카오 로그인 시작---");
		
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//get 메서드와 URL 설정
		HttpPost post = new HttpPost("https://kauth.kakao.com/oauth/token");
		
		//agent 정보 설정
		post.addHeader("User-Agent", USER_AGENT);
		post.addHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
	    params.add(new BasicNameValuePair("grant_type", "authorization_code"));
	    params.add(new BasicNameValuePair("client_id", "f4b335bfa37a8ce098ed450312b37a35"));
	    params.add(new BasicNameValuePair("redirect_uri", "http://amel.kro.kr/member/login/kakao_login.jsp"));
	    params.add(new BasicNameValuePair("code", code));
	    post.setEntity(new UrlEncodedFormEntity(params));
		
		//get 요청
		CloseableHttpResponse httpResponse = httpClient.execute(post);
		
		System.out.println("GET Response Status");
		System.out.println(httpResponse.getStatusLine().getStatusCode());
		String res = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
		
		httpClient.close();
		
		Gson gson = new Gson();
		JsonObject tokens = (JsonObject) gson.fromJson(res, JsonObject.class);
		
		System.out.println(res);	//디버그
		System.out.println("getToken메소드 종료");
		System.out.println("");
		
		return tokens.get("access_token").getAsString();
	}
	
	public static String getProfile(String access_token) throws ClientProtocolException, IOException {
		
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//get 메서드와 URL 설정
		HttpPost post = new HttpPost("https://kapi.kakao.com/v2/user/me");
		
		//agent 정보 설정
		post.addHeader("User-Agent", USER_AGENT);
		post.addHeader("Authorization", "Bearer "+access_token);
		post.addHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//get 요청
		CloseableHttpResponse httpResponse = httpClient.execute(post);
		
		System.out.println("GET Response Status");
		System.out.println(httpResponse.getStatusLine().getStatusCode());
		String res = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
		
		httpClient.close();
		
		System.out.println(res);	//디버그
		System.out.println("getProfile메소드 종료");
		System.out.println("");
		
		return res;
	}
	
	public void logoutKakao(String access_token) throws ClientProtocolException, IOException {
		
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//get 메서드와 URL 설정
		HttpPost post = new HttpPost("https://kapi.kakao.com/v1/user/logout");
		
		//agent 정보 설정
		post.addHeader("User-Agent", USER_AGENT);
		post.addHeader("Authorization", "Bearer "+access_token);
		
		//get 요청
		CloseableHttpResponse httpResponse = httpClient.execute(post);
		
		System.out.println("GET Response Status");
		System.out.println(httpResponse.getStatusLine().getStatusCode());
		String res = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
		
		httpClient.close();
		
		System.out.println("로그아웃된"+res);	//디버그
		System.out.println("logoutKakao메소드 종료");
		System.out.println("");
	}
	
	public String loginMemberKakao(String kakaoid) throws SQLException {
		
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = null;
		
		try {
			
			pstmt = conn.prepareStatement("select email from member where kakaoid=?");
			pstmt.setString(1, kakaoid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				email = (String) rs.getString("email");
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
		rs.close();
		
		return email;
	}
	
	public int updateMemberKakao(String email, String kakaoid, String kakaoimg) throws SQLException {
		
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res = 0;
		
		try {
			
			pstmt = conn.prepareStatement("call update_member_kakao(?,?,?)");
			pstmt.setString(1, email);
			pstmt.setString(2, kakaoid);
			pstmt.setString(3, kakaoimg);
			
			rs = pstmt.executeQuery();
			res = rs.getInt("error");
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
		
		System.out.println(email);
		System.out.println(kakaoid);
		System.out.println(kakaoimg);
		System.out.println(res);
		
		return res;
	}
}