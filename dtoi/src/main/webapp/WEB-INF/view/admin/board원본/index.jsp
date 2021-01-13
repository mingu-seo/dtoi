<%@ page contentType="text/html; charset=utf-8" %>
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
					<h2>공지사항 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 111개</strong>  |  1/12페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
										<th scope="col">작성자</th> 
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
								<strong>1</strong>
								<a href="">2</a>
								<a href="">3</a>
								<a href="">4</a>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
									</select>
									<input type="text" name="sval" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
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