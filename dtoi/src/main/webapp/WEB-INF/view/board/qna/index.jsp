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

function moveWrite() {
	
	<c:if test="${!empty authUser}">
	location.href='write.do';
	</c:if>
	<c:if test="${empty authUser}">
	alert('로그인 후 이용가능합니다.');
	location.href='/dtoi/customer/login.do?url=/bulletin_board/index.do'
	</c:if>	
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
					</c:forEach>
					</tbody>
				</table>
				<div class="btnSet"  style="text-align:right;">
					<a class="btn" href="javascript:moveWrite();">질문작성 </a>
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
		</div>
    </div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
