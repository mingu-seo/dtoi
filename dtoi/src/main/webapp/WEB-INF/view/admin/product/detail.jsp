<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<td>메인 이미지</td>
		<td><a href="/admin/common/download.jsp?path=/upload/&r_file=${vo.pd_image}&o_file=${vo.pd_ori_image}" target="_blank">${vo.pd_ori_image}</a></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td>${vo.pd_name}</td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td>${vo.pd_category}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${vo.pd_price }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${vo.pd_content }</td>
		<td><a href="/admin/common/download.jsp?path=/upload/&r_file=${vo.pd_image}&o_file=${vo.pd_ori_image}" target="_blank">${vo.pd_ori_image}</a></td>
	</tr>
</table>
<input type="button" value="수정" onclick='location.href="edit.do?no=${vo.pd_no}";'>
<input type="button" value="삭제" onclick="del();">
<input type="button" value="목록" onclick='location.href="index.do";'>
<script>
function del() {
	/*
	if (confirm("정말 삭제하시겠습니까?")) {
		location.href="delete.do?no=${vo.no}";
	}
	*/
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
<form action="commentInsert.do" method="post">
<input type="hidden" name="pd_no" value="${vo.pd_no }">
<!--input type="hidden" name="user_no" value="${authUser.no }">  -->
<table border="1">
	<tr>
		<td>
			<textarea name="pd_content"></textarea>
		</td>
	</tr>
</table>
</form>
<script>
function goDel(pd_no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='/admin/product/commentDelete.do?pd_no='+pd_no+'&pd_no=${vo.pd_no}';
	}
}
</script>
</body>
</html>