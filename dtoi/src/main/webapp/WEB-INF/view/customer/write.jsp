<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>dtoi 회원가입</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
<script>

function formCheck() {
	if ($("#cst_id").val().trim() == '') {
		alert('아이디를 입력해주세요');
		$("#cst_id").focus();
		return false;
	}
	var con = true;
	if ($("#cst_id").val().length >= 3) { // 아이디 값이 3자 이상인 경우
		$.ajax({
			url:'/dtoi/customer/isDuplicateId.do',
			data:{id:$("#cst_id").val()},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(data) {
				//console.log(data);
				if (data == 'true') {
					alert('아이디가 중복되었습니다.');
					$("#cst_id").focus();
					con = false;
				}
			}
		});
	} else {
		alert('아이디는 3자 이상 입력해 주세요');
		$("#cst_id").focus();
		return false;
}
function goSave() {
	if ($("#cst_pwd").val().trim() == '') {
		alert('비밀번호를 입력해 주세요');
		$("#cst_pwd").focus();
		return false;
	}
	if ($("#cst_name").val().trim() == '') {
		alert('이름을 입력해 주세요');
		$("#cst_name").focus();
		return false;
	}
	if ($("#cst_email").val().trim() == '') {
		alert('e메일 주소를 입력해 주세요');
		$("#cst_email").focus();
		return false;
	}
	if ($("#cst_tel").val().trim() == '') {
		alert('연락처를 입력해 주세요');
		$("#cst_tel").focus();
		return false;
	}
	if(!$(':input:radio[id=cst_gender]:checked').val()) {   
		   alert("성별을 선택해 주세요.");
		   return;
		}

	if ($("#cst_birth").val().trim() == '') {
		alert('생일을 입력해 주세요');
		$("#cst_birth").focus();
		return false;
	}
	if ($("#cst_height").val().trim() == '') {
		alert('키를 입력해 주세요');
		$("#cst_height").focus();
		return false;
	}
	if ($("#cst_weight").val().trim() == '') {
		alert('몸무게를 입력해 주세요');
		$("#cst_weight").focus();
		return false;
	}
	if ($("#cst_grade").val().trim() == '') {
		alert('비만도를 입력해 주세요');
		$("#cst_grade").focus();
		return false;
	}
	if ($("#zipcode").val().trim() == '') {
		alert('우편번호를 입력해 주세요');
		$("#zipcode").focus();
		return false;
	}
	if ($("#addr1").val().trim() == '') {
		alert('주소를 입력해 주세요');
		$("#addr1").focus();
		return false;
	}
	// 폼에 있는 모든 데이터를 한번에 읽어오는 방법
	var data = $("#frm").serialize();
	console.log(data);
	$.ajax({
		url:'/dtoi/customer/insert.do',
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
// 아이디에 keyup이벤트를 걸어서 ajax로 중복여부 체크
$(function() {
	$("#submitBtn").click(function() {
		formCheck();
	});
	$("#cst_id").keyup(function() {
		//console.log($(this).val());
		//console.log($(this).val().length);
		if ($(this).val().length >= 3) { // 아이디 값이 3자 이상인 경우
			$.ajax({
				url:'/dtoi/customer/isDuplicateId.do',
				data:{id:$(this).val()},
				type:'HTML',
				method:'GET',
				cache:false,
				success:function(data) {
					//console.log(data);
					if (data == 'true') {
						$("#idMsg").text('아이디 중복');
					} else {
						$("#idMsg").text('아이디 사용 가능');
					}
				}
			});
		} else {
			$("#idMsg").text('아이디를 입력하세요');
		}
	});
});
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function zip_api() {
        new daum.Postcode({
            oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                    addr += ' '+extraAddr;
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('zipcode').value = data.zonecode;
                $("#zipcode").val(data.zonecode);
                //document.getElementById("addr1").value = addr;
                $("#addr1").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("addr2").focus();
                $("#addr2").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	
	
	  <div class="sub">
		<div class="size">
			<h3 class="sub_title">회원가입</h3>
			<form action="insert.do" method="post" id="frm" name="frm"  enctype="multipart/form-data">
			<table class="board_write">
				<caption>회원가입</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>*아이디</th>
						<td>
							<input type="text" name="cst_id" id="cst_id" class="inNextBtn" class="wid200" style="float:left;"><br>
							<span class="cst_id_check"><a href="javascript:;" onclick="formcheck();" class="btn bgGray" style="float:left; width:auto; clear:none;">중복확인</a></span>
						</td>
					</tr>
					<tr>
						<th>*비밀번호</th>
						<td><input type="password" name="cst_pwd" id="cst_pwd" class="wid200" style="float:left;"> </td>
					</tr>
					<tr>
						<th>*이름</th>
						<td><input type="text" name="cst_name" id="cst_name" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*이메일</th>
						<td><input type="text" name="cst_email" id="cst_email" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*연락처</th>
						<td><input type="text" name="cst_tel" id="cst_tel" value=""  class="wid50" maxlength="15" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" style="float:left;"></td>
					</tr>
					<tr>
						<th>*성별</th>
						<td>
						<select name="gender" id="gender">
						<option value="1">남성</option>
						<option value="2">여성</option>
						</select> 
						</td>
					</tr>
					<tr>
						<th>*생년월일<br></th>
						<td><input type="text" name="cst_birth" id="cst_birth" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*기저질환(없으면 공란)</th>
						<td><input type="text" name="cst_disease" id="cst_disease" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>키(cm)</th>
						<td><input type="text" name="cst_height" id="cst_height" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*몸무게(kg)</th>
						<td><input type="text" name="cst_weight" id="cst_weight" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*비만도</th>
						<td><input type="text" name="cst_grade" id="cst_grade" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>*주소</th>
						<td>
							<input type="text" name="zipcode" id="zipcode" size="5" readonly><input type="button" value="우편번호" onclick="zip_api();" class="wid200" style="float:left;"><br>
							<input type="text" name="addr1" id="addr1" readonly class="wid200" style="float:left;"><br>
							<input type="text" name="addr2" id="addr2" class="wid200" style="float:left;">
						</td>
					</tr>
					</tbody>
				</table>
					<input type="submit" value="등록" id="submitBtn"> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
				</form>
				<div class="btnSet clear">
					<div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
				</div>
			</div>
    	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>