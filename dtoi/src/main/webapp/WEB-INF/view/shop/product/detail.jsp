<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<td>메인 이미지</td>
		<td><a href="/common/download.jsp?path=/upload/&r_file=${vo.pd_image}" target="_blank">${vo.pd_image}</a></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td>${vo.pd_name}</td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td>${vo.pd_category}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${vo.pd_price }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${vo.pd_content }<a href="common/download.jsp?path=/upload/&r_file=${vo.pd_image}" target="_blank">${vo.pd_image}</a></td>
	</tr>
</table>

<input type="button" value="목록" onclick='location.href="index.do";'>

<form action="commentInsert.do" method="post">
<input type="hidden" name="pd_no" value="${vo.pd_no }">
<!--input type="hidden" name="user_no" value="${authUser.no }">  -->
<table border="1">
	<tr>
		<td>
			<textarea name="pd_content"></textarea>
		</td>
	</tr>
</table>
</form>

</body>
</html>