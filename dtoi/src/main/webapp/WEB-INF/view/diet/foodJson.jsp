<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[

	{
		"name" : "${vo.name}", 
		"calories" : "${vo.calories}", 
		"carbohydrate" : "${vo.carbohydrate}", 
		"fiber" : "${vo.fiber}", 
		"sugar" : "${vo.sugar}", 
		"protein" : "${vo.protein}", 
		"fat": "${vo.fat}", 
		"sodium" : "${vo.sodium}",
		"searchCount" : "${vo.searchCount}"
	}
]