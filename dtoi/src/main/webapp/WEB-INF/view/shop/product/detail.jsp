<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
<%@ page import="board.faq.*" %>
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
			<h3 class="sub_title">상품 정보</h3>
			<div class="bbs">
				<div class="movie">
					<div class="info">
						<div class="img">
							<img src="/dtoi/upload/${vo.pd_image }" alt="" border="1"/>
						</div>
						<div class="movie_info">
							<dl>
								<dt class="title">
										${vo.pd_name }	
								</dt>
								<dt class="info_detail">
									<strong>가격</strong>&nbsp; ${vo.pd_price } 원
								</dt>
								<dt class="info_detail">
									<strong>카테고리</strong>&nbsp;  ${vo.pd_category }
								</dt>
								<dt class="info_detail">
									<strong>평점</strong>&nbsp;  ${vo.pd_recom }
								</dt>
								<dt class="info_detail">
									<strong>상품 정보</strong>&nbsp;  ${vo.pd_content }
								</dt>
								<dt class="qty">
									<strong>상품 수량</strong>&nbsp; 
									<a href="javascript:" onclick="ct_countFunc('minus');" ><img src="/dtoi/img/product/cart/count_down.png"></a>
									<input type="text" name="ct_count" id="ct_count" readonly value="1">
									<a href="javascript:" onclick="ct_countFunc('plus');" ><img src="/dtoi/img/product/cart/count_up.png"></a>
									
										<strong id="total_price" style=padding:20px;> ${vo.pd_price }</strong>원 &nbsp;
									    <a href="javascript:" onclick="ct_countFunc('del');" ><img src="/dtoi/img/product/cart/count_del.png"></a>
								</dt>
								<dt class="reser_btn" style="padding-bottom:5px">
									<input type="button" class="btn" style="cursor:pointer;" value="장바구니" onclick="goCart();"/>
									<input type="button" class="btn" style="cursor:pointer;" value="바로 구매" onclick="showDialogue('${vo.pd_no }');" />
								</dt>
							</dl>
						</div>
					</div>
		
				
					<div class="tab_area" id="product_info">
						<ul class ="tab_menu">
							<li>
								<a href="#product_info" onclick="tab_move('0'); return false;" class="active">제품 상세</a>
							</li>
							<li>
								<a href="#product_review" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#product_qna" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#order_guide" onclick="tab_move('3'); return false;" >주문 가이드</a>
							</li>
							
						</ul>
					</div>
		
					<!-- 제품 상세 -->
			<div class="bbs">
				<div class="movie" style="border-top:2px solid #fff; border-bottom:1px solid #fff;">
					<div class="info">
						<div class="movie_info2" style="margin-top:30px;">
							<dd> ${vo.pd_info}
							</dd>
						</div>
					</div>
				</div>
			</div>
	


					<div class="tab_area" id="product_review">
						<ul class ="tab_menu">
							<li>
								<a href="#product_info" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#product_review" onclick="tab_move('1'); return false;" class="active">제품 리뷰</a>
							</li>
							<li>
								<a href="#product_qna" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#order_guide" onclick="tab_move('3'); return false;" >주문 가이드</a>
							</li>
							
						</ul>
					</div>
					
					<!-- 제품리뷰 -->

			<div class="bbs">
			<table class="list">
			<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
			<form><input type="hidden" name="cst_no" value="${authUser.cst_no }"></form>
				
				<colgroup>
					
					<col width="80px" />
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
				
				</colgroup>
				<thead>
				<tr>
	
					<th scope="col" class="first">번호</th>
					<th scope="col">리뷰</th> 
					<th scope="col">작성자</th>
					<th scope="col">작성일</th> 
					
				</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${rlist}">							
					<tr style='cursor:pointer;' onclick="location.href='detail.do?re_no=${vo.re_no }'">
					
						<td class="first">${vo.re_no }</td>
						<td class="txt_l">${vo.re_title}</td>
						<td class="writer"> ${vo.cst_no }</td>
						<td class="date">${vo.re_regdate }</td>
						
					</tr>						
				</c:forEach>					
				</tbody>
			</table>	
							
			<div class="btnSet"  style="text-align:right;">
				<a class="btn" href="pdreview/write.do?pd_no=${vo.pd_no }">글쓰기 </a>
			</div>
				
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
	
	<!-- 상품 인덱스에 넣어서 조회수와 별점과 판매량순으로 정렬해서 볼수있게 변경예정  -->
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="index.do">
					<span class="srchSelect">
						<select name="searchType">
							<option value="" <c:if test="${param.searchType == 0 }">selected</c:if>>전체</option>
							<option value="1" <c:if test="${param.searchType == 1 }">selected</c:if>>제목만</option>
							<option value="2" <c:if test="${param.searchType == 2 }">selected</c:if>>내용만</option>
							<option value="3" <c:if test="${param.searchType == 3 }">selected</c:if>>작성자</option>
						</select>
					</span>
					<span class="searchWord">							
						<input type="text" name="searchWord" value="${param.searchWord }">
						<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
					</span>
					
				</form>					
			</div>				
		</div>

					<div class="tab_area" id="product_qna">
						<ul class ="tab_menu">
							<li>
								<a href="#product_info" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#product_review" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#product_qna" onclick="tab_move('2'); return false;" class="active">제품 문의</a>
							</li>
							<li>
								<a href="#order_guide" onclick="tab_move('3'); return false;" >주문 가이드</a>
							</li>
							
						</ul>
					</div>
					
					<!-- 제품 문의 -->
					<div class="bbs">
					<table class="list">
					<input type="hidden" name="cst_no" value="${authUser.cst_no }">
					<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
				
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${flist}" varStatus="status">
						<tr style='cursor:pointer;' onclick="showTr('${status.index}');">
						
							<td class="first">${vo.pdfaq_no }</td>
							<td class="txt_l">${vo.pdfaq_title}</td>
							<td class="writer"> ${vo.cst_no }</td>
							<td class="date">${vo.pdfaq_regdate }</td>
							<td class=""></td>
						</tr>
						<tr id="tr${status.index}" style="display:none;">
							<td class="first"></td>
							<td> </td>
							<td> </td>
							<td class="txt_l">${vo.pdfaq_contents }</td>
							<td> </td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="btnSet"  style="text-align:right;">
				<a class="btn" href="myPost.do">내가 작성한 글 </a>
				<a class="btn" href="pdfaq/write.do?pd_no=${vo.pd_no }">질문작성 </a>
				</div>
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
				<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="index.do">
					<span class="srchSelect">
						<select name="qna_section">
							<option value="" <c:if test="${param.qna_section == '' }">selected</c:if>>전체</option>
							<option value="1" <c:if test="${param.qna_section == '1' }">selected</c:if>>상품문의</option>
							<option value="2" <c:if test="${param.qna_section == '2' }">selected</c:if>>반품문의</option>
							<option value="3" <c:if test="${param.qna_section == '3' }">selected</c:if>>기타문의</option>
						</select>
					</span>
					<span class="searchWord">
						<input type="text" name="searchWord" value="${param.searchWord }">
						<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
					</span>						
				</form>					
			</div>
				
			</div>
						
					<div class="tab_area" id="order_guide">
						<ul class ="tab_menu">
							<li>
								<a href="#product_info" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#product_review" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#product_qna" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#order_guide" onclick="tab_move('3'); return false;" class="active">주문 가이드</a>
							</li>
							
						</ul>
					</div>
		
					<!-- 주문 가이드 -->	
			<div class="bbs">
			
				<table class="tbl_row guide" cellspacing="0" cellpadding="0">
					<colgroup>
						<col style="width:276px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
						 <th scope="row"> 배송안내</th>
						 <td>
						 	<ul>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 	</ul>
						 </td>
						</tr>
						<tr>
						 <th scope="row"> 교환/반품(환불)안내</th>
						 <td>
						 	<ul>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 	</ul>
						 </td>
						</tr>
						<tr>
						 <th scope="row"> 결제 완료 후 주문취소</th>
						 <td>
						 	<ul>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 	</ul>
						 </td>
						</tr>
						<tr>
						 <th scope="row"> 소비자보호 예외조항</th>
						 <td>
						 	<ul>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 		<li><strong>배송지역 : 국내 지역, 일부 해외 지역</strong></li>
						 	</ul>
						 </td>
						</tr>
					</tbody>
				</table>		
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


function moveWrite() {
	<c:if test="${!empty authUser}">
	location.href='/dtoi/shop/product/pdreview/write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 작성가능합니다.');	
	$(".login_info").toggle();
	$('html, body').scrollTop(0);
	useremail_chk();
	</c:if>	
}

function moveWrite() {
	<c:if test="${!empty authUser}">
	location.href='/dtoi/shop/product/pdfaq/write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 작성가능합니다.');
	location.href='/dtoi/customer/login.do?url=/shop/product/index.do'
	</c:if>	
}


function goSearch() {
	$("#searchForm").submit();
	
}


function showTr(id) {
	$("#tr"+id).toggle();
}



function goDelete(re_no) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : "/dtoi/shop/product/pdreview/delete.do",
			data : data,
			async : true,
			success : function(data) {
				var d = data.trim();
				if (d>0) {
					getList();
					alert("정상적으로 삭제되었습니다.");
				} else {
					alert("삭제실패");
				}
			},
			error : function(msg) {
				console.log(msg);
			}
		});
	}
}

function goCart() {
	//로그인 확인	
	<c:if test="${!empty authUser}">	
	// 상품 중복 확인
	$.ajax({
		url : "/dtoi/cart/check.do",
		data : {pd_no:${vo.pd_no}, cst_no:${authUser.cst_no}},
		async : true,
		success : function(data) {
			var d = data.trim();
			if (d == 'true') {
				if (confirm("장바구니에 담긴 상품입니다. 장바구니로 이동하시겠습니까?")) {
					location.href='/dtoi/cart/index.do';	
				}
			} else { //상품 등록
				$.ajax({
					url : "/dtoi/cart/insert.do",
					data : {pd_no:${vo.pd_no}, ct_count:$("#ct_count").val(), cst_no:${authUser.cst_no}}, //authUser.cst_no
					async : true,
					success : function(data) {
						var d = data.trim();
						if (d == 'true') {
							if (confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
								location.href='/dtoi/cart/index.do';	
							}
						} else {
							alert("장바구니 담기실패");
								}
							},
					error : function(msg) {
							console.log(msg);
							}
						});
					} },
			error : function(msg) {
					console.log(msg);
					} 
				});
		</c:if>
		<c:if test="${empty authUser}">
		alert('로그인 후 작성가능합니다.');
		$(".login_info").toggle();
		useremail_chk();
		</c:if>	

}
</script>
					
					</div>
				</div>
			</div>
		</div>
    



	<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>								
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
						
							
							
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>