<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="customer.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="board.faq.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>dtoi 마이페이지</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
</head>
<script>
function detail() {
	location.href='<%=request.getContextPath()%>/customer/detail.do?cst_no=${authUser.cst_no }';
}
</script>
<script>
function del() {
		if (confirm('정말 탈퇴하시겠습니까?')) {
			$.ajax({
			url:'/dtoi/customer/delete.do',
			data:{cst_no:${vo.cst_no}},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(res) {
			//console.log(data);
			if (res == 'true') {
			alert('정상적으로 탈퇴되었습니다.');
			location.href="${param.url}";
							
			} else {
			alert('탈퇴 오류');
		}
	}
 });
 }
}


</script>

<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
				
	<div class="sub">
		<div class="size">
			<h3 class="sub_title">마이페이지</h3>
			<h5 class="sub_title"><%CustomerVo authUser = (CustomerVo)session.getAttribute("authUser");%>
				<% if (authUser == null) { %>
				<% } %>
				<% if (authUser != null) { %>
				<%=authUser.getCst_name() %>님 안녕하세요!
				<% } %></h5>
				<div class="bbs">
					<div class="movie">
					<div class="tab_area" id="product_info">
						<ul class ="tab_menu">
							<li>
								<a href="<%=request.getContextPath()%>/customer/food.do?cst_no=${authUser.cst_no }" onclick="tab_move('0'); return false;" >식단입력 내역</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/mycart.do?cst_no=${authUser.cst_no }" onclick="tab_move('1'); return false;" >내 장바구니</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/myqna.do?cst_no=${authUser.cst_no }" onclick="tab_move('2'); return false;">나의 질문</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/mypost.do?cst_no=${authUser.cst_no }" onclick="tab_move('3'); return false;">내가 쓴 글</a>
							</li>
							
							
						</ul>
					</div>
				</div>
			</div>
			</div>
					<div class="btnSet clear">
					<div><a href="javascript:detail();" class="btn" id="submitBtn">내 정보</a> 
					<a href="javascript:del();" class="btn" id="submitBtn">회원탈퇴</a>
					</div>
			</div>
			</div>
				
					
					
				
						

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>