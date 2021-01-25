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
			data:{bb_no:${vo.bb_no}},
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
function delComment(no){
	if (confirm('삭제하시겠습니까')){
		location.href='/dtoi/bulletin_board/deleteComment.do?no='+no+'&bb_no=${vo.bb_no}';
	}
}

</script>
</head>
<body> 
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<input type='hidden' name='bb_no' value="${vo.bb_no }">
<input type='hidden' name='user' value="${vo.cst_id }">		
 <div class="sub">
		<div class="size">
			<h3 class="sub_title">공지사항</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt>${vo.bb_title }</dt>
							<dd class="date">작성일 : ${vo.bb_regdate }</dd>
						</dl>
					</div>
					<div class="cont">${vo.bb_content } </div>
					<tr>				
					<td colspan="11">
						<div class="reple">
							<form name="delete_frm" id="delete_frm" action="/manage/board/comment/process.jsp" method="post">
								<c:if test='${empty clist }'>
								<dl>
									<dd class="bbsno">
										댓글이 없습니다.
									</dd>
								</dl>
								</c:if>
								<c:forEach var="vo" items="${clist}">	
								<dl>
									<dt><strong>${vo.cst_no }</strong> ${vo.regdate }</dt>
									<dd>${vo.bb_comment }
										
										<span class="reEdit">
											<strong class="btn_in inbtn"><input type="button" class="r_delete" value="삭제" onclick='delComment(${vo.no })'/></strong>
										</span>
									</dd>
								</dl>
								</c:forEach>
								<input type="hidden" name="no" id="bb_no" value=""/>
								<input type="hidden" name="url"	id="url" value="<%=request.getAttribute("javax.servlet.forward.request_uri")%>"/>
							</form>
							<div class="rego">
								<form name="comment_frm" id="comment_frm" action="insertComment.do" method="post">
									<dl>
										<dd>
											<textarea class="focus_zone" name="bb_comment" id="bb_comment" title="내용을 입력해주세요"></textarea>
											<div class="btn">
												<div class="btnLeft">
													<a class="btns" style="cursor:pointer;" onclick="$('#comment_frm').submit();"><strong>댓글입력</strong></a>
												</div>					
											</div>					
											<!--//btnAll--> 
										</dd>
									</dl>
									<input type='hidden' name='bb_no' value="${vo.bb_no }">
									<input type='hidden' name='user' value="${vo.cst_id }">														
								</form>
							</div>
							<!-- //rego -->
						</div>
					</td>
					</tr>	
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do" class="btn">목록으로</a></div>
						<div class="fl_l"><a href="edit.do?bb_no=${vo.bb_no }" class="btn"><strong>수정</strong></a></div>
						<div class="fl_l"><a href="javascript:;" onclick='del()' class="btn"><strong>삭제</strong></a></div>
					</div>
			
				</div>
			</div>
		</div>
    </div>

 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>