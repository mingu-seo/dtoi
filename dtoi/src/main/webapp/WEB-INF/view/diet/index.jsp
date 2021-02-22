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
<title>음식 칼로리 페이지</title>
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
					console.log("ajax executed")
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

<div class="sub">
	<div class="size">
		<div class="topcontents">
			<div class="left">
			<table border="1">
				<tr>
					<th>빠른검색 <input id='name' name='name' type='text'></th>
					<th>칼로리(kal) :<input id='calories' name='calories' class='FoodNutrOutput' type='text'></th>
				</tr>
				<tr>
					<th>탄수화물(g) :<input id='carbohydrate' name='carbohydrate' class='FoodNutrOutput' type='text'></th>
					<th>식이섬유(g) :<input id='fiber' name='fiber' class='FoodNutrOutput' type='text'></th>
					<th>당(g) :<input id='sugar' name='sugar' class='FoodNutrOutput' type='text'></th>
				</tr>
				<tr>
					<th>단백질(g) :<input id='protein' name='protein' class='FoodNutrOutput' type='text'></th>
					<th>지방(g) :<input id='fat' name='fat' class='FoodNutrOutput' type='text'></th>
					<th>나트륨(mg) :<input id='sodium' name='sodium' class='FoodNutrOutput' type='text'></th>
				</tr>
			</table>
			</div>
			<div class="right">
				
			</div>
		</div>
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="index.do">
					<span class="searchWord">							
						<input type="text" name="searchWord" value="${param.searchWord }">
						<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
					</span>
				</form>					
			</div>				
		
		<h3 class="sub_title">검색 순위 TOP 30</h3>
		<div class="bbs">
			<table class="list">
				<colgroup>
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
					<col width="80px" />
				</colgroup>
				<thead>
				<tr>
					<th scope="col">순위</th>
					<th scope="col">음식</th>
					<th scope="col"></th>
					<th scope="col">칼로리</th> 
					<th scope="col">검색횟수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${list}">
					<tr style='cursor:pointer;' onclick="location.href='detail.do?bb_no=${vo.fd_no }'">
						<td class="rank">${vo.fd_no }</td>
						<td class="Ranking_name">${vo.name }</td>
						<td class="writer"></td>
						<td class="date">${vo.calories }</td>
						<td class="hit" >${vo.searchCount }</td>
					</tr>						
				</c:forEach>					
				</tbody>
			</table>	
			
		</div>
	</div>
</div>
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