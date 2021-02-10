<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="customer.CustomerVo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%
CustomerVo uv = new CustomerVo();
uv.setCst_name(request.getParameter("cst_name"));
%>
<% 

String authUser = request.getParameter("authUser");
session.setAttribute("authUser", uv);

%>
<script>
location.href='<%=request.getContextPath()%>/index.do';

</script>