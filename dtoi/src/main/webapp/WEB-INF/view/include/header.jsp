<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/dtoi/js/swiper.min.js"></script>
<script>

$(function() {
	$(".depth1 > li").mouseover(function(){
		$(this).find(".depth2").stop().slideDown(100);
	});
	$(".depth1 > li").mouseleave(function(){
		$(this).find(".depth2").stop().slideUp(100);
	});
	$("#login_click").click(function() {
		$(".login_info").toggle();
		useremail_chk();
	});
	$(".login_info > .top_area > img").click(function() {
		$(".login_info").hide();
	});
	
});

//로그인, 이메일 체크
function loginCheck(){
	if ( $("#loginEmail").val().length < 1 ) {
		alert("이메일을 입력해주세요.");
		$("#loginEmail").focus();
		return false;
	}
	if ( $("#loginPw").val().length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		$("#loginPw").focus();
		return false;
	}
	var f = document.loginFrm;
	if (f.reg.checked) {
	   document.cookie = "cookie_useremail=" + $("#loginEmail").val() + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_useremail=null;path=/;expires="+now;
	}
	return true;
}

function useremail_chk() {
	var f=document.loginFrm;
	var useremail = CookieVal("cookie_useremail");
	
	if (useremail=="null"){	
		f.loginEmail.focus();
		f.loginEmail.value="";
	} else {
		f.loginPw.focus();
		f.loginEmail.value=useremail;
		f.reg.checked=true;
		$("#loginPw").focus();
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}	



</script>
	<div id="header">
        <div class="head_top">
            <div class="size">
                <div class="header_call">
                    <div class="txt">
                        <a href=""></a>
                    </div>
                </div>
                <h1 class="logo"><a href="/dtoi/index.do"><img src="/dtoi/img/user/DtoI.png"/></a></h1>
               <div class="util clear">
                <c:if test="${empty authUser}">
                    <a href="<%=request.getContextPath()%>/customer/login.do" id="login_click">로그인</a>
                    <a href="">회원가입</a>
               </c:if>
               <c:if test="${!empty authUser}">
                	<a href="<%=request.getContextPath()%>/customer/logout.do">로그아웃</a>
                    <a href="">마이페이지</a>
               </c:if>
                </div>
               
            </div>
        </div>
        <div class="head_bot">
            <div class="size">
                <div class="gnb">
                    <ul class="depth1 clear">
                        <li>
                            <a href="<%=request.getContextPath()%>" class="parent"><span>마이페이지</span></a>
                            <ul class="depth2">
                                <li><a href="<%=request.getContextPath()%>"><span>개인정보 수정</span></a></li>
                                <li><a href="<%=request.getContextPath()%>"><span>식단 입력</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/product/index.do" class="parent"><span>상품 목록</span></a>
                            <ul class="depth2">
								<li><a href="<%=request.getContextPath()%>"><span>상품 주문/조회하기</span></a></li>
								<li><a href="<%=request.getContextPath()%>"><span>상품 주문 내역 조회</span></a></li>
                            </ul>
                        </li>
                        <li>
                           <a href="<%=request.getContextPath()%>/board/notice/index.do" class="parent"><span>게시판</span></a>
                            <ul class="depth2">
                                <li><a href="<%=request.getContextPath()%>/board/notice/index.do"><span>공지사항</span></a></li>
								<li><a href="<%=request.getContextPath()%>/board/bulletin_board/index.do"><span>자유게시판</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" class="parent"><span>고객센터</span></a>
                            <ul class="depth2">
								<li><a href="<%=request.getContextPath()%>/board/faq/index.do"><span>FAQ</span></a></li>
                               	<li><a href="<%=request.getContextPath()%>"><span>1:1 문의</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
