<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script>
function goSearch() {
	$("#searchForm").submit();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">공지사항</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
				<form><input type="hidden" name="cst_no" value="${authUser.cst_no }"></form>
					<caption>게시판 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}">
						<tr style='cursor:pointer;' onclick="location.href='detail.do?notice_no=${vo.notice_no }'">
							<td>${vo.notice_no }</td>
							<td class="txt_l">${vo.notice_title} </td>
							<td class="date">${vo.notice_regdate }</td>
							<td class="writer"> ${vo.admin_id }</td>
							<td class="hit" >${vo.readCnt }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 처리 -->
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
								<option value="1" <c:if test="${param.qna_section == '1' }">selected</c:if>>제목만</option>
								<option value="2" <c:if test="${param.qna_section == '2' }">selected</c:if>>제목 + 내용</option>
							</select>
						</span>
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
<!--//wrap -->
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