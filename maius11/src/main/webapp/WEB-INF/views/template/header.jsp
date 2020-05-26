<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user_no" value="${user_no}"></c:set>
<%
	
%>
<style>
	li{
		color: black;
		font-weight: bold;
		font-size:1.1rem;
		margin: 10px;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a href="${pageContext.request.contextPath}/board/list" style="margin-left: 30px; margin-bottom: 5px;">
 	 <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" width="150px" height="70px">
  </a>
    	<span style="margin-left: 820px;">${user_no}님 환영합니다</span>
  <div class="collapse navbar-collapse d-flex flex-row-reverse bd-highlight"" id="navbarNav" >
    <ul class="navbar-nav" >
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/board/list">자유게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/users/info">마이페이지</a>
      </li>
      <li class="nav-item" style="margin-right: 30px;">
        <a class="nav-link" href="${pageContext.request.contextPath}/users/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>

<div>
	<p style="background-color: rgb(224, 224, 224); padding: 10px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> ??????</p>
</div>