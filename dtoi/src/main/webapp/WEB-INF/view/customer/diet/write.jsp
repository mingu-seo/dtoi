<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>식단 등록 페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script>

function goSave() {
		if ($("#diet_slot").val().trim() == '') {
			alert('식사종류를 입력해 주세요');
			$("#diet_slot").focus();
			return false;
		}
		if ($("#diet_item").val().trim() == '') {
			alert('식단을 추가해주세요');
			$("#diet_item").focus();
			return false;
		}
		var data = $("#frm").serialize();
		console.log(data);
		$.ajax({
			url:'/dtoi/customer/diet/insert.do',
			data:data,
			type:'HTML',
			method:'POST',
			cache:false,
			success:function(data) {
				//console.log(data);
				if (data == 'true') {
					alert("정상적으로 등록되었습니다.");
					
					// 모든 입력란을 초기화
					//$("input[type='text'], input[type='password']").val("");
					//$("#frm")[0].reset();
					location.href="${param.url}";
				} else {
					alert("등록 실패");
				}
			}
		});
}

function addItem(){
	$.ajax({
		url : '',
		cache : false,
		success : function(){			
			$('#diet_items_column').append('<tr>'+
					'<td><input type="text" name="diet_item" id="diet_item" class="wid80" maxlength="15" style="float:left;"  value=""></td>'+
			'<td><input type="number" name="diet_degree" id="diet_degree" class="wid10" min="0" max="9999" style="float:left;" value="100">g</td>'+
			'</tr>')
		},
		error : function(res){
			console.log(res);
		}
	});
}



</script>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
</style>
</head>
<body>



<%@ include file="/WEB-INF/view/include/header.jsp" %>

	  <div class="sub">
		<div class="size">
			<h3 class="sub_title">식단 등록 양식</h3>
			<form action="update.do" method="post" id="frm" name="frm"  enctype="multipart/form-data">
			<input type="hidden" name="cst_no" value="${vo.cst_no }">
			<table class="board_write">
				<caption>식단 등록</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							${vo.cst_id}
						</td>
					</tr>
					<tr>
						<th>식사종류</th>
						<td>
							<input type="text" name="diet_slot" id="diet_slot" placeholder="아침, 점심, 저녁, 간식, etc...">
						</td>
					</tr>
					<tr>
						<th>식단 메모</th>
						<td><input type="text" name="diet_memo" id="diet_memo" class="wid50" placeholder=""></td>
					</tr>
					<tr>
						<th valign="top">음식 이름</th>
						<th>
							<table id="diet_items_column">
								<tr>
									<td><input type="text" name="diet_item" id="diet_item" class="wid80" maxlength="15" style="float:left;"></td>
									<td><input type="number" name="diet_degree" id="diet_degree" class="wid10" min='0' max='9999' style="float:left;" value="100">g</td>
									<td><input type="button" onclick="addItem();" value="+"></td>
								</tr>
							</table>
						</th>
					</tr>
					</tbody>
				</table>
				</form>
				<div class="btnSet clear">
					<div><a href="javascript:;" class="btn" onclick="goSave();">수정</a>
					<a href="javascript:;" class="btn" onclick="history.back();">취소</a>
					</div>
				</div>
			</div>
    	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>