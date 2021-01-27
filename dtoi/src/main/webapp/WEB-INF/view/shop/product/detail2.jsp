<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.*" %>
<%@ page import="customer.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<title>상품 정보</title>
<%@ include file="/WEB-INF/view/include/userHeadHtml.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
 <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">상품 정보</h3>
			<div class="bbs">
				<div class="movie">
					<div class="info">
						<div class="img">
							<img src="/dtoi/img/product/info_image/${vo.pd_image }" alt=""/>
						</div>
						<div class="movie_info">
							<dl>
								<dt class="title">
										${vo.pd_name }	
								</dt>
								<dt class="info_detail">
									<strong>가격</strong>&nbsp; : ${vo.pd_price }
								</dt>
								<dt class="info_detail">
									<strong>평점</strong>&nbsp; : ${vo.pd_recom }
								</dt>
								<dt class="synop">
									<strong>시놉시스</strong> <br/>
									<div class="synop_contents">
										 ${vo.pd_content}
									</div>
								</dt>
								<dt class="reser_btn">
									<input type="button" class="btn" value="장바구니" onclick="showDialogue('${vo.pd_no }');"/>
									<input type="button" class="btn" value="바로 구매" onclick="showDialogue('${vo.pd_no }');"/>
								</dt>
							</dl>
						</div>
					</div>
					<h5 class="movie_title"><strong>제품 상세</strong></h5>
					<div class="stillcut_area">
							<div class="swiper_stillcut swiper-container">
				                <div class="swiper-wrapper">
				                
				                  
				                    <div class="img">
				                    	<img src="/dtoi/img/product/info_image/${vo.pd_image }"/>
				                  
				                    	<img src="/dtoi/img/product/info_image/${vo.pd_image }"/>
				                
				                    	<img src="/dtoi/img/product/info_image/${vo.pd_image }"/>
		
				                    	<img src="/dtoi/img/product/info_image/${vo.pd_image }"/>
				                    </div>
		
				            </div>
					</div>
					<h5 class="movie_title"><strong>포토 리뷰</strong></h5>
					<div class="trailler_area">
						<ul>
						 
							<li>
								<div class="video_container">
									<iframe src="" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
						</ul>
					</div>
					
					<form method="post" name="frm" id="frm" action="" >
					<input type="hidden" name="movie_pk" value="${vo.pd_no} }"/>
					<h5 class="movie_title">리뷰</h5>
					<div class="review_area">
						<div class="review_write">
							<div class="input">
								<div class="rate">
									<select name="score">
									</select>
								</div>
								
								<div class="textarea">
									<textarea name="contents" id="contents"></textarea>
								</div>
								<div class="btn_area">
									<input type="button" class="btn" onclick="save();" value="등록">
								</div>
							</div>
						</div>
					
					</form>
						
<script>
$(function() {
	getList();
});

function getList() {
	$.ajax({
		url : "pdreviewInsert.do",
		dataType : "html",
		data : data,  
		async : true,
		success : function(data) {
			$(".review_list").html(data);
		},
		error : function(msg) {
			console.log(msg);
		}
	});
}

function goDelete(re_no) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : "/dtoi/shop/pdreview/delete.do",
			data : data,
			async : true,
			success : function(data) {
				var d = data.trim();
				if (d>0) {
					getList();
					alert("정상적으로 삭제되었습니다.");
				} else {
					alert("삭제실패");
				}
			},
			error : function(msg) {
				console.log(msg);
			}
		});
	}
}

</script>
						<div class="review_list">
							
						</div>
					</div>
				</div>
			</div>
		</div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script>
$(function(){
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		autoplay: {
		    delay: 5000,
		  },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
       	},
	});
});
</script>
</body>
</html>