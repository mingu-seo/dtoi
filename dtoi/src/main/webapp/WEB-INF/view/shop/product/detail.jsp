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
								<dt class="reser_btn">
									<input type="button" class="btn" value="장바구니" onclick="showDialogue('${vo.pd_no }');"/>
									<input type="button" class="btn" value="바로 구매" onclick="showDialogue('${vo.pd_no }');"/>
								</dt>
							</dl>
						</div>
					</div>
					
					<div class="tab_area">
						<ul class ="tab_menu">
							<li>
								<a href="#" onclick="tab_move('0'); return false;" class="active">제품 상세</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('3'); return false;" >주문 가이드</a>
							</li>
							
						</ul>
					</div>
					<!-- 상품 정보 -->
			<div class="bbs">
				<div class="movie">
					<div class="info">
						<div class="movie_info2" style="margin-top:30px;">
							<dd> ${vo.pd_info}
							</dd>
						</div>
					</div>
				</div>
			</div>
	


					<div class="tab_area">
						<ul class ="tab_menu">
							<li>
								<a href="#" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('1'); return false;" class="active">제품 리뷰</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('3'); return false;" >주문 가이드</a>
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
				<c:forEach var="vo" items="${list}">							
					<tr style='cursor:pointer;' onclick="location.href='detail.do?re_no=${vo.re_no }'">
					
						<td class="first">${vo.re_no }</td>
						<td class="txt_l">${vo.re_title}</td>
						<td class="writer"> ${vo.cst_id }</td>
						<td class="date">${vo.re_regdate }</td>
						
					</tr>						
				</c:forEach>					
				</tbody>
			</table>	
							
			<div class="btnSet"  style="text-align:right;">
				<a class="btn" href="pdreview/write.do">글쓰기 </a>
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

					<div class="tab_area">
						<ul class ="tab_menu">
							<li>
								<a href="#" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('2'); return false;" class="active">제품 문의</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('3'); return false;" >주문 가이드</a>
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
						<c:forEach var="vo" items="${list}" varStatus="status">
						<tr style='cursor:pointer;' onclick="showTr('${status.index}');">
							<td class="first"><input type="checkbox" name="nos" id="pdfaq_no" value="${vo.pdfaq_no }"/></td>
							<td>${vo.pdfaq_no } </td>
							<td>${vo.pdfaq_name }</td>
							<td class="txt_l">${vo.pdfaq_title }</td>
						</tr>
						<tr id="tr${status.index}" style="display:none;">
							<td class="first"></td>
							<td> </td>
							<td></td>
							<td class="txt_l">${vo.pdfaq_contents }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="btnSet"  style="text-align:right;">
				<a class="btn" href="myPost.do">내가 작성한 글 </a>
				<a class="btn" href="pdfaq/write.do">질문작성 </a>
				</div>
				<div class="btnSet"  style="text-align:right;">
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
						
					<div class="tab_area">
						<ul class ="tab_menu">
							<li>
								<a href="#" onclick="tab_move('0'); return false;" >제품 상세</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('1'); return false;" >제품 리뷰</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('2'); return false;" >제품 문의</a>
							</li>
							<li>
								<a href="#" onclick="tab_move('3'); return false;" class="active">주문 가이드</a>
							</li>
							
						</ul>
					</div>
		
					<!-- 주문 가이드 -->	
					
					
				
						
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
	location.href='/dtoi/board/bulletin_board/write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');	
	$(".login_info").toggle();
	$('html, body').scrollTop(0);
	useremail_chk();
	</c:if>	
}

function moveWrite() {
	<c:if test="${!empty authUser}">
	location.href='/dtoi/board/qna/write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');
	location.href='/dtoi/customer/login.do?url=/bulletin_board/index.do'
	</c:if>	
}


function goSearch() {
	$("#searchForm").submit();
	
}


function showTr(id) {
	$("#tr"+id).toggle();
}


$(function() {
	getList();
});


function getList() {
	$.ajax({
		url : "pdreviewInsert.do",
		dataType : "html",
		data : data,  
		async : true,
		success : function(data) {
			$(".review_list").html(data);
		},
		error : function(msg) {
			console.log(msg);
		}
	});
}


function goDelete(re_no) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : "/dtoi/shop/pdreview/delete.do",
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
<%
// 세션객체 가져오기
CustomerVo authUser = (CustomerVo)session.getAttribute("authUser");
%>
<% if (authUser == null) { %>
로그인전
<% } %>
<% if (authUser != null) { %>
로그인후 
<%=authUser.getCst_name() %>님 안녕하세요!
<% } %>		
		
</body>
</html>