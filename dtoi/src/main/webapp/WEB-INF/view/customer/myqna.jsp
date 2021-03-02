<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="customer.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="board.faq.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>dtoi 나의 질문</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
	<div class="sub">
		<div class="size">
			<h3 class="sub_title">마이페이지</h3>
				<div class="bbs">
					<div class="movie">
					<div class="tab_area" id="product_info">
						<ul class ="tab_menu">
							<li>
								<a href="<%=request.getContextPath()%>/customer/food.do?cst_no=${authUser.cst_no }" onclick="tab_move('0'); return false;" >식단입력 내역</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/food.do?cst_no=${authUser.cst_no }" onclick="tab_move('1'); return false;" >주문내역</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/mypost.do?cst_no=${authUser.cst_no }" onclick="tab_move('2'); return false;" class="active";>나의 질문</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/customer/mypost.do?cst_no=${authUser.cst_no }" onclick="tab_move('3'); return false;">내가 쓴 글</a>
							</li>
						</ul>
					</div>
				<div class="bbs">
				<table class="list">
				<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
					<caption> Q&A 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>상태</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}">
						<input type="hidden" name="cst_id" value="${authUser.cst_id }">
						<input type="hidden" name="user_name" value="${vo.user_name }">
							<c:if test= "${authUser.cst_id == vo.user_name}">
							<tr style='cursor:pointer;' onclick="location.href='detail.do?qna_no=${vo.qna_no }'">
								<td>${vo.qna_no }</td>
								<td class="hit" >${vo.qna_name }</td>
								<td class="txt_l">
								<c:forEach begin="1" end="${vo.lev }">&nbsp;&nbsp;</c:forEach>
									<c:if test="${vo.lev > 0 }">
										<img src="/dtoi/img/board/answer_icon.gif">
									</c:if>
									${vo.qna_title} </td>
								<td class="date">${vo.qna_regdate }</td>
								<td class="writer"> ${vo.user_name}</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>					
				</table>
			<div class="btnSet"  style="text-align:right;">
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
						
		</div>
	</div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>