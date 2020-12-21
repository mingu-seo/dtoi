<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty authUser}">
<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->
<input type="button" value="로그인" onclick="location.href='/user/user/login.do?url=/board/index.do'">
</c:if>
<c:if test="${!empty authUser}">
${authUser.name }님 반갑습니다.
<input type="button" value="로그아웃" onclick="location.href='/user/user/logout.do'">
</c:if>
<input type="button" value="main" onclick="location.href='/user/';">
<input type="button" value="user" onclick="location.href='/user/user/index.do';">
<input type="button" value="board" onclick="location.href='/user/board/index.do';">