<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<h1>ȸ������</h1>
	<hr>
		<div class="can">
		<h3>���̵�</h3>
		<h4>${my.user_id}</h4>
		</div>
	<hr>
		<div class="can">�̸�
		${my.user_name}</div>
	<hr>
		<div class="can">����
		${my.user_birth.substring(0,10)}</div>
	<hr>
<a href="${pageContext.request.contextPath}/mypage/edit?user_no=${my.user_no}">
	<div class="can">
		<button>��������</button>
	</div>
</a>
</body>
</html>