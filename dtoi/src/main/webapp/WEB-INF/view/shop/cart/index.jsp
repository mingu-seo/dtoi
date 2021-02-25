<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>DtoI</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(function() {
	total();
	$(".plus_btn").click(function() {
		var idx = $(".plus_btn").index($(this));
		var v = Number($(".ct_count").eq(idx).val());
		
		if (v < 10) {
			$(".ct_count").eq(idx).val(v+1);
		}
		$(".cal_price").eq(idx).text(Number($(".ct_count").eq(idx).val()) * Number($(".pd_price").eq(idx).val()));
		total();
	});
	
	$(".minus_btn").click(function() {
		var idx = $(".minus_btn").index($(this));
		var v = Number($(".ct_count").eq(idx).val());
		
		if (v > 1) {
			$(".ct_count").eq(idx).val(v-1);
		}
		$(".cal_price").eq(idx).text(Number($(".ct_count").eq(idx).val()) * Number($(".pd_price").eq(idx).val()));
		total();
	});
});

function total() {
	var total = 0;
	$(".cal_price").each(function(idx, val) {
		//console.log(idx, val);
		total += Number($(".cal_price").eq(idx).text());	
	});
	$(".total_price").text(total);
	$(".last_price").text((total+3000));
}

</script>
</head>
<body>
 <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
<div class="sub">
	<div class="size">
		<h3 class="sub_title">장바구니</h3>
	
			<div class="bbs"> 
				<div class="area_top">

					<div class="check_all">
						<input type="checkbox" id="allCheck" onclick="cartIdxs">
						<label for="allCheck" style="cursor: pointer;">전체선택</label>
					</div>
				
					<table class="tbl_col prd">
					<caption class="hidden">장바구니</caption>
					<colgroup>
						<col style="width:50px;">
						<col style="width:160px;">
						<col style="">
						<col style="width:120px;">
						<col style="width:60px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">  </th>
							<th scope="col">상품</th>
							<th scope="col">가격</th>
							<th scope="col">  </th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty clist}">
						<tr>
							<td class="tal" colspan="4">
								<p class="no_data">장바구니에 담긴 상품이 없습니다.</p>
							</td>
						</tr>
					</c:if>
					<c:if test="${!empty clist}">	
					<c:forEach var="vo" items="${clist}">		
						<tr>
							<td>
								<div class="check">
									<input type="checkbox" class="cartIdxs">
								</div>
							</td>
							<td class="img">
								<a href="/dtoi/product/detail.do?=${vo.pd_no }" target="_blank" >
								<img src="/dtoi/upload/${vo.pd_image }" alt=""/>
								</a>
							</td>
							<td class="tal">
								<form class="cart-form">
		
									<div class="name">
										<a href="/dtoi/product/detail.do?${vo.pd_no }" target="_blank"> ${vo.pd_name }</a>
									</div>
									<div class="qty">
										<a href="javascript:" ><img class="minus_btn" src="/dtoi/img/product/cart/count_down.png"></a>
										<input type="text" name="ct_count" class="ct_count" readonly value="1">
										<a href="javascript:" ><img  class="plus_btn" src="/dtoi/img/product/cart/count_up.png"></a>
										<input type="hidden" class="pd_price" value="${vo.pd_price }">
									</div>
								</form>
							</td>
							<td class="qty">
								<strong class="cal_price" style=padding:20px;> ${vo.pd_price }</strong>원 &nbsp;
							</td>
							<td class="qty">
							<a href="javascript:" onclick="ct_countFunc('del');" ><img src="/dtoi/img/product/cart/count_del.png"></a>
							</td>						                  
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
					</table>
					

			</div>
			<!-- area_top -->
			
			<div class="area_bottom">
					<div class="total_cal">총 상품금액 <strong> <span class="total_price"> </strong> 원</span>
						<a class="cartplus"><img src="/dtoi/img/product/cart/order_price_plus.png"></a> 배송비 <span class="price"> <strong>3000</strong> 원</span>
						
						<a class="carttotal"><img src="/dtoi/img/product/cart/order_price_total.png"></a> 총 결제 금액 <strong> <span class="last_price"> </strong> 원</span>
					</div>
					<ul class="cart_btn" style="padding:20px;">
					<li class="box_btn">
					<a href="javascript:"  onclick="choose_buy();">선택상품 주문</a>
					</li>
					<li class="box_btn">
					<a href="javascript:" onclick="choose_del();">선택상품 삭제</a>
					</li>
					<li class="box_btn">
					<a href="javascript:" onclick="cart_all_del();">장바구니 비우기</a>
					</li>
				</ul>

			</div>
			
			

		</div>
		<!-- bbs -->
	</div>
</div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>