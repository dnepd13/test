<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>maius</title>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.info{
		margin-top:30px;
		margin-left: 30%;
		margin-right: 30%;
		padding: 20px;
		margin-bottom: -7px;
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
        .clickbtn{
		border:none;
		font-size: 13px;
		background-color: #3498DB;
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
		width: 150px;
		margin-top: 15px;
	}
</style>
</head>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 마이페이지</p>
</div> 

<div class="info">
<h5 style="padding-left: 20px; font-weight: bold;">회원정보</h5>
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
			<h6 class="item1">이름</h6>
			<span class="item2">${my.user_name}</span>
		</div>
	<hr>
		<div class="flex-wrap">
			<h6 class="item1">생년월일</h6>
			<span class="item2">${my.user_birth.substring(0,10)}</span>
		</div>
		
	<hr>
	
	<div style="text-align: center;">
		<a href="${pageContext.request.contextPath}/mypage/edit?user_no=${my.user_no}">
			<button class="clickbtn">정보수정</button>
		</a>
	</div>
</div>
	
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>