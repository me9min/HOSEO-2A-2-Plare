package Kakao;
import java.io.*;
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
import com.google.gson.stream.*;
import com.google.gson.internal.LinkedTreeMap;

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
	    params.add(new BasicNameValuePair("redirect_uri", "http://amel.zz.am/member/login/kakao_login.jsp"));
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
		Map<String,String> injson = new HashMap<String,String>();
		injson = (Map<String,String>) gson.fromJson(instring, injson.getClass());
		
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//get 메서드와 URL 설정
		HttpPost post = new HttpPost("https://kapi.kakao.com/v2/user/me");
		
		//agent 정보 설정
		post.addHeader("User-Agent", USER_AGENT);
		post.addHeader("Authorization", "Bearer "+injson.get("access_token"));
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
}