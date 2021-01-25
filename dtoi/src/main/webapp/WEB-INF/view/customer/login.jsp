<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
<c:if test="${!empty msg}">
	alert('${msg}');
</c:if>
	$(function() {
		$("form input[type='button']").click(function(){
			if ($("#cst_id").val().trim() == '') {
				alert('아이디를 입력하세요');
				$("#cst_id").focus();
				return false;
			}
			if ($("#cst_pwd").val().trim() == '') {
				alert('비밀번호를 입력하세요');
				$("#cst_pwd").focus();
				return false;
			}
			// 폼전송
			$(".loginFrm").submit();
		});
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
			<input type="text" name="cst_id" id="cst_id">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="cst_pwd" id="cst_pwd">
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