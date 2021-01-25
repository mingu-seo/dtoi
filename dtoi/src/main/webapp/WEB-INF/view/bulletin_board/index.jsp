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
	<!-- canvas -->
   <div class="sub">
		<div class="size">
			<h3 class="sub_title">자유게시판</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
				<form><input type="hidden" name="cst_no" value="${authUser.cst_no }"></form>
					<caption>게시판 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
							<th scope="col">글번호</th>
							<th scope="col">제목</th> 
							<th scope="col">작성일</th> 
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}">
							
						<tr style='cursor:pointer;' onclick="location.href='detail.do?bb_no=${vo.bb_no }'">
							<td class="first"><input type="checkbox" name="nos" id="no" value="${vo.bb_no }"/></td>
							<td>${vo.bb_no }</td>
							<td class="txt_l">${vo.bb_title} [${vo.commentCount }]</td>
							<td class="writer"> ${vo.user_name }</td>
							<td class="date">${vo.bb_regdate }</td>
							<td class="hit" >${vo.readCnt }</td>
						</tr>
						
					</c:forEach>
					
					</tbody>
				</table>
					<div class="btnSet clear">
						<div class="fl_l"><a href="javascript:moveWrite();" class="btn">글쓰기</a></div>						
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
				
				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="index.do">
						
						<span class="searchWord">
							<input type="text" id="sval" name="sval" value="${param.searchWord }"  title="검색어 입력" onKeypress="">
							<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
						</span>
					</form>
				</div>
			</div>
		</div>
    </div>

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
 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>