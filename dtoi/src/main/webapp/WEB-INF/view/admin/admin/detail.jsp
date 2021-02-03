<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<td>회원번호</td>
		<td>${vo.ad_no }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${vo.ad_name }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${vo.ad_id }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${vo.ad_email }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${vo.ad_tel }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td>${vo.ad_regdate }</td>
	</tr>
</table>
<input type="button" value="회원정보 수정" onclick='location.href="edit.do?ad_no=${vo.ad_no}";'>
<input type="button" value="회원탈퇴" onclick="del();">
<script>
function del() {
	if (confirm('정말 탈퇴하시겠습니까?')) {
		$.ajax({
			url:'/dtoi/admin/delete.do',
			data:{ad_no:${vo.ad_no}},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(res) {
				//console.log(data);
				if (res == 'true') {
					alert('정상적으로 탈퇴되었습니다.');
					location.href="${param.url}";
				} else {
					alert('탈퇴 오류');
				}
			}
		});
	}
}
</script>
</body>
</html>