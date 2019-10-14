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
		
		System.out.println(res);	//디버그
		System.out.println("getToken메소드 종료");
		System.out.println("");
		
		return res;
	}
	
	public static String getProfile(String instring) throws ClientProtocolException, IOException {
		
		Gson gson = new Gson();
		JsonObject injson = (JsonObject) gson.fromJson(instring, JsonObject.class);
		 
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//get 메서드와 URL 설정
		HttpPost post = new HttpPost("https://kapi.kakao.com/v2/user/me");
		
		//agent 정보 설정
		post.addHeader("User-Agent", USER_AGENT);
		post.addHeader("Authorization", "Bearer "+injson.get("access_token").getAsString());
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
	
	public void loginMemberKakao(String kakaoid) {
		
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	}
	
	public void logoutKakao(String kakaoid) {
		
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	}
	
	public void updateMemberKakao(String email, String kakaoid, String kakaoimg) {
		
		Connection conn = Database.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select kakaoid from member where email=?");
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			rs.next();
			String member_kakaoid = rs.getString("kakaoid");
			
			if(true) {
				pstmt = conn.prepareStatement("update member set kakaoid=?, kakako_profile_image=? where email=?");
				if(member_kakaoid == null) {
					
					pstmt.setString(1, kakaoid);
					pstmt.setString(2, kakaoimg);
					pstmt.setString(3, email);
				} else {
					pstmt.setString(1, null);
					pstmt.setString(2, null);
					pstmt.setString(3, email);
				}
				pstmt.executeUpdate();
			}
		} catch(SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			if(pstmt!=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn!=null)
				try{conn.close();}catch(SQLException sqle){}
		}
	}
}