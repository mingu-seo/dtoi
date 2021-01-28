<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<!DOCTYPE html>
<%
String client_id = "mBXwunle4aCgU4nIy3Pi";
String redirectURI = URLEncoder.encode("http://localhost:8080/dtoi/sns/naver/naverCallback.jsp");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
<c:if test="${!empty msg}">
	alert('${msg}');
</c:if>
	$(function() {
		$("form input[type='button']").click(function(){
			if ($("#cst_id1").val().trim() == '') {
				alert('아이디를 입력하세요');
				$("#cst_id").focus();
				return false;
			}
			if ($("#cst_pwd1").val().trim() == '') {
				alert('비밀번호를 입력하세요');
				$("#cst_pwd1").focus();
				return false;
			}
			// 폼전송
			$(".loginFrm").submit();
		});
	});
</script>
<script>
$(function() {
	$("#naverLogin").click(function() {
		window.open('<%=apiURL%>','naverLogin','width=400,height=400');
	});
});
</script>
<script type='text/javascript'>
$(function() {
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('53bc1d6b243db7dc8d16a9b9aed747b4');
    
    /*
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    */
    
    $("#kakaoBtn").click(function() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.loginForm({
			success: function(authObj) {
           		console.log(JSON.stringify(authObj));

				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res) {
				
						console.log('kakao id : '+res.id);
						console.log('kakao email : '+res.kakao_account.email);
						console.log('kakao birthday : '+res.kakao_account.birthday);
						console.log('kakao gender : '+res.kakao_account.gender);
						console.log('kakao nickname : ' +res.properties['nickname']);
				
				 	},
				 	fail: function(error) {
						alert(JSON.stringify(error));
				 	}
				});
			},
			fail: function(err) {
			  alert(JSON.stringify(err));
			}
        });
    });
  //]]>
});
</script>
</head>
<body>
<h2>회원 로그인</h2>
<form action="login.do" method="post" class="loginFrm">
<input type="hidden" name="url" value="${param.url }"/>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="cst_id" id="cst_id1">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="cst_pwd" id="cst_pwd1">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="로그인">
		</td>
	</tr>
</table>

<img src="/dtoi/gallery/naverlogin.PNG" id="naverLogin"
alt="네이버로그인" width="250" height="65" align="center" border="0"><br>
<body>
<img src="/dtoi/gallery/kakaologin.png" id="kakaoBtn"
alt="카카오로그인" width="250" height="65" align="center" border="0"><br>
<body>

</body>
</form>
</body>
</html>