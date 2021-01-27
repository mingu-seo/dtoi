<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
 <%@ page import="customer.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script>
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents", // textarea ID
		sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
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
<!-- canvas -->
	<div class="size">
	<h3 class="sub_title">자유게시판-글쓰기</h3>
		<div class="bbs">
		<form action="insert.do" method="post" name="frm" id="frm" action="" enctype="multipart/form-data" onsubmit="return formCheck()">
		<input type="hidden" name="cst_no" value="${authUser.cst_no }">
		<table class="list">
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="*" />
				<col width="100px" />
				<col width="100px" />
				<col width="80px" />
			</colgroup>
			<tbody>
			<tr>
				<th scope="row"><label for="">*제목</label></th>
				<td colspan="10">
					<input type="text" id="title" name="bb_title" class="w100" title="제목을 입력해주세요" />	
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="">*내용</label></th>
				<td colspan="10">
				<textarea id="contents" name="bb_content" title="내용을 입력해주세요" style="width:100%;"></textarea>	
				</td>
			</tr>									
		</tbody>
  		</table>
						
				
		</form>
		<div class="btnSet clear">
			<div class="fl_l"><a href="index.do" class="btn">목록으로</a></div>			
			<div class="fl_l"><a href="javascript:$('#frm').submit();" class="btn"><strong>저장</strong></a></div>
		</div>
<!--//btn-->
		</div>
<!-- //bread -->
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