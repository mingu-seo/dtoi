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
<input type='hidden' name='notice_no' value="${vo.notice_no }">
 <div class="sub">
		<div class="size">
			<h3 class="sub_title">공지사항</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt>${vo.notice_title }</dt>
							<dd class="date">작성일 : ${vo.notice_regdate }</dd>
						</dl>
					</div>
					<div class="cont">${vo.notice_contents } </div>
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