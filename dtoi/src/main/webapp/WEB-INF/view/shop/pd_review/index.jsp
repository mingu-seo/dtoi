<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="customer.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
function moveWrite() {
	<c:if test="${!empty authUser}">
	location.href='write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');
	</c:if>
	
}
</script>
</head>
<body>
<h2>게시판관리</h2>
<%@ include file="/WEB-INF/view/include/common.jsp" %>
<form action="index.do" id="frm">

<input type="text" name="searchWord" value="${param.searchWord }">
<input type="submit" value="검색">
</form>
${reqPage }/${totalPage } 

<br>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성일</td>
	</tr>
<c:forEach var="vo" items="${list}">
	<tr>
		<td>${vo.no }</td>
		<td><a href="detail.do?no=${vo.no }">${vo.title } [${vo.commentCount }]</a></td>
		<td>${vo.regdate }</td>
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

<a href="javascript:moveWrite();"><input type="button" value="등록"></a>

<br>
</body>
</html>








