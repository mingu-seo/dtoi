<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
<c:if test="${!empty msg}">
	alert('${msg}');
</c:if>
	$(function() {
		$("form input[type='button']").click(function(){
			if ($("#ad_id1").val().trim() == '') {
				alert('아이디를 입력하세요');
				$("#ad_id").focus();
				return false;
			}
			if ($("#ad_pwd1").val().trim() == '') {
				alert('비밀번호를 입력하세요');
				$("#ad_pwd1").focus();
				return false;
			}
			// 폼전송
			$(".loginFrm").submit();
		});
	});
</script>

</head>
<body>
<h2>관리자 로그인</h2>
<form action="login.do" method="post" class="loginFrm">
<input type="hidden" name="url" value="${param.url }"/>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="ad_id" id="ad_id1">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="ad_pwd" id="ad_pwd1">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="로그인">
		</td>
	</tr>
</table>
</form>
</body>
</html>