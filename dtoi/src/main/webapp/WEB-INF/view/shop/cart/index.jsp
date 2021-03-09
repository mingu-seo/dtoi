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

//수량 변경
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
		count_save($(".cart_no").eq(idx).val(), $(".ct_count").eq(idx).val());
	});
	
	$(".minus_btn").click(function() {
		var idx = $(".minus_btn").index($(this));
		var v = Number($(".ct_count").eq(idx).val());
		
		if (v > 1) {
			$(".ct_count").eq(idx).val(v-1);
		}
		$(".cal_price").eq(idx).text(Number($(".ct_count").eq(idx).val()) * Number($(".pd_price").eq(idx).val()));
		total();
		count_save($(".cart_no").eq(idx).val(), $(".ct_count").eq(idx).val());
	});
	
	$(".each_del_btn").click(function() {
		var idx = $(".each_del_btn").index($(this));
		var v = Number($(".ct_count").eq(idx).val());
		
		if (v > 1) {
			$(".ct_count").eq(idx).val(1);
		}
		$(".cal_price").eq(idx).text(Number($(".ct_count").eq(idx).val()) * Number($(".pd_price").eq(idx).val()));
		total();
		count_save($(".cart_no").eq(idx).val(), 1);
	});
});

//전체 가격
function total() {
	var total = 0;
	$(".cal_price").each(function(idx, val) {
		//console.log(idx, val);
		total += Number($(".cal_price").eq(idx).text());	
	});
	$(".total_price").text(total);
	$(".last_price").text((total+3000));
}

//수량 DB저장
function count_save(cart_no, ct_count) {
	$.ajax({
		url : "/dtoi/cart/update.do",
		data : {cart_no:cart_no, ct_count:ct_count}, 
		async : true,
		success : function(data) {
			},
		error : function(msg) {
				console.log(msg);
				}
			});
}



//전체 & 개별선택
$(function() {
	$(".all_select").click(function() {
		if ($(this).prop('checked')) {
			$(".cartIdx").prop('checked',true);
		} else {
			$(".cartIdx").prop('checked',false);
		}
	});
});

//선택상품 삭제
function cart_all_del() {
	
	var cnt = 0;
	$('.cartIdx').each(function() {
		if ($(this).prop("checked") == true) cnt += 1;		
	});
	if (cnt == 0) {
		alert('장바구니 상품을 하나 이상 선택해 주세요');
		return false;
	} else {
		if (confirm('선택한 장바구니 상품을 삭제하시겠습니까?')) {
			$("#frmCart").attr("action","cartDelete.do");
			$("#frmCart").submit();	
		}
	}
}
//선택상품 주문
function cart_buy() {
	var cnt = 0;
	$('.cartIdx').each(function() {
		if ($(this).prop("checked") == true) cnt += 1;		
	});
	if (cnt == 0) {
		alert('장바구니 상품을 하나 이상 선택해 주세요');
		return false;
	} else {
		if (confirm('선택한 장바구니 상품을 주문하시겠습니까?')) {
			$("#frmCart").attr("action","/dtoi/order/index.do");
			$("#frmCart").submit();	
		}
	}
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
						<input type="checkbox" id="allCheck" class="all_select" checked="checked">
						<label for="allCheck" style="cursor: pointer;">전체선택</label>
					</div>
					<form class="cart-form" method="post" id="frmCart" action="cartDelete.do">
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
								<p class="no_data"><strong>장바구니에 담긴 상품이 없습니다.</strong></p>
							</td>
						</tr>
					</c:if>
					<c:if test="${!empty clist}">	
					<c:forEach var="vo" items="${clist}">	
						<tr>
							<td>
								<div class="check">
									<input type="checkbox" class="cartIdx" checked name="cartNos" value="${vo.cart_no}">
								</div>
							</td>
							<td class="img">
								<a href="/dtoi/product/detail.do?=${vo.pd_no }" target="_blank" >
								<img src="/dtoi/upload/${vo.pd_image }" alt=""/>
								</a>
							</td>
							<td class="tal">
									<div class="name">
										<a href="/dtoi/product/detail.do?${vo.pd_no }" target="_blank"> ${vo.pd_name }</a>
									</div>
									<div class="qty">
										<a href="javascript:" ><img class="minus_btn" src="/dtoi/img/product/cart/count_down.png"></a>
										<input type="text" name="ct_count" class="ct_count" readonly value="${vo.ct_count }">
										<a href="javascript:" ><img  class="plus_btn" src="/dtoi/img/product/cart/count_up.png"></a>
										<input type="hidden" class="pd_price" value="${vo.pd_price }">
									</div>
									<input type="hidden" name="cart_no" class="cart_no" value="${vo.cart_no }">
							</td>
							<td class="qty">
								<strong class="cal_price" style=padding:20px;> ${vo.pd_price }</strong>원 &nbsp;
							</td>
							<td class="qty">
							<a href="javascript:"><img class="each_del_btn" src="/dtoi/img/product/cart/count_del.png"></a>
							</td>						                  
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
					</table>
					</form>

			</div>
			<!-- area_top -->
			
			<div class="area_bottom">
					<div class="total_cal">총 상품금액 <strong> <span class="total_price"> </strong> 원</span>
						<a class="cartplus"><img src="/dtoi/img/product/cart/order_price_plus.png"></a> 배송비 <span class="price"> <strong>3000</strong> 원</span>
						
						<a class="carttotal"><img src="/dtoi/img/product/cart/order_price_total.png"></a> 총 결제 금액 <strong> <span class="last_price"> </strong> 원</span>
					</div>
					<ul class="cart_btn" style="padding:20px;">
					<li class="box_btn">
					<a href="javascript:" onclick="cart_buy();">선택상품 주문</a>
					</li>
					<li class="box_btn">
					<a href="javascript:" onclick="cart_all_del();">선택상품 삭제</a>
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