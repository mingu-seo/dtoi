<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
 <%@ page import="customer.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
jQuery(window).load(function(){
	oEditors = setEditor("contents"); // 에디터 셋팅
	initCal({id:"cre_date",type:"day",today:"y",timeYN:"y"});
});
function formCheck() {
	if ($("#title").val().trim() == '') {
		alert('제목을 입력하세요');
		$("#title").focus();
		return false;
	}
	//
	var html = oEditors.getById["contents"].getIR(); // 값 가져오기
	if (html == '') {
		alert('내용을 입력하세요');
	}
	oEditors.getById['contents'].exec("UPDATE_CONTENTS_FIELD",[]); // 에디터있던 내용을 textarea에 담기
}
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<div class="sub">
	<div class="size">
		<h3 class="sub_title">Q&A-글쓰기</h3>
			<div class="bbs">
			<form action="insert.do" method="post" name="frm" id="frm" action="" enctype="multipart/form-data" onsubmit="return formCheck()">
			<input type="hidden" name="cst_no" value="${authUser.cst_no }">
				<table class="write">
					<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" id="title" name="qna_title" class="w100" title="제목을 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<select id="qna_section" name="qna_section">
								<option value="1" <c:if test="${param.qna_section == '1' }">selected</c:if>>반품신청</option>
								<option value="2" <c:if test="${param.qna_section == '2' }">selected</c:if>>상품문의</option>
								<option value="3" <c:if test="${param.qna_section == '3' }">selected</c:if>>기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea id="contents" name="qna_content" title="내용을 입력해주세요" style="width:100%;"></textarea>
						</td>
					</tr>
					</tbody>
				</table>
			</form>
			<div class="btnSet"  style="text-align:right;">
				<a href="javascript:$('#frm').submit();" class="btn"><strong>저장</strong></a>
				<a href="index.do" class="btn">목록으로</a>			
			</div>			
	</div>

    
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
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