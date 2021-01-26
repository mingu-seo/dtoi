<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>
<script>

function OpenWinCount(URL,width,height) {

	var str,width,height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,";
	str=str+"width="+width;
	str=str+",height="+height+"',top=100,left=100";

	window.open(URL,'remote',str);
}

$(window).load(function(){
	// 1depth 메뉴들
	var parent = $(".parent");
	
	//현재 주소
	// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
	var curUrl = document.location.pathname;
	curUrl = curUrl.substring(curUrl.indexOf("manage")+12,curUrl.length);
	if (curUrl.indexOf("/") > 0) {
		curUrl = curUrl.substring(curUrl,curUrl.indexOf("/"));
	}
	parent.each(function(){
		$(this).find("span").removeClass("bg");

		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		// 주소중 manage이후 폴더 경로 자르기 ex) /admin/board/index.jsp -> board
		href = href.substring(href.indexOf("admin")+6,href.length);
		href = href.substring(href,href.indexOf("/"));
		
		// 현재 주소에서 href가 포함 되어 있으면 그 메뉴에 배경색 지정
		if(curUrl == href){
			$(this).find("span").addClass("bg");
		}
	});
	
	// 방문자 통계 클릭시 메뉴 유지
	parent.click(function(){
		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		if(href.indexOf("OpenWinCount") >= 0){
			parent.find("span").removeClass("bg");
			$(this).find("span").addClass("bg");
		}
	});
	
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1>DtoI</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
				<li class="frist"><a href="#" onclick="">Home</a></li>
				<c:if test="${empty authUser}">
					<li><a href='/dtoi/customer/login.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>'>LogIn</a></li>
				</c:if>
				<c:if test="${!empty authUser}">
					<li><span style="color:white">${authUser.cst_id }님 반갑습니다.</span></li>
					<li><a href="<%=request.getContextPath()%>/customer/logout.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>">LogOut</a></li>
				</c:if>
				
				
				

			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="<%=request.getContextPath()%>/admin/member/index.do" class="parent"><span>마이페이지</span></a>
  					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/board/index.do"><span>개인정보 수정</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/reply/index.do"><span>식단 입력</span></a></li>
					</ul>
					</div>
  				</li>
				<li><a href="<%=request.getContextPath()%>/admin/product/index.do" class="parent"><span>상품 주문/조회</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/board/index.do"><span>상품목록</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/reply/index.do"><span>상품 주문 내역 조회</span></a></li>
					</ul>
					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/board/index.do" class="parent"><span>게시판</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/board/index.do"><span>공지사항</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/reply/index.do"><span>답변게시판</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/board/index.do"><span>FAQ</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/bulletin_board/index.do"><span>자유게시판</span></a></li>
					</ul>
					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/admin/index.do" class="parent"><span>고객센터</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/board/index.do"><span>1:1 문의</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/reply/index.do"><span>자주묻는질문</span></a></li>						
					</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->