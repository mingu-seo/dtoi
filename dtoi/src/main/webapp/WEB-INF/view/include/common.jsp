<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->

<input type="button" value="main" onclick="location.href='/customer/';">
<input type="button" value="customer" onclick="location.href='/customer/customer/index.do';">
<input type="button" value="bulletin_board" onclick="location.href='/customer/bulletin_board/index.do';">