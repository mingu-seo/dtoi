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
<title>식단 칼로리 계산 페이지</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	$("#name").change(function(){
		$.ajax({
			url:'getFoodJson.do',
			cache : false,
			dataType:'json',
			data:{name:$('#name').val()},
			success:function(data){
				$.each(data, function(k,v){
					$("#calories").val(v.calories);
					$("#carbohydrate").val(v.carbohydrate);
					$("#fiber").val(v.fiber);
					$("#sugar").val(v.sugar);
					$("#protein").val(v.protein);
					$("#fat").val(v.fat);
					$("#sodium").val(v.sodium);
				});
			},
			error:function(data, status, error){
				console.log(status);
				console.log(error);
			}
		});
	});	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
음식이름(100g당) : <input id='name' name='name' type='text'><br>
칼로리(kal) :<input id='calories' name='calories' class='FoodNutrOutput' type='text'><br>
탄수화물(g) :<input id='carbohydrate' name='carbohydrate' class='FoodNutrOutput' type='text'><br>
식이섬유(g) :<input id='fiber' name='fiber' class='FoodNutrOutput' type='text'><br>
당(g) :<input id='sugar' name='sugar' class='FoodNutrOutput' type='text'><br>
단백질(g) :<input id='protein' name='protein' class='FoodNutrOutput' type='text'><br>
지방(g) :<input id='fat' name='fat' class='FoodNutrOutput' type='text'><br>
나트륨(mg) :<input id='sodium' name='sodium' class='FoodNutrOutput' type='text'><br>
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