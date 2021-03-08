<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
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
		location.href='/dtoi/board/bulletin_board/deleteComment.do?no='+no+'&bb_no=${vo.bb_no}';
	}
}

</script>
</head>
<body> 
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<input type='hidden' name='bb_no' value="${vo.bb_no }">
<input type='hidden' name='cst_no' value="${vo.cst_no }">		
 <div class="sub">
		<div class="size">
			<h3 class="sub_title">자유게시판</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt>${vo.bb_title }</dt>
							<dd class="date">작성자 : ${vo.user_name} </dd> 
							<dd>&nbsp; 작성일 : ${vo.bb_regdate }</dd>
						</dl>
					</div>
					<div class="cont">${vo.bb_content } </div>
					<h5 class="movie_title">댓글</h5>	
					
					<div class="movie">					
						<form action='insertComment.do' method="post" name="frm" id="frm" action="" >
						<input type='hidden' name='bb_no' value="${vo.bb_no }">
						<input type='hidden' name='cst_no' value="${vo.cst_no }">
						<div class="review_area">
							<div class="review_write">
								
								<c:if test='${empty clist }'>
									<dl>
										<dd class="bbsno">
											댓글이 없습니다.
										</dd>
									</dl>
								</c:if>
								
								<c:forEach var="vo" items="${clist}">	
								
								<dl>
									
									<dt><strong>${vo.user_name }</strong> ${vo.regdate }</dt>
									<dd><strong> 내용 : </strong>${vo.bb_comment }
										
										<span class="reEdit" >
											<c:if test="${authUser.cst_no == vo.cst_no}">
												<strong class="btn_in inbtn"><input type="button" class="r_delete" value="삭제" onclick='delComment(${vo.no })'/></strong>
											</c:if>
										</span>
									</dd>
									
								</dl>
								</c:forEach>
								</div>
						</div>
						<div class="review_area">
							<div class="review_write">
								<div class="input">									
									<div class="textarea">
										<textarea name="bb_comment" id="contents"></textarea>
									</div>
									<div class="btn_area">
										<input type="submit" class="btn" onclick="save();" value="등록">
									</div>
								</div>
							</div>
						</div>
					</form>
					</div>
					
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do" class="btn">목록으로</a></div>
						<c:if test="${authUser.cst_no == vo.cst_no}">
							<div class="fl_l"><a href="edit.do?bb_no=${vo.bb_no }" class="btn"><strong>수정</strong></a></div>
							<div class="fl_l"><a href="javascript:;" onclick='del()' class="btn"><strong>삭제</strong></a></div>
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
    </div>

 <%@ include file="/WEB-INF/view/include/footer.jsp" %>
 <%
// 세션객체 가져오기
CustomerVo authUser = (CustomerVo)session.getAttribute("authUser");
%>
<% if (authUser == null) { %>
로그인전
<% } %>
<% if (authUser != null) { %>
<%=authUser.getCst_no() %>님 안녕하세요!
<% } %>
</body>
</html>