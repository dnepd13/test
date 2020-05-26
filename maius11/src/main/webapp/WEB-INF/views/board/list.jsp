<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	*{
   	 	box-sizing: border-box;
		text-decoration: none;
	}
	.title{
		text-decoration: none;
		color: black;
	}
	.title:hover{
		text-decoration: none;
		color: gray;
	}
	.aaa{
		text-decoration: none;
		color: white;
	}
	.aaa:hover{
		text-decoration: none;
		color: white;
	}
	.cont{
		margin-left: 10px;
		margin-right:10px;
		margin-top: 80px;
		text-align: center;
		height: 460px;
	}
	.bbttnn{
		text-align:right; 
		margin-right: 150px;
	}
	.clickbtn{
		border:none;
		font-size: 13px;
		background-color: rgb(94, 94, 94);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
	}
	
</style>

<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 10px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 자유게시판</p>
</div> 

<div class="cont">
	<table class="table table-hover border="1" align="center"; style="width: 80%; text-align: center;">
		<thead>
			<tr>
				<th>No.</th>						
				<th width="40%">글제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>
					${list.board_no} 
				</td>
				<td style="text-align: left">
					<a href=${pageContext.request.contextPath}/board/content?board_no=${list.board_no} class="title">${list.board_title }</a> 
					[${list.board_replycount }] 
				</td>
				<td>
					${list.board_readcount} 
				</td>
				<td>
					${list.user_name}
				</td>
				<td>
					${list.board_wdate.substring(0,16)}
				</td>
			</tr>				
		</c:forEach>
	</table>
	<p class="bbttnn">
		<button type="button" class="clickbtn">
			<a href=${pageContext.request.contextPath}/board/regist  class="aaa"><i class="fas fa-pencil-alt"></i>글쓰기</a>
		</button>
	</p>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>