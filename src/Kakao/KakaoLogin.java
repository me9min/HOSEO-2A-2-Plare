package Kakao;
import java.io.*;
import java.net.*;
import javax.net.ssl.HttpsURLConnection;

public class KakaoLogin {
	private final String USER_AGENT = "Mozilla/5.0";
	private final String targetUrl = "https://kauth.kakao.com/oauth/token";
	
	public String kakaoHttpPost(String parameters) throws Exception {
		URL url = new URL(targetUrl);
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
		
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setDoOutput(true);
		
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(parameters);
		wr.flush();
		wr.close();
		
		int responseCode = con.getResponseCode();
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		return ("HTTP 응답 코드 : " + responseCode + "<br>HTTP body : " + response.toString());
	}
}