<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
			alert("예)2020-02-02 형식으로 입력해주세요");
			$("#birth").focus();
			return false;
		}
		return true;
	}
	
	function del(){
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			return true;
		}
		else{
			return false;
		}
	}
</script>
<style>
		.info{
/* 		margin-top:10px; */
		margin-left: 30%;
		margin-right: 30%;
		padding: 20px;
	}
	.flex-wrap{
            display: flex;
            flex-direction: row;           /* 줄 안에 배치 */
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
        }
        .item2{
            flex-grow: 1;
            margin-right: 60px;
        }
        .iem3{
        	 flex-grow: 1;
        }
        .clickbtn{
		border:none;
		font-size: 13px;
		background-color: rgb(224, 224, 224);
		border-radius: 0.25rem;
		color: black;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
		width: 130px;
		margin-top: 5px;
	}
	.clickbtn2{
		border:none;
		font-size: 13px;
		background-color: rgb(94, 94, 94);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
		width: 120px;
		margin-top: 5px;
	}
	.in{
		width: 130px;
		font-size: 13px;
		border-radius: 0.25rem;
		background-color: rgb(224, 224, 224);
		border:none;
		padding: 0.375rem 0.75rem;
		text-align: center;
	}
</style>
</head>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 마이페이지</p>
</div> 

<div class="info">
	<h5 style="padding-left: 20px; font-weight: bold;">정보수정</h5>
	<form action="edit" method="post" onsubmit="return check();">
	
	<hr>
		<div class="flex-wrap" >
			<span class="item2" style="text-align: right; ">
				<i class="fas fa-user-circle" style="font-size: 130px;"></i>
			</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">아이디</h6>
			<span  class="item2">${my.user_id}</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">비밀번호</h6>
			<span>
				<a href="${pageContext.request.contextPath}/mypage/pw?user_no=${my.user_no}">
					<input class="item2 clickbtn" type="button" value="비밀번호 변경">
				</a>
			</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">이름</h6>
			<span class="item3">
				<input class="in item2" id="name" type="text" name="user_name" value="${my.user_name}">
			</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">생일</h6>
			<span class="item3">
				<input class="in item2" id="birth" type="text" name="user_birth" value="${my.user_birth.substring(0,10)}">
			</span>
		</div>
	<hr>
		
			<input type="hidden" name="user_no" value="${my.user_no}"  >
			
		<div style="text-align: center;">
			<input class="clickbtn2" type="submit" value="수정하기" style="background-color: #3498DB;">
			<a onclick="return del();" href="${pageContext.request.contextPath}/mypage/delete?user_no=${my.user_no}">
				<input class="clickbtn2" type="button" value="회원탈퇴" >
			</a>
		</div>		
	</form>
</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>