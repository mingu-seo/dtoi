<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>DTOI</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
</head>
<script>
//아이디 찾기
function searchEmail(){
	var datas = {"cst_name":$("#cst_name").val(), "cst_tel" : $("#cst_tel").val()};
	if($("#cst_name").val()==null){
		alert("회원님의 이름을 입력해주세요.");
	}else if($("#cst_tel").val()==null){
		alert("회원님의 휴대폰 번호를 입력해주세요.");
	}else if($("#cst_name").val()!=null && $("#cst_tel").val()!=null){
		$.ajax ({
			type:'POST',
			url:"/customer/searchid.do",
			data:datas,
			async:false,
			success:function(data) {
				var email = data.trim();
				if (email != "") {
					alert("회원님의 아이디는 "+data+"입니다.");
				} else {
					alert("존재하지 않는 이름이거나 존재하지않는 휴대폰번호 입니다.");
				}
			}
		});
	};
	return false;
};
</script>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
	<form id="searchid" action="searchid.do" method="post">
    <div class="sub">
		<div class="size">
			<h3 class="sub_title">아이디 찾기</h3>
			
			<div class="member">
				<div class="box">
					<p>이름과 휴대폰 번호를 입력해 주세요.
					</p>
					<fieldset class="login_form">
						<ul>
							<li><input type="text" name="cst_name" id="cst_name" placeholder="이름"></li>
							<li><input type="text" name="cst_tel" id="cst_tel" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" placeholder="휴대폰번호"></li>
						</ul>
						<div class="login_btn"><input type="submit" value="아이디찾기" alt="아이디찾기" onclick="searchId();"/></div>
					</fieldset>
					<div class="btnSet clear">
						<div>
							<a href="pwdsearch.do" class="btn">비밀번호 찾기</a> 
						</div>
					</div>
				</div>
			</div>

		</div>
    </div>
	</form>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
