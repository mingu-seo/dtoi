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
		<td>${vo.cst_no }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${vo.cst_name }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${vo.cst_id }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${vo.cst_email }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${vo.cst_tel }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td> ${vo.addr1 } ${vo.addr2 }</td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td>${vo.zipcode }</td>
	</tr>
	<tr>
		<td>가입일</td>
		<td>${vo.cst_regdate }</td>
	</tr>
</table>
<input type="button" value="회원정보 수정" onclick='location.href="edit.do?cst_no=${vo.cst_no}";'>
<input type="button" value="회원탈퇴" onclick="del();">
<script>
function del() {
	if (confirm('정말 삭제하시겠습니까?')) {
		$.ajax({
			url:'/customer/customer/delete.do',
			data:{cst_no:${vo.cst_no}},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(res) {
				//console.log(data);
				if (res == 'true') {
					alert('정상적으로 탈퇴되었습니다.');
					location.href='/customer/customer/index.do';
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