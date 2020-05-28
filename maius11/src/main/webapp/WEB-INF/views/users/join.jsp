<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
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
		
		if(!RegExp(/^[a-zA-Z0-9]{4,20}$/).test($("#id").val())){
			alert("아이디는 대문자 및 소문자, 숫자로 구성가능하며 4~20자리를 입력해야 합니다");
			$("#id").focus();
			return false;
		}
		
		if(!pw){
			window.alert("비밀번호를 입력해주세요!");
			$("#pw").focus();
			return false;
		}
		
		if(!RegExp(/^[a-zA-Z0-9]{4,12}$/).test($("#pw").val())){
			alert("비밀번호는 대문자 및 소문자, 숫자로 구성가능하며 4~12자리를 입력해야 합니다");
			$("#pw").focus();
			return false;
		}
		
		
		if(!name){
			window.alert("이름을 입력해주세요!");
			$("#name").focus();
			return false;
		}
		
		if(!RegExp(/^[가-힣]{2,7}$/).test($("#name").val())){
			alert("이름은 한글 2~7자로 입력해야합니다");
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
<style>
	*{
   	 	box-sizing: border-box;
		text-decoration: none;
	}
	.clickbtn{
		border:none;
		font-size: 13px;
		background-color: rgb(94, 94, 94);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.575rem 0.9rem;
		text-decoration: none;
		width: 220px;
		margin-top: 10px;
	}
	.flex-wrap{
            display: flex;
            flex-direction: row;           /* 줄 안에 배치 */
             margin-bottom: 25px;
             margin-top: 25px;
        }
        @media screen and (max-width:640px){
            .flex-wrap{
             flex-direction: column;   /* 칸 안에 배치 */    
             }
        }
        .item1{
            flex-grow: 9;                   /* 줄에서 남은 공간을 차지하는 비율 */
            height: 30px;                 /* 1개만 높이가 있어도 나머지가 같은 높이로 설정된다. */
            margin-left: 40px;
        }
        .item2{
            flex-grow: 1;
            width: 180px;
			font-size: 15px;
			border-radius: 0.25rem;
			border:1.2px solid rgb(224, 224, 224);
			padding: 0.25rem 0.55rem;
			text-align: center;
			margin-right: 30px;
        }
        .cont{
        	background-color: rgb(224, 224, 224); 
 			margin-left: 37%; 
 			margin-right: 37%; 
 			padding-top: 20px; 
 			border-radius:2rem;
 			min-height: 60%;
 			margin-bottom: 80px;
 			margin-top: 50px;
        }
    
</style>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 10px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 회원가입</p>
</div> 

<form action="join" method="post" class="frm" id="frm" onsubmit="return check();">

	<div class="cont">
	
	<div align="center">
		<h1 align="center" style="margin-top:15px; margin-bottom: 35px;">SIGN UP</h1>
	</div>
	
	<div class="flex-wrap">
		<h6 class="item1">아이디</h6>
		<input class="item2" id="id" type="text" name="user_id" placeholder="id" >

	</div>
	
	<div class="flex-wrap">
		<h6 class="item1">비밀번호</h6>
		<input class="item2" type="password" name="user_pw" placeholder="pw"  id="pw">
	</div>
	<div class="flex-wrap">
		<h6 class="item1">이름</h6>
		<input class="item2" type="text" name="user_name" placeholder="name"  id="name">
	</div>
	<div class="flex-wrap">
		<h6 class="item1">생년월일</h6>
		<input class="item2"  type="date" name="user_birth" placeholder="birth"  id="birth">
	</div>

	<div	align="center">
		<input class="clickbtn" type="submit" value="가입하기">
	</div>


	</div>

</form>


</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>