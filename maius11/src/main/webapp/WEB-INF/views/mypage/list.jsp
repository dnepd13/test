<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		padding-left: 30%;
		padding-top: 100px;
	}
	#tab{
	}
	hr{
		width:40%;
	}
	.can{
		padding-left:30%;
	}
</style>
</head>
<body>
<h1>회원정보</h1>
	<hr>
		<div class="can">
		<h3>아이디</h3>
		<h4>${my.user_id}</h4>
		</div>
	<hr>
		<div class="can">이름
		${my.user_name}</div>
	<hr>
		<div class="can">생일
		${my.user_birth.substring(0,10)}</div>
	<hr>
<a href="${pageContext.request.contextPath}/mypage/edit?user_no=${my.user_no}">
	<div class="can">
		<button>정보수정</button>
	</div>
</a>
</body>
</html>