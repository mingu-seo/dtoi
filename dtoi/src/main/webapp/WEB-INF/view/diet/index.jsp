<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="customer.*" %>
<%@ page import="diet.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes"> 
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>음식영양정보조회페이지</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$("#food").change(function(){
		alert("changed");
	});	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
음식입력 : <input id='food' type='text'><br>
칼로리 :<input id='calo' class='FoodNutrOutput' type='text'><br>
탄수화물 :<input id='carb' class='FoodNutrOutput' type='text'><br>
식이섬유 :<input id='fibe' class='FoodNutrOutput' type='text'><br>
당 :<input id='sugar' class='FoodNutrOutput' type='text'><br>
단백질 :<input id='prot' class='FoodNutrOutput' type='text'><br>
지방 :<input id='fat' class='FoodNutrOutput' type='text'><br>
나트륨 :<input id='sodi' class='FoodNutrOutput' type='text'><br>
    
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
<%
// 세션객체 가져오기
CustomerVo authUser = (CustomerVo)session.getAttribute("authUser");
%>
<% if (authUser == null) { %>
로그인전
<% } %>
<% if (authUser != null) { %>
<%=authUser.getCst_name() %>님 안녕하세요!
<% } %>
</body>
</html>