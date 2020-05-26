<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function check(){
		if(!$("#name").val()){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		if(!RegExp(/^[가-힣]{2,7}$/).test($("#name").val())){
			alert("이름은 한글 2~7자로 입력해야합니다");
			$("#name").focus();
			return false;
		}
		if(!$("#birth").val()){
			alert("생일을 입력하세요");
			$("#birth").focus();
			return false;
		}
		if(!RegExp(/^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/).test($("#birth").val())){
			alert("예)2020-02-02형식으로 입력해주세요");
			$("#birth").focus();
			return false;
		}
		return true;
	}
	
	function del(){
		if(confirm("정말 삭제하시겠습니까?")==true){
			return true;
		}
		else{
			return false;
		}
	}
</script>
</head>
<body>
<h1>내정보 수정페이지</h1>
<form action="edit" method="post" onsubmit="return check();">
<table border="1">
	<tr>
		<th>아이디</th>
		<th>${my.user_id}</th>
	</tr>
	<tr>
		<th>비밀번호</th>
		<th><a href="${pageContext.request.contextPath}/mypage/pw?user_no=${my.user_no}">
		비밀번호 변경
		</a>
		</th>
	</tr>
	<tr>
		<th>이름</th>
		<th>
		<input id="name" type="text" name="user_name" value="${my.user_name}">
		</th>
	</tr>
	<tr>
		<th>생일</th>
		<th>
		<input id="birth" type="text" name="user_birth" value="${my.user_birth.substring(0,10)}">
		</th>
	</tr>
	<tr>
		<th colspan="2">
		<input type="hidden" name="user_no" value="${my.user_no}"  >
		<input type="submit" value="수정하기">
		<a onclick="return del();" href="${pageContext.request.contextPath}/mypage/delete?user_no=${my.user_no}">
		<input type="button" value="회원탈퇴" >
		</a>
		</th>
	</tr>
</table>


</form>
</body>
</html>