<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:choose>
	<c:when test="${vo.foodCount} > 1">
		<c:forEach var="vo" items="${flist}">
			name : ${vo.name }
		</c:forEach>
	</c:when>
	
	
	<c:otherwise>
	{
		"name" : "${vo.name}", 
		"calories" : "${vo.calories}", 
		"carbohydrate" : "${vo.carbohydrate}", 
		"fiber" : "${vo.fiber}", 
		"sugar" : "${vo.sugar}", 
		"protein" : "${vo.protein}", 
		"fat": "${vo.fat}", 
		"sodium" : "${vo.sodium}"
	}
	</c:otherwise>
</c:choose>
]