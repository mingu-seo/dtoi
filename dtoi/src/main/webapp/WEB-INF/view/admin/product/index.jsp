<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="admin.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function moveWrite() {
	location.href='write.do';
}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>상품 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totalCount }개</strong>  |  ${reqPage }/${totalPage } 페이지</span></p>
							<form name="frm" id="frm" action="groupDelete2.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 상품관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w5" />
									<col class="w6" />
									<col class="w7" />
									<col class="w8" />
									<col class="w5" />
									<col class="w5" />
									<col class="w5" />
									<col class="w5" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">상품 번호</th>
										<th scope="col">상품 카테고리</th> 
										<th scope="col">상품 이미지</th> 
										<th scope="col">상품 이름</th> 
										<th scope="col">가격</th> 
										<th scope="col">상품 별점</th>  
										<th scope="col">상품 작성일</th>  
										<th scope="col">상품 조회수</th>  
										<th scope="col" class="last">상품 주문수</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td class="first"><input type="checkbox" name="nos" id="pd_no" value="${vo.pd_no }"/></td>
										<td>${vo.pd_no }</td>
										<td>${vo.pd_category }</td>
										<td>${vo.pd_image }</td>
										<td class="pd_name"><a href="detail.do?no=${vo.pd_no }">${vo.pd_name }</a></td>
										<td>${vo.pd_price }</td>
										<td>${vo.pd_recom }</td>
										<td>${vo.pd_regdate }</td>
										<td>${vo.pd_clickcount }</td>
										<td class="last">${vo.pd_ordercount }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="$('#frm').submit();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
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
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>