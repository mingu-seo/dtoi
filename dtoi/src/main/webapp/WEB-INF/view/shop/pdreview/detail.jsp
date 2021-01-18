<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>${vo.re_no }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${vo.re_title}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${vo.re_content}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${vo.re_regdate }</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><a href="/dtoi/common/download.jsp?path=/upload/&re_file=${vo.re_filename}&re_ori_file=${vo.re_ori_filename}" target="_blank">${vo.re_ori_filename}</a></td>
	</tr>
</table>
<input type="button" value="수정" onclick='location.href="edit.do?no=${vo.re_no}";'>
<input type="button" value="삭제" onclick="del();">
<input type="button" value="목록" onclick='location.href="shop/pdreview/index.do";'>
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
			data:{re_no:${vo.re_no}},
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

</body>
</html>