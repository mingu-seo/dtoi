<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.faq.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<title>DtoI</title>
<script>
function goSearch() {
	$("#searchForm").submit();
	
}
function showTr(id) {
	$("#tr"+id).toggle();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<div class="sub">
	<div class="size">
		<h3 class="sub_title">자주하는질문</h3>
			<div class="bbs">
				<table class="list">
					<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
					<caption>질문 목록</caption>
						<colgroup>
							<col width="80px" />
							<col width="100px" />
							<col width="*" />
							<col width="100px" />
						</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>종류</th>
							<th>질문</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr style='cursor:pointer;' onclick="showTr('${status.index}');">
								<td>${vo.faq_no } </td>
								<td>${vo.faq_section }</td>
								<td class="txt_l">${vo.faq_title }</td>
								<td>${vo.faq_regdate }</td>
							</tr>
							<tr id="tr${status.index}" style="display:none;">
								<td colspan="2">↳</td>
								<td class="txt_l">${vo.faq_contents }</td>
								<td colspan="1"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

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
								<option value="1" <c:if test="${param.qna_section == '1' }">selected</c:if>>제목만</option>
								<option value="2" <c:if test="${param.qna_section == '2' }">selected</c:if>>제목 + 내용</option>
								<option value="3" <c:if test="${param.qna_section == '3' }">selected</c:if>>작성자</option>
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

<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
