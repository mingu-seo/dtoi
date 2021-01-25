<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="customer.CustomerVo" %>
<%
String clientId = "mBXwunle4aCgU4nIy3Pi";
String clientSecret = "0Rpp_rZ5I9";
String code = request.getParameter("code");
String state = request.getParameter("state");
String redirectURI = URLEncoder.encode("YOUR_CALLBACK_URL", "UTF-8");
String apiURL;
apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";
JSONObject obj = new JSONObject();

try {
	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	con.setRequestMethod("GET");
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if(responseCode==200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else {  // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer res = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
	}
	br.close();
	if(responseCode==200) {
		//out.println(res.toString());
		JSONParser parser = new JSONParser();
		obj = (JSONObject) parser.parse(res.toString());
		access_token = (String) obj.get("access_token");
	}
} catch (Exception e) {
	out.println(e);
}

// 사용자 정보 조회
String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
try {
	String userUrl = "https://openapi.naver.com/v1/nid/me";
	URL url = new URL(userUrl);
	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	con.setRequestMethod("GET");
	con.setRequestProperty("Authorization", header);
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if(responseCode==200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else {  // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer res = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
	}
	br.close();
	System.out.println(res.toString());
	JSONParser parser = new JSONParser();
	obj = (JSONObject) parser.parse(res.toString());
} catch (Exception e) {
	System.out.println(e);
}

JSONObject resJson = (JSONObject) obj.get("response");
CustomerVo uv = new CustomerVo();
uv.setCst_name((String)resJson.get("cst_name"));
uv.setCst_email((String)resJson.get("cst_email"));
uv.setCst_id((String)resJson.get("cst_id"));

// 세션 저장
session.setAttribute("authUser", uv);
%>
이름 : <%=(String)resJson.get("cst_name")%><br/>
이메일 : <%=(String)resJson.get("cst_email")%><br/>
ID : <%=(String)resJson.get("cst_id")%><br/>
성별 : <%=(String)resJson.get("cst_gender")%><br/>
생일 : <%=(String)resJson.get("cst_birthday")%><br/>
<script>
opener.location.href="/dtoi/customer/index.do";
window.close();
</script>