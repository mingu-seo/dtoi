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
<title>칼로리 사전 페이지</title>
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
					var cal = parseInt(v.calories);
					$("#calories").val(cal);
					$("#carbohydrate").val(v.carbohydrate);
					$("#fiber").val(v.fiber);
					$("#sugar").val(v.sugar);
					$("#protein").val(v.protein);
					$("#fat").val(v.fat);
					$("#sodium").val(v.sodium);
					var walking = 7.6;
					var running = 13.2;
					var jumping = 17.5;
					var cycling = 11;					
					$("#walking").text(parseInt(cal/walking));
					$("#running").text(parseInt(cal/running));
					$("#jumping").text(parseInt(cal/jumping));
					$("#cycling").text(parseInt(cal/cycling));
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
function itemSelect(no){
	$.ajax({
		url:'getFoodJson.do?',
		cache : false,
		dataType:'json',
		data:{fd_no:no},
		success:function(data){
			$.each(data, function(k,v){
				var cal = parseInt(v.calories);
				$("#name").val(v.name);
				$("#calories").val(cal);
				$("#carbohydrate").val(v.carbohydrate);
				$("#fiber").val(v.fiber);
				$("#sugar").val(v.sugar);
				$("#protein").val(v.protein);
				$("#fat").val(v.fat);
				$("#sodium").val(v.sodium);
				var walking = 7.6;
				var running = 13.2;
				var jumping = 17.5;
				var cycling = 11;					
				$("#walking").text(parseInt(cal/walking));
				$("#running").text(parseInt(cal/running));
				$("#jumping").text(parseInt(cal/jumping));
				$("#cycling").text(parseInt(cal/cycling));
				console.log("ajax executed")
			});
		},
		error:function(data, status, error){
			console.log(status);
			console.log(error);
		}
	});
}
function goSearch(){
	$("#searchForm").submit();
}
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
					<th colspan="2">빠른검색 <input id='name' name='name' type='text'></th>
					<th>칼로리(kal) :<input id='calories' name='calories' class='FoodNutrOutput' type='text' readonly="readonly"></th>
				</tr>
				<tr>
					<th>탄수화물(g) :<input id='carbohydrate' name='carbohydrate' class='FoodNutrOutput' type='text' readonly="readonly"></th>
					<th>식이섬유(g) :<input id='fiber' name='fiber' class='FoodNutrOutput' type='text' readonly="readonly"></th>
					<th>당(g) :<input id='sugar' name='sugar' class='FoodNutrOutput' type='text' readonly="readonly"></th>
				</tr>
				<tr>
					<th>단백질(g) :<input id='protein' name='protein' class='FoodNutrOutput' type='text' readonly="readonly"></th>
					<th>지방(g) :<input id='fat' name='fat' class='FoodNutrOutput' type='text' readonly="readonly"></th>
					<th>나트륨(mg) :<input id='sodium' name='sodium' class='FoodNutrOutput' type='text' readonly="readonly"></th>
				</tr>
			</table>
			</div>
			<div class="right">
				<img alt="운동 이미지" src="/dtoi/img/diet/exercise.png" class="exercise">
				<table class="exercise">
					<tr class="img"><th></th><th></th></tr>
					<tr class="name"><th>걷기</th><th>달리기</th></tr>
					<tr class="min"><th><span id="walking"></span> 분</th><th><span id="running"></span> 분</th></tr>
					<tr class="padding"></tr>
					<tr class="img"><th></th><th></th></tr>
					<tr class="name"><th>줄넘기</th><th>자전거</th></tr>
					<tr class="min"><th><span id="jumping"></span> 분</th><th><span id="cycling"></span> 분</th></tr>
				</table>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${empty param.searchWord}">
				<h3 class="sub_title">검색 순위 TOP 30</h3>
			</c:when>
			<c:otherwise>
				<h3 class="sub_title">검색 결과</h3>
			</c:otherwise>
		</c:choose>
		
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
				<c:forEach var="vo" items="${list}" varStatus="status">
					<tr style='cursor:pointer;' onclick="itemSelect(${vo.fd_no});">
						<td class="rank">${status.count}</td>
						<td class="Ranking_name">${vo.name }</td>
						<td class=""></td>
						<td class="">${vo.calories }</td>
						<td class="" >${vo.searchCount }</td>
					</tr>						
				</c:forEach>					
				</tbody>
			</table>
			
			<c:choose>
				<c:when test="${empty param.searchWord}"></c:when>
				<c:otherwise>
					<div class="pagenate clear">								
						<c:if test="${startPage > 10}">
							<a href="index.do?reqPage=${startPage-1 }&searchWord=${param.searchWord}">[이전]</a>
						</c:if>
						<c:forEach var="rp" begin="${startPage }" end="${endPage }">
							<a href="index.do?reqPage=${rp }&searchWord=${param.searchWord}">[${rp }]</a>
						</c:forEach>
						<c:if test="${totalPage > endPage }">
							<a href="index.do?reqPage=${endPage+1 }&searchWord=${param.searchWord}">[다음]</a>
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
			
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="index.do">
					<span class="searchWord">
						<input type="text" name="searchWord" value="${param.searchWord }">
						<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
					</span>
				</form>
			</div>				
			
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