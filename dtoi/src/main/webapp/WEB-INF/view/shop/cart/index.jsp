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
					<form>
					<input type="hidden" name="cst_no" value="${authUser.cst_no }">
					<input type="hidden" name="cart_no" value="${cart_no }">
					<input type="hidden" name="pd_no" value="${pd_no }">
					
					</form>
					<caption class="hidden">장바구니</caption>
					<colgroup>
						<col style="width:110px;">
						<col>
						<col style="width:142px;">
						<col style="width:56px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2">상품</th>
							<th scope="col">가격</th>
							<th scope="col"></th>
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
							<td class="img">
								<div class="check"colspan="1">
								<input type="checkbox" class="cartIdxs">
								</div>
								<a href="/dtoi/product/detail.do?${vo.pd_no }" target="_blank" >
								<img src="/dtoi/upload/" alt=""/>
								</a>
							</td>
							<td class="tal">
								<form class="cart-form">
		
									<div class="name">
										<a href="/dtoi/product/detail.do?${vo.pd_no }" target="_blank"> ${vo.pd_no }</a>
									</div>
									<div class="qty">
										<a href="javascript:" onclick="ct_countFunc('minus');" ><img src="/dtoi/img/product/cart/count_down.png"></a>
										<input type="text" name="ct_count" id="ct_count" readonly value="1">
										<a href="javascript:" onclick="ct_countFunc('plus');" ><img src="/dtoi/img/product/cart/count_up.png"></a>
									</div>
								</form>
							</td>
							<td class="qty">
								<strong id="total_price" style=padding:20px;> ${vo.pd_price }</strong>원 &nbsp;
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
					<div class="orderCart__total__calc">
						<span class="calc__total"> 총 상품금액 <span class="price"><strong> 0</strong>원</span></span>
						<span class="calc__deli">+ 배송비 <span class="price"><strong>3000</strong>원</span></span>
					</div>

					<div class="orderCart__total__cont">
						<p class="orderCart__total__txt">총 결제 예정금액</p>
					</div>
					<ul class="cart_btn">
					<li class="box_btn">
					<a href="javascript:" onclick="choose_buy();">선택상품 주문</a>
					</li>
					<li class="box_btn">
					<a href="javascript:" onclick="choose_del();">선택상품 삭제</a>
					</li>
					<li class="box_btn">
					<a href="javascript:" onclick="cart_all_del()();">장바구니 비우기</a>
					</li>
				</ul>

			</div>
			
			

			<div class="pagenate clear">
			</div>
		</div>
		<!-- bbs -->
	</div>
</div>
<script>
function ct_countFunc(type) {
	var v = Number($("#ct_count").val());
	if (type == 'minus') {
		if (v > 1) {
			$("#ct_count").val(v-1);
		}
	} else if (type == 'plus'){
		if (v < 10) {
			$("#ct_count").val(v+1);
		} else {
			alert("더 이상 주문할 수 없습니다.");
		}
	} else {
		if (0 < v) {
			$("#ct_count").val(v*0+1);
		}
	}
	$("#total_price").text(Number($("#ct_count").val()) * ${vo.pd_price });
}

function ct_list() {
	//상품 리스트 확인
	<c:if test="${!empty cartList}">
	</c:if>
	<c:if test="${empty cartList}">
	</c:if>	
	// 



</script>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>