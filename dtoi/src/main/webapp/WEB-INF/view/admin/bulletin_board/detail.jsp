<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
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
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/include/top.jsp" %>
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
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											${vo.bb_title }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작성자</label></th>
										<td colspan="10">
											${vo.cst_id }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											${vo.bb_content }
										</td>
									</tr>									
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
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?bb_no=${vo.bb_no }"><strong>수정</strong></a>
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

</body>
</html>