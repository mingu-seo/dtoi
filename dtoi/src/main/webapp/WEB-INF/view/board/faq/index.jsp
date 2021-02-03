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
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>종류</th>
							<th>질문</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr style='cursor:pointer;' onclick="showTr('${status.index}');">
							<td>${vo.faq_no } </td>
							<td>${vo.faq_section }</td>
							<td class="txt_l">${vo.faq_title }</td>
						</tr>
						<tr id="tr${status.index}" style="display:none;">
							<td colspan="2">↳</td>
							<td class="txt_l">${vo.faq_contents }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
				
				<!-- 페이지처리 -->
				
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
