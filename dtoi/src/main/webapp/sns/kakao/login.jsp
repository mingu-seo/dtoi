<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 카카오 로그인 API S -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
<a href="#;" id="kakaoBtn">카카오 로그인</a>

</body>
</html>