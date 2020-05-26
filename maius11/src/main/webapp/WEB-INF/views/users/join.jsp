<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
//아이디 중복&형식 검사 
function check() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		var birth = $("#birth").val();
		var count= $("#birth").val().length;
		
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
		if(count!=8){
			window.alert("정확한 생년월일을 입력해주세요!");
			$("#birth").focus();
			return false;
		}
		
		window.alert("회원가입에 성공하셨습니다!");
return true;
}

</script>
<style>
	*{
   	 	box-sizing: border-box;
		text-decoration: none;
	}
	.sign{
		background-color: rgb(224, 224, 224);
		margin-left: 38%;
		margin-right: 38%;
		padding-top: 30px;
		padding-bottom: 20px;
		border-radius: 2rem;
	}
	.clickbtn{
		border:none;
		font-size: 13px;
		background-color: rgb(94, 94, 94);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
		width: 200px;
	}
	.sign-item{
/* 		background-color:blue; */
		margin-top: 23px;
		margin-bottom:23px;
	}
	.sign-item > *{
		
		margin-right: 5px;
	}
	.sign-tag{
		margin-left: 15%;
	}
	
</style>

<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 10px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 회원가입</p>
</div> 

<form action="join" method="post" class="frm" id="frm" onsubmit="return check();">
	<div align="center">
		<h1 align="center" style="margin-top:25px; margin-bottom: 25px;">SIGN UP</h1>
	</div>
	<div class="sign">
		<p class="sign-item">
			<span class="sign-tag">아이디</span> <span><input id="id" type="text" name="user_id" placeholder="id" ></span>
		</p>
		<p class="sign-item">
			<span class="sign-tag">암호</span> <span><input type="text" name="user_pw" placeholder="pw"  id="pw"></span>
		</p>
		
		<p class="sign-item">
			<span class="sign-tag">이름</span>  <span><input type="text" name="user_name" placeholder="name"  id="name"></span>
		</p>		
		
		<p class="sign-item">
			<span class="sign-tag">생년월일</span> <input type="text" name="user_birth" placeholder="birth"  id="birth">
		</p>		
		
		<p class="sign-item" align="center">
			<input class="clickbtn" type="submit" value="가입하기">
		</p>
	</div>
		
</form>


</body>
