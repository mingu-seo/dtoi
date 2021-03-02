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
		<h3 class="sub_title">주문서 / 결제</h3>
	
			<div class="bbs"> 
				<div class="area_top">

				
					<table class="tbl_col prd">
					<form>
					<input type="hidden" name="cst_no" value="${authUser.cst_no }">
					<input type="hidden" name="cart_no" value="${cart_no }">
					<input type="hidden" name="pd_no" value="${pd_no }">
					
					</form>
					<caption class="hidden">주문서 / 결제</caption>
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
										
										<input type="text" name="ct_count" id="ct_count">
										
									</div>
								</form>
							</td>
							<td class="qty">
								<strong id="total_price" style=padding:20px;> ${vo.pd_price }</strong>원 &nbsp;
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
			</div>
			<div class="area_bottom">
			<h3 class="sub_title">주문자 정보</h3>
				<table>
					<tr>
						<th scope="row"><span>주문자 이름</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
					<tr>
						<th scope="row"><span>전화번호</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
					<tr>
						<th scope="row"><span>이메일</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
				</table>
			</div>
			<div class="area_bottom">
			<h3 class="sub_title">배송지 정보</h3>
			<table>
					<tr>
						<th scope="row"><span>배송지</span></th>
						<td><input type="radio" value="직접입력">직접입력</td>
						<td><input type="radio" value="주문자 정보와 동일">주문자 정보와 동일</td>
					</tr>
					<tr>
						<th scope="row"><span>받는분 이름</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
					<tr>
						<th scope="row"><span>받는분 전화번호</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
					<tr>
						<th scope="row"><span>배송주소</span></th>
						<td>
							<input type="button" value="우편번호" onclick="zip_api();" class="btn bgGray" style="float:left;">
							<input type="text" name="zipcode" id="zipcode" size="5" readonly value="${vo.zipcode }" >
							<input type="text" name="addr1" id="addr1" readonly class="wid50" maxlength="15" style="float:left;" value="${vo.addr1 }">
							<input type="text" name="addr2" id="addr2" class="wid200" style="float:left;" value="${vo.addr2 }">
						</td>
					</tr>
					<tr>
						<th scope="row"><span>배송 요청사항</span></th>
						<td><input type="text" style="float:left;"></td>
					</tr>
			</table>
			</div>
			<div class="area_bottom">
			<h3 class="sub_title">결제 정보</h3>
			<table>
					<tr>
						<th scope="row">일반 결제</th>
						<td><input type="radio" value="무통장 입금">무통장입금</td>
						<td>입금자명: <input type="text" style="float:left;"></td>
						<td>입금은행: <select name="bank" size="1" >
							<option value="농협">농협 212-175684-25431 Dtoi</option>
						</td>
					</tr>
			</table>
			</div>
			
			<div class="btnSet"  style="text-align:center;">
				<a class="btn" href="order/complete.do?or_no=${vo.or_no }">결제하기 </a>
			</div>

			<div class="pagenate clear">
			</div>
		</div>
		<!-- bbs -->
	</div>
</div>
<script>
$(function() {
	if ($("#cst_tel").val().trim() == '') {
		alert('연락처를 입력해 주세요');
		$("#cst_tel").focus();
		return false;
	}
	if ($("#zipcode").val().trim() == '') {
		alert('우편번호를 입력해 주세요');
		$("#zipcode").focus();
		return false;
	}
	if ($("#addr1").val().trim() == '') {
		alert('주소를 입력해 주세요');
		$("#addr1").focus();
		return false;
	}
}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function zip_api() {
        new daum.Postcode({
            oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                    addr += ' '+extraAddr;
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('zipcode').value = data.zonecode;
                $("#zipcode").val(data.zonecode);
                //document.getElementById("addr1").value = addr;
                $("#addr1").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("addr2").focus();
                $("#addr2").focus();
            }
        }).open();
    }
</script>


   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>