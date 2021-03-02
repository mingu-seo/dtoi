<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DtoI</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
</head>
<body> 
<%@ include file="/WEB-INF/view/include/header.jsp" %>
	
 <div class="sub">
		<div class="size">
			<h3 class="sub_title">결제 완료</h3>
				<div class="bbs"> 
				<div class="area_top">
				
					<table class="tbl_col prd">
					<form>
					<input type="hidden" name="cst_no" value="${authUser.cst_no }">
					<input type="hidden" name="cart_no" value="${cart_no }">
					<input type="hidden" name="pd_no" value="${pd_no }">
					
					</form>
					<caption class="hidden">결제완료</caption>
					<colgroup>
						<col style="width:110px;">
						<col>
						<col style="width:142px;">
						<col style="width:56px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="4">주문내역</th>
						</tr>
					</thead>
					<thead>
						<tr>
							<th scope="col" colspan="1">주문번호:</th>
							<th scope="col" colspan="2">상품 내역:</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
				<div class="area_bottom">
					<ul class="cart_btn">
						<li class="box_btn">
						<a href="javascript:">홈으로</a>
						</li>
						<li class="box_btn">
						<a href="javascript:">주문내역 보기</a>
						</li>
					</ul>
				</div>
					</tbody>
					</table>
					

			</div>
		</div>
    </div>
 </div>

 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>