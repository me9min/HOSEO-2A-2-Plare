package kakao;
import java.io.*;
import java.net.*;
import javax.net.ssl.HttpsURLConnection;

public class kakaoLogin {
	private final String USER_AGENT = "Mozilla/5.0";
	
	String targetUrl = "https://kauth.kakao.com/oauth/token";
	String parameters = "code";
	
	kakaoLogin.kakaoHttpPost(targetUrl, parameters);
	
	private void kakaoHttpPost(String targetUrl, String parameters) throws Exception {
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
		
		System.out.println("HTTP 응답 코드 : " + responseCode);
		System.out.println("HTTP body : " + response.toString());
	}
}