<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty authUser}">
<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->
<input type="button" value="로그인" onclick="location.href='/dtoi/customer/login.do?url=/customer/index.do'">
</c:if>
<c:if test="${!empty authUser}">

<input type="button" value="로그아웃" onclick="location.href='/dtoi/customer/logout.do'">
</c:if>
<input type="button" value="main" onclick="location.href='/dtoi/';">
<input type="button" value="customer" onclick="location.href='/dtoi/customer/index.do';">
<input type="button" value="bulletin_board" onclick="location.href='/dtoi/bulletin_board/index.do';">
<input type="button" value="pd_review" onclick="location.href='/dtoi/pd_review/index.do';">

