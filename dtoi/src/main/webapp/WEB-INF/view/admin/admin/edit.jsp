<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>개인정보 수정</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>dtoi 개인정보 수정</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script>

$(function() {
	$("#submitBtn").click(function() {
		if ($("#ad_pwd").val().trim() == '') {
			alert('비밀번호를 입력해 주세요');
			return false;
		}
		if ($("#ad_name").val().trim() == '') {
			alert('이름을 입력해 주세요');
			return false;
		}
		if ($("#ad_email").val().trim() == '') {
			alert('e메일 주소를 입력해 주세요');
			$("#ad_email").focus();
			return false;
		}
		if ($("#ad_tel").val().trim() == '') {
			alert('연락처를 입력해 주세요');
			$("#ad_tel").focus();
			return false;
		}
		var data = $("#frm").serialize();
		$.ajax({
			url:'/dtoi/admin/update.do',
			data:data,
			type:'HTML',
			method:'POST',
			cache:false,
			success:function(data) {
				//console.log(data);
				if (data == 'true') {
					alert("정상적으로 수정되었습니다.");
					// 모든 입력란을 초기화
					//$("input[type='text'], input[type='password']").val("");
					//$("#frm")[0].reset();
					location.href="${param.url}";
				} else {
					alert("등록 실패");
				}
			}
		});
	});
});
</script>
</head>
<body>



<%@ include file="/WEB-INF/view/include/header.jsp" %>

	  <div class="sub">
		<div class="size">
			<h3 class="sub_title">관리자정보 수정</h3>
			<form action="update.do" method="post" id="frm" name="frm"  enctype="multipart/form-data">
			<input type="hidden" name="ad_no" value="${vo.ad_no }">
			<table class="board_write">
				<caption>관리자정보 수정</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>*아이디</th>
						<td>
							${vo.ad_id }
						</td>
					</tr>
					<tr>
						<th>*비밀번호</th>
						<td><input type="password" name="ad_pwd" id="ad_pwd" class="wid200" style="float:left;" value=""> </td>
					</tr>
					<tr>
						<th>*이름</th>
						<td><input type="text" name="ad_name" id="ad_name" class="wid200" style="float:left;" value="${vo.ad_name }" ></td>
					</tr>
					<tr>
						<th>*이메일</th>
						<td><input type="text" name="ad_email" id="ad_email" class="wid200" style="float:left;" value="${vo.ad_email }"></td>
					</tr>
					<tr>
						<th>*연락처</th>
						<td><input type="text" name="ad_tel" id="ad_tel" value=""  class="wid50" maxlength="15" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" style="float:left;" value="${vo.ad_tel }"></td>
					</tr>
					</tbody>
				</table>
				</form>
				<div class="btnSet clear">
					<div><input type="submit" class="btn" value="수정" id="submitBtn"> 
					<a href="javascript:;" class="btn" onclick="history.back();">취소</a>
					<input type="button" class = "btn" value="회원탈퇴" onclick="del();">
						<script>
						function del() {
							if (confirm('정말 탈퇴하시겠습니까?')) {
								$.ajax({
									url:'/dtoi/admin/delete.do',
									data:{ad_no:${vo.ad_no}},
									type:'HTML',
									method:'GET',
									cache:false,
									async:false,
									success:function(res) {
										//console.log(data);
										if (res == 'true') {
											alert('정상적으로 탈퇴되었습니다.');
											location.href="${param.url}";
						
										} else {
											alert('탈퇴 오류');
										}
									}
								});
							}
						}
						</script>
					</div>
				</div>
			</div>
    	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>