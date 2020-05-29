<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

onload = function(){
	$.ajax({
		url:"/maius/getname",
		data:{
			user_no:"${user_no}"
		},
		success:function(data){
			$("#name1").html(data[0].user_name);
		}
	});
	
}

</script>
<style>
		.menu{
            background-color: white;
            margin-left: 10px;
            margin-right: 10px;
            vertical-align: middle;
            margin-top: 10px;
        }
        .menu > .left-menu{
            float: left;
            margin-left: 20px;
            margin-bottom: 15px;
        }
        .menu > .right-menu{
			font-size:17px;
			font-weight: bold;
            float: right;
            padding: 15px;
            margin-left: 20px;
            color: black;
            vertical-align: middle;       
            margin-top: 8px;    
        }
        .menu::after{
            content: "";
            display: block;
            clear: both;
        }
        
        .menu a{
            text-decoration:none; /* 밑줄제거 */
        }
        
        .menu a:hover{
            color: gray;
        }
       
        .menu > label{
            font-size: 2rem;
            color: black;
            padding: 5px;
            padding-left: 15px;
            cursor: pointer;       
            display: none;
        }
        .menu > #hamburg{
            display: none;
        }
        .menu > #hamburg:checked ~ .menu-item{
            display: block;
        }   
        
         .menu > #hamburg:checked ~ .menu-item.wel{
            display: none;
        }   
         
        /*
            좁은 화면이 되면...
            [1] 라벨 표시
            [2] 메뉴 숨김
            [3] .right-menu의 float를 left로 변경하고 폭을 최대로 키움
        */
        @media screen and (max-width:720px){
            .menu > label{
                display: block;
            }
            .menu > .menu-item{
                display: none;
                width: 100%;
            }
            .menu > .left-menu{
            	display: none;
            }
            .menu > .right-menu{
            	float:left;
                font-size:17px;
				font-weight: bold;
	            padding: 5px;
	            padding-left:20px;
	            vertical-align: middle;      
	            margin-top: 5px;               
            }

        }
 /*//////////////////////////////////////////////////////////////*/     
  		main{
            display: flex; /*바로안에있는것만적용됨*/
            flex-wrap: wrap;
        }
        header{
/*             background-color: rgba(238, 69, 69, 0.308); */
            width: 100%;
        }
        section{
/*             background-color: rgba(38, 233, 184, 0.356); */
            flex-grow: 1;               /* 나머지영역을 다 가져간다 */
            min-height: 630px;
        }
        footer{
/*             background-color: rgba(0, 183, 255, 0.39); */
            width: 100%;
        }
        footer > div{
        	padding-left: 50px;
        }

        /* 모바일 대응 스타일 */
        @media screen and (max-width:640px){
            main{
                flex-direction: column;     /* aside를 1줄로 펼쳐서 보여주도록 변경 */
            }
            header{
                order:1;
            }
            section{
                order:2;
            }
            footer{
                order:3;
            }
        }
</style>

<header>
 <div class="menu menu-fixed">
    <label for="hamburg">
    	&equiv;
    	<a href="${pageContext.request.contextPath}/board/list"  class="left-menu">
		 	 <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" width="150px" height="60px" class="img">
		</a>
    </label>
    <input type="checkbox" id="hamburg">
    
     <a href="${pageContext.request.contextPath}/board/list"  class="left-menu">
	 	 <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" width="150px" height="60px">
	  </a>
    
	 <c:choose>
	      <c:when test="${user_name==null}">
   				<a href="${pageContext.request.contextPath}" class="menu-item right-menu">로그인</a> 
	      </c:when>
	      <c:otherwise>
	      		<a href="${pageContext.request.contextPath}/logout" class="menu-item right-menu">로그아웃</a> 
	      </c:otherwise>
	      </c:choose>
  
    <a href="${pageContext.request.contextPath}/mypage/list" class="menu-item right-menu">마이페이지</a>
    <a href="${pageContext.request.contextPath}/board/list" class="menu-item right-menu">자유게시판</a>
 	
 	<c:if test="${user_name != null}">
   	<span class="menu-item right-menu wel">
   		<i class="fas fa-user-alt"></i> <span id="name1"></span>님 환영합니다
   	</span>
   	</c:if>
</div>
</header>
