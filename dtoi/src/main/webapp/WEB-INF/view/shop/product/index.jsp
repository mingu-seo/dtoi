<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>
<h2>상품 페이지</h2>
<%@ include file="/WEB-INF/view/include/common.jsp" %>
<form action="index.do" id="frm">

<input type="text" name="searchWord" value="${param.searchWord }">
<input type="submit" value="검색">
</form>
${reqPage }/${totalPage } 

<br>
<table border="1">
	<tr>
		<td>상품명</td>
		<td>상품가격</td>
		<td>카테고리</td>
		<td>상품 추천</td>
		<td>상품 내용</td>
	</tr>
<c:forEach var="vo" items="${list}">
	<tr>
		<td><a href="detail.do?pd_no=${vo.pd_no }">${vo.pd_name } </a></td>
		<td>${vo.pd_price }</td>
		<td>${vo.pd_category }</td>
		<td>${vo.pd_recom }</td>
		<td>${vo.pd_content }</td>
	</tr>
</c:forEach>
</table>
<c:if test="${startPage > 10}">
<a href="index.do?reqPage=${startPage-1 }&searchWord=${param.searchWord}">[이전]</a>
</c:if>
<c:forEach var="rp" begin="${startPage }" end="${endPage }">
<a href="index.do?reqPage=${rp }&searchWord=${param.searchWord}">[${rp }]</a>
</c:forEach>
<c:if test="${totalPage > endPage }">
<a href="index.do?reqPage=${endPage+1 }&searchWord=${param.searchWord}">[다음]</a>
</c:if>

<br>
</body>
</html>








