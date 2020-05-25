<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>maius</title>
</head>
<body>
<form action="join" method="post">
	<div align="center">
		<img src="${pageContext.request.contextPath}/resources/image/logo.jpg">
		<p>
			<input type="text" name="user_id" placeholder="id" required>
		</p>
		<p>
			<input type="text" name="user_pw" placeholder="pw" required>
		</p>
		<p>
			<input type="submit" value="로그인">
		</p>
		<p>
			<a href="#"><input type="button" value="회원가입"></a>
		</p>
	</div>
</form>
</body>
</html>
