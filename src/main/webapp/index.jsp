<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style>
	.back-img {
		background: url("images/phonebook-bg.jpeg");
		width: 100%;
		height: 90vh;
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid back-img text-center text-white">
		<h1 class="pt-3">Welcome to Phone Book App</h1>
	</div>

<%@include file="component/footer.jsp" %>
</body>
</html>