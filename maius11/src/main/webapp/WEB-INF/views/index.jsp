<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="error" value="${param.error}"></c:set>
<html>
<head>
	<title>maius</title>
<style>
	.img{
		margin-top: 10%;
		margin-bottom: 40px;
	}
	.in{
		width: 340px;
		font-size: 13px;
		border-radius: 0.25rem;
		border:1.2px solid rgb(224, 224, 224);
		padding: 0.6rem 0.9rem;
		text-align: center;
		margin-right: 50px;
		box-shadow: none;
		margin-bottom: 10px;
		background-image:url("${pageContext.request.contextPath}/resources/image/user.jpg");
		background-repeat: no-repeat;
		background-size: 36.8px 36.8px;
		margin-left: 50px;
	}
	.in2{
		background-image:url("${pageContext.request.contextPath}/resources/image/lock.png");
	}
	.clickbtn{
		border:none;
		font-size: 13px;
		background-color: rgb(180, 185, 195);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.6rem 0.9rem;
		text-decoration: none;
		width: 340px;
		margin-top: 5px;
	}
	.clickbtn2{
		margin-top:-5px;
		background-color: rgb(8, 37, 78);
		padding: 0.6rem 0.9rem;
	}
	.login{
		text-align: center;
	}
</style>	
</head>

<body>
<div class="login">
	<form action="login" method="post">
		<img class="img" src="${pageContext.request.contextPath}/resources/image/logo.jpg">
		<div>
			<input class="in" type="text" name="user_id" placeholder="아이디(ID)" >
		</div>
		<div>
			<input class="in in2" type="password" name="user_pw" placeholder="비밀번호(PW)" >
		</div>

		<c:if test="${param.error != null}">
			<h6 style="color: red;">잘못된 아이디이거나 비밀번호입니다!</h6>
		</c:if>
		<div>
			<input class="clickbtn" type="submit" value="로그인">
		</div>
	</form>
		<div>
			<a href="users/join"><input class="clickbtn clickbtn2" type="button" value="회원가입"></a>
		</div>
</div>
</body>
</html>