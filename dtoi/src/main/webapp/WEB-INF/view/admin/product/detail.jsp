<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<title>제품 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

function del() {
	
	if (confirm('정말 삭제하시겠습니까?')) {
		$.ajax({
			url:'delete.do',
			data:{no:${vo.pd_no}},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(res) {
				//console.log(data);
				if (res == 'true') {
					alert('정상적으로 삭제되었습니다.');
					location.href='index.do';
				} else {
					alert('삭제 오류');
				}
			}
		});
	}
}

</script>

</head>
<body>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>자유게시판</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
				
	<tr>
		<th scope="row"><label for="">메인 이미지</label></th>
		<td colspan="10"><img src="/dtoi/upload/${vo.pd_image }" alt="" width=100px height=150px/></td>
	</tr>
	<tr>
		<th scope="row"><label for="">상품명</label></th>
		<td colspan="10">${vo.pd_name}</td>
	</tr>
	<tr>
		<th scope="row"><label for="">카테고리</label></th>
		<td colspan="10">${vo.pd_category}</td>
	</tr>
	<tr>
		<th scope="row"><label for="">가격</label></th>
		<td colspan="10">${vo.pd_price }</td>
	</tr>
	<tr>
		<th scope="row"><label for="">내용</label></th>
		<td colspan="10">${vo.pd_content }<a href="/admin/common/download.jsp?path=/upload/&r_file=${vo.pd_image}" target="_blank" ></a></td>
	</tr>
</table>
	<div class="btn">
		<div class="btnLeft">
		<a class="btns" href="index.do"><strong>목록</strong></a>
	</div>
		<div class="btnRight">
		<a class="btns" style="cursor:pointer;" href="edit.do?pd_no=${vo.pd_no }"><strong>수정</strong></a>
		<a class="btns" style="cursor:pointer;" href="javascript:;" onclick='del()'><strong>삭제</strong></a>
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


<form>
<!--input type="hidden" name="user_no" value="${authUser.no }">  -->

</form>

</body>
</html>