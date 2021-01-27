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
			<h3 class="sub_title">Q&A</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
					<caption> Q&A 목록</caption>
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
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}">
						<tr style='cursor:pointer;' onclick="location.href='detail.do?qna_no=${vo.qna_no }'">
							<td>${vo.qna_no }</td>
							<td class="txt_l">
							<c:forEach begin="1" end="${vo.lev }">&nbsp;&nbsp;</c:forEach>
								<c:if test="${vo.lev > 0 }">
									<img src="/dtoi/img/board/answer_icon.gif">
								</c:if>
								${vo.qna_title} </td>
							<td class="date">${vo.qna_regdate }</td>
							<td class="writer"> ${vo.user_name}</td>
							<td class="hit" ></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="btnSet"  style="text-align:right;">
					<a class="btn" href="swrite.do">질문작성 </a>
				</div>
				
			
				
			</div>
		</div>
    </div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
