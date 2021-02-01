<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
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
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>Product - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form action="update.do" method="post" name="frm" id="frm" action="" enctype="multipart/form-data" onsubmit="return formCheck()">
							<input type="hidden" name="pd_no" value="${data.pd_no }">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
								
										<th scope="row"><label for="">상품이미지</label></th>
										<td colspan="10">
											<input type="file" name="file">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">상품이름</label></th>
										<td colspan="10">
											<input type="text" id="title" name="pd_name" title="상품이름 입력란" style="width:100%;" value="${data.pd_name}">
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">상품가격</label></th>
										<td colspan="10">
											<input type="text" id="text" name="pd_price" title="가격 입력란" style="width:100%;" value="${data.pd_price}">	
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">상품 카테고리</label></th>
										<td colspan="10">
											<input type="text" id="text" name="pd_category" style="width:100%;" value="${data.pd_category}">
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">상품평점</label></th>
										<td colspan="10">
											<input type="text"  name="pd_recom" style="width:100%;" value="${data.pd_recom}">
										</td>
									</tr><tr>
										<th scope="row"><label for="">상품상세</label></th>
										<td colspan="10">
											<textarea id="contents" name="pd_content" title="상품 상세 입력란" style="width:100%;">${data.pd_content }</textarea>	
										</td>
									</tr>									
									<tr>
										<th scope="row"><label for="">상품 정보</label></th>
										<td colspan="10">
											<input type="text" id="contents" name="pd_info" title="상품 정보 입력란" style="width:100%;">
										</td>
									</tr>																		
																
																	
								</tbody>
							</table>
															
													
						</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
								</div>
								
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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
</div>
<!--//wrap -->

</body>
</html>