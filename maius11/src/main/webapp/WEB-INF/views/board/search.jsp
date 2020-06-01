<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<html>
<title>maius</title>
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
		position: relative;
		padding-bottom: 15px;
	}
	.bbttnn{
		text-align:right; 
		margin-right: 150px;
	}
	.clickbtn{
		border:none;
		font-size: 14px;
		background-color: rgb(94, 94, 94);
		border-radius: 0.25rem;
		color: white;		
		padding: 0.375rem 0.75rem;
		text-decoration: none;
	}
</style>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 자유게시판</p>
</div> 

<div class="cont">
<div align="right">
<form action="search" method="get" >    	
		    		<select id="selectt" name="type">
		    			<option value="board_title">글제목</option>
		    			<option value="user_name">작성자</option>
		    		</select>    		
	    		<input type="text" name="keyword"  required>
				<input id="search-btn" type="submit"  value="검색" >
			</form>
</div>
	<table class="table table-hover"  align="center"  style="width: 80%; text-align: center; font-size: 14px;">
		<thead>
			<tr>
				<th>No.</th>						
				<th width="40%">글제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		  <c:choose>
		<c:when test="${!empty search}">
			<c:forEach var="search" items="${search}">
			<tr>
				<td>
					${search.board_no} 
				</td>
				<td style="text-align: left">
					<a href="${pageContext.request.contextPath}/board/detail?board_no=${search.board_no}" class="title">${search.board_title }</a> 
					[${search.board_replycount}] 
				</td>
				<td>
					${search.board_readcount} 
				</td>
				<td>
					${search.user_name}(${year-search.user_birth.substring(0,4)+1}세)
				</td>
				<td>
					${search.board_wdate.substring(0,16)}
				</td>
			</tr>				
		</c:forEach>
		</c:when>
		<c:otherwise>
	    		<tr>
					<td colspan="5">
						검색 결과가 없습니다.
					</td>
				</tr>
	    	</c:otherwise>
	    </c:choose>
	</table>
	
	<p class="bbttnn">
		<button type="button" class="clickbtn">
			<a href="${pageContext.request.contextPath}/board/regist" class="aaa"><i class="fas fa-pencil-alt"></i>글쓰기</a>
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
</body>
</html>