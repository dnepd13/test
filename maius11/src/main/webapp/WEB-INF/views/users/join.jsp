<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
//아이디 중복&형식 검사 
function check() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		var birth = $("#birth").val();
		
		
		console.log(id);
		
		if(!id){
			alert("아이디를 입력해주세요!");
			$("#id").focus();
			return false;
		}
		
		if(!pw){
			window.alert("비밀번호를 입력해주세요!");
			$("#pw").focus();
			return false;
		}
		
		if(!name){
			window.alert("이름을 입력해주세요!");
			$("#name").focus();
			return false;
		}
		
		if(!birth){
			window.alert("생일을 입력해주세요!");
			$("#birth").focus();
			return false;
		}
		
		
		window.alert("회원가입에 성공하셨습니다!");
return true;
}






</script>




<form action="join" method="post" class="frm" id="frm" onsubmit="return check();">
	<div align="center">
		<h2 align="center">SIGN UP</h2>
		<p>
	아이디    <input id="id" type="text" name="user_id" placeholder="id" >
		</p>
		<p>
		암호    <input type="text" name="user_pw" placeholder="pw"  id="pw">
		</p>
		
			<p>
		이름	  <input type="text" name="user_name" placeholder="name"  id="name">
		</p>
		
		
			<p>
		생년월일  <input type="text" name="user_birth" placeholder="birth"  id="birth">
		</p>
		
		
		<p>
			<input type="submit" value="가입하기">
		</p>
		
	</div>
</form>


</body>
