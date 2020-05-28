<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>maius</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
<style>
		.info2{
  		margin-top:100px;  
		margin-left: 30%;
		margin-right: 30%;
		padding: 20px;
	}
	.flex-wrap{
            display: flex;
            flex-direction: row;           /* 줄 안에 배치 */
            padding: 10px;
        }
        @media screen and (max-width:640px){
            .flex-wrap{
             flex-direction: column;   /* 칸 안에 배치 */    
             }
        }
        .item1{
            flex-grow: 9;                   /* 줄에서 남은 공간을 차지하는 비율 */
            height: 15px;                 /* 1개만 높이가 있어도 나머지가 같은 높이로 설정된다. */
            margin-left: 40px;
            font-weight: bold;
            vertical-align: middle;
        }
        .item2{
            flex-grow: 1;
            margin-right: 60px;
        }
	.clickbtn2{
		border:none;
		font-size: 13px;
		background-color: #3498DB;
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
		width: 120px;
		margin-top: 15px;
	}
	.in{
		width: 180px;
		font-size: 13px;
		border-radius: 0.25rem;
		border:1.2px solid rgb(224, 224, 224);
		padding: 0.375rem 0.75rem;
		text-align: center;
		margin-right: 50px;
		box-shadow: none;
	}
	.cont{
		min-height: 65%
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 마이페이지</p>
</div> 

<div class="cont">
<div class="info2">
	<h5 style="padding-left: 20px; font-weight: bold;">비밀번호 변경</h5>
	
<form action="pw" method="post" onsubmit="return check();">
<hr>
		<div class="flex-wrap">
			<h6 class="item1">현재 비밀번호</h6>
			<span class="item3">
				<input class="in" type="password" name="user_pw" id="now">
			</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">새 비밀번호</h6>
			<span class="item3">
				<input class="in" type="password" name="new_user_pw" id="new">
			</span>
		</div>
	<hr>
	
	<c:if test="${param.error != null }">
		<div><h4>비밀번호가 틀렸습니다</h4></div>
	</c:if>
		
		<input type="hidden" name="user_no" value="${user_no }">
			
		<div style="text-align: center;">
			<input class="clickbtn2" type="submit" value="변경하기">
			<input class="clickbtn2" type="button" value="뒤로가기" style="background-color:  rgb(94, 94, 94);" onclick="return back();">
		</div>		
</form>
</div>
</div>
</body>
<script>
	function back() {
		window.history.go(-1);
	}
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>