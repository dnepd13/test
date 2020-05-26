<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	function check(){
		if(!$("#now").val()){
			alert("현재 비밀번호를 입력하세요");
			$("#now").focus();
			return false;
		}
		if(!$("#new").val()){
			alert("변경할 비밀번호를 입력하세요");
			$("#new").focus();
			return false;
		}
		if(!RegExp(/^[a-zA-Z0-9]{4,12}$/).test($("#now").val())){
			alert("비밀번호는 대문자 및 소문자, 숫자로 구성가능하며 4~12자리를 입력해야 합니다");
			$("#now").focus();
			return false;
		}
		if(!RegExp(/^[a-zA-Z0-9]{4,12}$/).test($("#new").val())){
			alert("비밀번호는 대문자 및 소문자, 숫자로 구성가능하며 4~12자리를 입력해야 합니다");
			$("#new").focus();
			return false;
		}
		return true;
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 변경</h1>
<form action="pw" method="post" onsubmit="return check();">
<table border="1">
	<tr>
		<th>현재 비밀번호</th>
		<td><input type="password" name="user_pw" id="now"></td>
	</tr>
	<tr>
		<th>새 비밀번호</th>
		<td><input type="password" name="new_user_pw" id="new"></td>

	</tr>
</table>
<input type="hidden" name="user_no" value="${user_no }">
<c:if test="${param.error != null }">
<div><h4>비밀번호가 틀렸습니다</h4></div>
</c:if>
<input type="submit" value="변경하기">
</form>
</body>
</html>