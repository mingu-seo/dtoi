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
<script>
function del() {	
	
	if (confirm('정말 삭제하시겠습니까?')) {
		$.ajax({
			url:'delete.do',
			data:{qna_no:${vo.qna_no}},
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
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<input type='hidden' name='qna_no' value="${vo.qna_no }">
<input type='hidden' name='cst_no' value="${vo.cst_no}">
 <div class="sub">
		<div class="size">
			<h3 class="sub_title">공지사항</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt>${vo.qna_title } </dt>
							<dd class="date"><strong>분류 : ${vo.qna_section } &nbsp;&nbsp;</strong></dd>
							<dd class="date"><strong>작성자 : ${vo.user_name} &nbsp;&nbsp;</strong></dd>
							<dd class="date">작성일 : ${vo.qna_regdate }</dd>
						</dl>
					</div>
					<div class="cont">${vo.qna_content } </div>
					<tr>				
					<td colspan="11">
						
					</td>
					</tr>	
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do" class="btn">목록으로</a></div>
						
					</div>
			
				</div>
			</div>
		</div>
    </div>

 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>