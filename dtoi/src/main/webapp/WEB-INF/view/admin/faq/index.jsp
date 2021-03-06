<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board.faq.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>공지사항</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
							<form name="frm" id="frm" action="groupDelete.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w10" />
									<col class="" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
							<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">종류</th> 
										<th scope="col">질문</th> 
									</tr>
								</thead>
						<tbody>
						<c:forEach var="vo" items="${list}" varStatus="status">
						<tr style='cursor:pointer;' onclick="showTr('${status.index}');">
							<td class="first"><input type="checkbox" name="nos" id="faq_no" value="${vo.faq_no }"/></td>
							<td>${vo.faq_no } </td>
							<td>${vo.faq_name }</td>
							<td class="txt_l">${vo.faq_title }</td>
						</tr>
						<tr id="tr${status.index}" style="display:none;">
							<td class="first"></td>
							<td> </td>
							<td></td>
							<td class="txt_l">${vo.faq_contents }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</form>
			<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:;" onclick="$('#frm').submit();"><strong>삭제</strong> </a>
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
</body>
</html>
