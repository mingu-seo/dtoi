<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>장바구니</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
 <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
<div class="sub">
	<div class="size">
		<h3 class="sub_title">장바구니</h3>
			<div class="dateList">
	
			</div>
	
			<div class="bbs"> 
				<div class="ticket">
				<ul>
					<c:forEach var="vo" items="${list}">
					<li>
						<a href="detail.do?pd_no=${vo.pd_no }";>
							<dl>
							<dt class="img">
								<img src="/dtoi/upload/${vo.pd_image }" alt=""/>
							</dt>
								<dd class="title">
									${vo.pd_name }					
							
								</dd>
								<dd class="txt_l">
									가격 : ${vo.pd_price }
								</dd>
								<dd class="txt_l">
									평점 : ${vo.pd_recom }
								</dd>
								<dd class="txt_l">
									상품 정보 : ${vo.pd_content }
								</dd>
							</dl>
						</a>	
					</li>
					</c:forEach>
				</ul>
				</div>
		
			<div class="pagenate clear">
			</div>
			</div>
	</div>
</div>
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>