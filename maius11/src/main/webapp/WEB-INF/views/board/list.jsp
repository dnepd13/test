<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<table border="1">
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
				<a href=${pageContext.request.contextPath}/board/content?board_no=${list.board_no}>${list.board_title }</a> 
				[${list.board_replycount }] 
			</td>
			<td>
				${list.board_readcount} 
			</td>
			<td>
				${list.user_no}
			</td>
			<td>
				${list.board_wdate.substring(0,16) }
			</td>
		</tr>				
	</c:forEach>
</table>