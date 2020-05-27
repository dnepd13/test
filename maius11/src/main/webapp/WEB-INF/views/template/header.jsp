<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.nav-item{
		color: black;
		font-weight: bold;
		font-size:17px;
		margin: 10px;
	}
	.nav-item:active a{
	color: black;
	}
	.bg-light{
		background-color: white;
	}
	.navbar{
		background-color: white;
	}
	html, body{
	 	margin:0; padding:0; width:100%; height:100%;
	 }
	 .wrapper{ 
	 	display: flex; min-height: 100vh; flex-direction: column;
	}
	.cont{
		flex: 1;
		 min-height: 80%;
	}
	.info{
		flex: 1;
		 min-height: 75%;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a href="${pageContext.request.contextPath}/board/list" style="margin-left: 30px; margin-bottom: 10px;">
 	 <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" width="150px" height="60px">
  </a>
    	<span style="margin-left: 50%;"><i class="fas fa-user-alt"></i> ${user_name}님 환영합니다</span>
  <div class="collapse navbar-collapse d-flex flex-row-reverse bd-highlight"" id="navbarNav" >
    <ul class="navbar-nav " >
      <li class="nav-item ">
        <a class="nav-link" href="${pageContext.request.contextPath}/board/list">자유게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/list">마이페이지</a>
      </li>
      <li class="nav-item" style="margin-right: 30px;">
        <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>
