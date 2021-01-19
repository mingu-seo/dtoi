<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty authUser}">
<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->
<input type="button" value="로그인" onclick="location.href='/dtoi/customer/login.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>'">
</c:if>
<c:if test="${!empty authUser}">
${authUser.cst_name}님 반갑습니다.
<input type="button" value="로그아웃" onclick="location.href='/dtoi/customer/logout.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>'">
</c:if>
<input type="button" value="메인창" onclick="location.href='/dtoi/';">
<input type="button" value="고객정보" onclick="location.href='/dtoi/customer/index.do';">
<input type="button" value="자유게시판" onclick="location.href='/dtoi/bulletin_board/index.do';">
<input type="button" value="상품후기 게시판" onclick="location.href='/dtoi/pdreview/index.do';">


<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->



