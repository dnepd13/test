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
		margin-top: 40px;
		height: 60%;
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
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 자유게시판</p>
</div> 

<div class="cont">
	<table class="table table-hover border="1" align="center"; style="width: 80%; text-align: center; font-size: 13px;">
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
					<a href=${pageContext.request.contextPath}/board/detail?board_no=${list.board_no} class="title">${list.board_title }</a> 
					[${list.board_replycount}] 
				</td>
				<td>
					${list.board_readcount} 
				</td>
				<td>
					${list.user_name}(${year-list.user_birth.substring(0,4)+1}세)
				</td>
				<td>
					${list.board_wdate.substring(0,16)}
				</td>
			</tr>				
		</c:forEach>
	</table>
	
	<p class="bbttnn">
		<button type="button" class="clickbtn">
			<a href="${pageContext.request.contextPath}/board/regist"  class="aaa"><i class="fas fa-pencil-alt"></i>글쓰기</a>
		</button>
	</p>
	  <div class="container nav" style="text-align: center;">
    		<!-- 네비게이터(navigator) -->    		
    		<jsp:include page="/WEB-INF/views/template/board_navigator.jsp">
    			<jsp:param name="pno" value="${pno}" />
    			<jsp:param name="count" value="${count}" />
    			<jsp:param name="navsize" value="${navsize}" />
    			<jsp:param name="pagesize" value="${pagesize}" />
    			<jsp:param name="board_category" value="${board_category}"/>
    		</jsp:include>
   </div>

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>