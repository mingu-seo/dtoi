<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>공지사항 - [읽기]</h2>
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
											${vo.title }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											${vo.content }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
												<div class="weidtFile">
													<p><a href="/user/common/download.jsp?path=/upload/&r_file=${vo.filename}&o_file=${vo.filename_org}" target="_blank">${vo.filename_org }</a><br />
												</div>
										</td>
									</tr>
									<tr>
										<td colspan="11">
											<div class="reple">
												<form name="delete_frm" id="delete_frm" action="/manage/board/comment/process.jsp" method="post">
													<c:if test="${empty clist }">
													<dl>
														<dd class="bbsno">
															댓글이 없습니다.
														</dd>
													</dl>
													</c:if>
													<c:if test="${!empty clist }">
													<c:forEach var="vo" items="${clist}">
													<dl>
														<dt>${vo.regdate }</dt>
														<dd>${vo.content }
															<span class="reEdit">
																<strong class="btn_in inbtn"><input type="button" class="r_delete" value="삭제" onclick="goDel(${vo.no});"/></strong>
															</span>
														</dd>
													</dl>
													</c:forEach>
													</c:if>
													<input type="hidden" name="no" id="no" value=""/>
													<input type="hidden" name="url"	id="url" value="<%=request.getAttribute("javax.servlet.forward.request_uri")%>"/>
												</form>
												<div class="rego">
													<form name="comment_frm" id="comment_frm" action="commentInsert.do" method="post">
														<dl>
															<dd>
																<textarea class="focus_zone" name="content" id="contents" title="내용을 입력해주세요"></textarea>
																<div class="btn">
																	<div class="btnLeft">
																		<a class="btns" style="cursor:pointer;" onclick="$('#comment_frm').submit();"><strong>댓글입력</strong></a>
																	</div>					
																</div>					
																<!--//btnAll--> 
															</dd>
														</dl>
														<input type="hidden" name="board_no" value="${vo.no }">
														<input type="hidden" name="user_no" value="0">
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
									<a class="btns" style="cursor:pointer;" href="edit.do?no=${vo.no }"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:;" onclick="del();"><strong>삭제</strong></a>
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
			data:{no:${vo.no}},
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

function goDel(no) {
	if (confirm('삭제하시겠습니까?')) {
		location.href='/user/admin/board/commentDelete.do?no='+no+'&board_no=${vo.no}';
	}
}
</script>
</body>
</html>