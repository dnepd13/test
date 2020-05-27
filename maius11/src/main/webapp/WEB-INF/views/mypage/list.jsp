<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 10px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 마이페이지</p>
</div> 
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