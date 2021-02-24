<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>개인정보</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">

<meta name="keywords" content="">
<meta name="description" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>dtoi 개인정보 수정</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
</head>
<script>
function edit() {
	location.href='<%=request.getContextPath()%>/customer/edit.do?cst_no=${authUser.cst_no }&url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>';
}
</script>

<%@ include file="/WEB-INF/view/include/header.jsp" %>

<body>


	  <div class="sub">
		<div class="size">
			<h3 class="sub_title">회원정보</h3>
			<form action="update.do" method="post" id="frm" name="frm"  enctype="multipart/form-data">
			<input type="hidden" name="cst_no" value="${vo.cst_no }">
			<table class="board_write">
				<caption>마이페이지</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>*아이디</th>
						<td>${vo.cst_id }</td>
					</tr>
					<tr>
						<th>*이름</th>
						<td>${vo.cst_name }</td>
					</tr>
					<tr>
						<th>*이메일</th>
						<td>${vo.cst_email }</td>
					</tr>
					<tr>
						<th>*연락처</th>
						<td>${vo.cst_tel }</td>
					</tr>
						<tr>
							<th>*성별</th>
							<td>${vo.cst_gender}</td>
						</tr>
					<tr>
						<th>*생년월일<br></th>
						<td>${vo.cst_birth }</td>
					</tr>
					<tr>
						<th>*기저질환(없으면 공란)</th>
						<td>${vo.cst_disease }</td>
					</tr>
										<tr>
						<th>*키(cm)</th>
						<td>${vo.cst_height }</td>
					</tr>
					<tr>
						<th>*몸무게(kg)</th>
						<td>${vo.cst_weight }</td>
					</tr>
					<tr>
						<th>*비만도</th>
						<td>${vo.cst_grade }</td>
					</tr>
					<tr>
						<th>*주소</th>
						<td>
							${vo.addr1 } ${vo.addr2 }
						</td>
					<tr>
						<th>*우편번호</th>
						<td>${vo.zipcode }</td>
					</tr>
				
					</tbody>
				</table>
				</form>
			<div class="btnSet clear">
			<div><input type="button" class="btn" value="회원정보 수정" onclick="edit();">

			</div>
    	</div>
    	</div>
    	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>