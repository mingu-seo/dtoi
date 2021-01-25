<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "uWCnorqY_RmfpwdmwSj_";
String redirectURI = URLEncoder.encode("http://localhost:8080/dtoi/sns/naver/naverCallback.jsp");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script>
$(function() {
	$("#naverLogin").click(function() {
		window.open('<%=apiURL%>','naverLogin','width=400,height=400');
	});
});
</script>
</head>
<body>

<a href="javascript:;" id="naverLogin">네이버 로그인</a>
</body>
</html>