<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="admin.admin.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>


</script>
</head>
<body> 
<div id="wrap">
	<div id="canvas">
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
				<h2>관리자 목록</h2>
					</div>
						<div class="con">
							<div id="bbs">
								<div id="blist">
								<input type="hidden" name ="ad_name" value="${adminUser.ad_name }">
								<p><span><strong>총 ${totCount }개</strong>  |  ${reqPage }/${totalPage }</span></p>
								<form name="frm" id="frm" action="groupDelete.do" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
									<colgroup>
										<col width="50px" />
										<col width="80px" />
										<col width="150" />
										<col width="150" />
										<col width="150px" />
										<col width="150px" />									
										<col width="150px" />									
									</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">관리자번호</th>
										<th scope="col">관리자명</th> 
										<th scope="col">아이디</th> 
										<th scope="col">이메일</th>
										<th scope="col">연락처</th>
										<th scope="col">가입일</th>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td class="first"><input type="checkbox" name="nos" id="ad_no" value="${vo.ad_no }"/></td>
										<td><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_no }</a></td>
										<td><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_name }</a></td>
										<td ><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_id }</a></td>
										<td><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_email }</a></td>
										<td><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_tel }</a></td>	
										<td scope="col"><a href="detail.do?ad_no=${vo.ad_no }">${vo.ad_regdate }</a></td>									
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
								
								<form name="searchForm" id="searchForm" action="index.do"  method="post">
									<div class="search">									
										<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
										<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
// 세션객체 가져오기
AdminVo adminUser= (AdminVo)session.getAttribute("adminUser");
%>
<% if (adminUser == null) { %>
로그인전
<% } %>
<% if (adminUser != null) { %>
<%=adminUser.getAd_name() %>님 안녕하세요!
<% } %>
</body>
</html>