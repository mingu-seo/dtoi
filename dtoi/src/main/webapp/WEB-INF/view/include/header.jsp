<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>DtoI</title>

<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="customer.CustomerVo" %>


<script type="text/javascript" src="/dtoi/js/swiper.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
<%
String client_id = "mBXwunle4aCgU4nIy3Pi";
String redirectURI = URLEncoder.encode("http://localhost:8080/dtoi/sns/naver/naverCallback.jsp");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>



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
	if ( $("#cst_id1").val().length < 1 ) {
		alert("아이디를 입력해주세요.");
		$("#cst_id").focus();
		return false;
	}
	if ( $("#cst_pwd1").val().length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		$("#cst_pwd1").focus();
		return false;
	}
	var f = document.loginFrm;
	if (f.reg.checked) {
	   document.cookie = "cookie_cst_id1=" + $("#cst_id1").val() + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_cst_id1=null;path=/;expires="+now;
	}
	return true;
}

function useremail_chk() {
	var f=document.loginFrm;
	var cst_id = CookieVal("cookie_cst_id1");
	
	if (cst_id=="null"){	
		f.cst_id.focus();
		f.cst_id.value="";
	} else {
		f.cst_pwd.focus();
		f.cst_id.value=cst_id;
		f.reg.checked=true;
		$("#cst_pwd1").focus();
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

function cartindex() {
	
	<c:if test="${!empty authUser}">
	location.href='<%=request.getContextPath()%>/cart/index.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');
	$(".login_info").toggle();
	useremail_chk();
	</c:if>	
}

function moveWrite2() {
	
	<c:if test="${!empty authUser}">
	location.href='<%=request.getContextPath()%>/customer/mypage.do?cst_no=${authUser.cst_no }';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');
	$(".login_info").toggle();
	useremail_chk();
	</c:if>	
}

$(function() {
	$("#naverLogin").click(function() {
		window.open('<%=apiURL%>','naverLogin','width=400,height=400');
	});
});

</script>
<script type='text/javascript'>
$(function() {
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('53bc1d6b243db7dc8d16a9b9aed747b4');
    
    /*
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    */
    
    $("#kakaoBtn").click(function() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.loginForm({
			success: function(authObj) {
           		console.log(JSON.stringify(authObj));

				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res) {
				
						console.log('kakao id : '+res.id);
						console.log('kakao email : '+res.kakao_account.email);
						console.log('kakao birthday : '+res.kakao_account.birthday);
						console.log('kakao gender : '+res.kakao_account.gender);
						console.log('kakao nickname : ' +res.properties['nickname']);

						
						var authUser = res.properties.nickname;
						 //window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/dtoi/sns/kakao/kakocallback.jsp?cst_name="+authUser);
						 $.ajax({
							 url : "/dtoi/sns/kakao/kakaocallback.jsp?cst_name="+authUser,
							 success:function(data) {
								 location.reload();
							 }
						 });
				 	},
				 	fail: function(error) {
						alert(JSON.stringify(error));
				 	}
				});
			},
			fail: function(err) {
			  alert(JSON.stringify(err));
			}
        });
    });
  //]]>
});
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
                      <a id="login_click">로그인</a>
                    
                    <a href="<%=request.getContextPath()%>/customer/write.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>&param=<%=request.getQueryString() %>">회원가입</a>
               </c:if>
               <c:if test="${!empty authUser}">     
<<<<<<< HEAD
                	<a href="<%=request.getContextPath()%>/customer/logout.do">로그아웃</a>

 

=======
                	<a href="<%=request.getContextPath()%>/customer/logout.do">로그아웃</a>
>>>>>>> branch 'master' of https://github.com/mingu-seo/dtoi.git
                    <a href="<%=request.getContextPath()%>/customer/edit.do?cst_no=${authUser.cst_no }&url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>">마이페이지</a>

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/mingu-seo/dtoi.git
               </c:if>
                </div>
                

                <form action="/dtoi/customer/login.do" id="loginFrm" name="loginFrm" method="post" onsubmit="return loginCheck();">
                <input type="hidden" name="url" value="<%=request.getAttribute("javax.servlet.forward.request_uri")%>"/>
                <input type="hidden" name="param" value="<%=request.getQueryString() %>"/>
                <div class="login_info">
                	<div class="top_area"><img src="/dtoi/img/user/btn_del.gif"/></div>
                	<div class="title_area"><span>DtoI 로그인</span></div>
                	<div class="middle_area">
                		<div class="input_area">
                			<input type="text" id="cst_id1" name="cst_id" placeholder="아이디"/>
                			<input type="password" id="cst_pwd1" name="cst_pwd" placeholder="비밀번호"/>
                		</div>
                		<div class="login_btn">
                			<input type="submit" value="로그인"/><br>
                		</div>
                		<div class ="sns_btn">
                			<img src="/dtoi/gallery/naverlogin.PNG" id="naverLogin" alt="네이버로그인" vspace = "5" hspace="10" width="200" height="50" align="left" border="20"><br>
							<img src="/dtoi/gallery/kakaologin.png" id="kakaoBtn" alt="카카오로그인" vspace = "2" hspace="10" width="200" height="50" align="left" border="20">
                		</div>
                	</div>
                	<div class="bottom_area">
                		<input type="checkbox" id="reg" name="reg"/><label for="reg">아이디 저장</label>&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
                		<a href="/dtoi/customer/idsearch.do">아이디찾기</a>&nbsp;/&nbsp;<a href="/dtoi/customer/pwdsearch.do">비밀번호 찾기</a>
                	</div>
                </div>
                </form>

            </div>
        </div>
        <div class="head_bot">
            <div class="size">
                <div class="gnb">
                    <ul class="depth1 clear">
                        <li>
                            <a href="<%=request.getContextPath()%>" class="parent"><span>마이페이지</span></a>
                            <ul class="depth2">
                                <li><a href="javascript:moveWrite2();"><span>마이페이지</span></a></li>
                                <li><a href="<%=request.getContextPath()%>"><span>식단 입력</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/diet/index.do" class="parent"><span>칼로리사전</span></a>
                            <ul class="depth2">
                                <li><a href="<%=request.getContextPath()%>/diet/index.do"><span>칼로리사전</span></a></li>
                                <li><a href="<%=request.getContextPath()%>/diet/calculate.do"><span>하루 칼로리 섭취량</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/product/index.do" class="parent"><span>DtoI 샐러드</span></a>
                            <ul class="depth2">
								<li><a href="<%=request.getContextPath()%>/product/index.do"><span>전체상품</span></a></li>
								<li><a href="javascript:cartindex();"><span>장바구니</span></a></li>
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
                               	<li><a href="<%=request.getContextPath()%>/board/qna/index.do"><span>1:1 문의</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
