<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
	var pw = $("#pwd").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?']/gi);
	
	
	if ($("#name").val().trim() == '') {
		alert('이름을 입력하세요');
		$("#name").focus();
		return false;
	}
	
	if ($("#id").val().trim() == '') {
		alert('아이디를 입력하세요');
		$("#id").focus();
		return false;
	}
	var con = true;
	if ($("#id").val().length >= 5) { // 아이디 값이 5자 이상인 경우
		$.ajax({
			url:'/dtoi/admin/admin/isDuplicateId.do',
			data:{id:$("#id").val()},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(data) {
				//console.log(data);
				if (data == 'true') {
					alert('아이디가 중복되었습니다.');
					$("#id").focus();
					con = false;
				}
			}
		});
	} else {
		alert('아이디는 5자 이상 입력해 주세요');
		$("#id").focus();
		return false;
	}
	if (con == false) return false;
	
	if(pw.length < 8 || pw.length > 20){
		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
 	}else if(pw.search(/\s/) != -1){
  		alert("비밀번호는 공백 없이 입력해주세요.");
 		return false;
	}else if(num < 0 || eng < 0 || spe < 0 ){
  		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
  		return false;
 	}
	if ($("#tel").val().trim() == '') {
		alert('연락처를 입력하세요');
		$("#tel").focus();
		return false;
	}
	if ($("#email").val().trim() == '') {
		alert('이메일을 입력하세요');
		$("#email").focus();
		return false;
	}
	var data = $("#frm").serialize();
	console.log(data);
	$.ajax({
		url:'/dtoi/admin/admin/insert.do',
		data:data,
		type:'HTML',
		method:'POST',
		cache:false,
		success:function(data) {
			//console.log(data);
			if (data == 'true') {
				alert("정상적으로 등록되었습니다.");
				location.href="index.do";
			} else {
				alert("등록 실패");
			}
		}
	});
	return false;
}
</script>
</head>
<body> 
<div id="wrap">
	<div id="canvas">
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>관리자 등록</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="bread">
							<form  method="post" name="frm" id="frm" action="" enctype="multipart/form-data" onsubmit="return formCheck()">
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
										<th scope="row"><label for="">*이름</label></th>
										<td colspan="5">
											<input type="text" id="name" name="ad_name" class="w100" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아이디<br>&nbsp;&nbsp;&nbsp;&nbsp;*5글자 이상 입력해주세요</label></th>										
										<td colspan="5">
											<input type="text" id="id" name="ad_id" class="w100" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td colspan="5">
											<input type="password" id="pwd" name="ad_pwd" class="w100" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*연락처</label></th>
										<td colspan="5">
											<input type="text" id="tel" name="ad_tel" class="w100" title="제목을 입력해주세요" />	
										</td>										
									</tr>							
									<tr>
										<th scope="row"><label for="">*이메일</label></th>
										<td colspan="1">
											<input type="text" id="email" name="ad_email" class="w100" title="제목을 입력해주세요" />	
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