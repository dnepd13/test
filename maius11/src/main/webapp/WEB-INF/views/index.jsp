<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="error" value="${param.error}"></c:set>
<html>
<head>
	<title>maius</title>
</head>

<body>
<div align="center">
	<form action="login" method="post">
		<img src="${pageContext.request.contextPath}/resources/image/logo.jpg">
		<p>
			<input type="text" name="user_id" placeholder="id">
		</p>
		<p>
			<input type="password" name="user_pw" placeholder="pw">
		</p>
		<c:if test="${param.error != null}">
			<h6>잘못된 아이디이거나 비밀번호입니다!</h6>
		</c:if>
		<p>
			<input type="submit" value="로그인">
		</p>
	</form>
</div>
		<p align="center">
			<a href="users/join"><input type="button" value="회원가입"></a>
		</p>
</body>
</html>