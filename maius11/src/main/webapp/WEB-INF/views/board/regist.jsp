<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div align="center">    
	<h3 align="center">글쓰기</h3><span id="copyright">저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.</span><br><br>

	<form action="regist" method="post"  >
		<%-- <input id="writer" type="hidden" name="board_no" value="${id}"> --%>
	
	<table>
		
			
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="board_title"  required style="text-align:center; width:650px; height:30px; ">
			</td>
		</tr>
				
		
		
		<tr>
			<td colspan="2">
				<textarea    name="board_content" required  cols="100" rows="30"></textarea>
			</td>
		</tr>
		
		<tr >
			<td colspan="2" align="center">
				<input type="submit" value="등록">
				<a href="${pageContext.request.contextPath}/board/list">
					<input class="btn22 category-btn"  type="button" value="목록">
				</a>
			</td>
		</tr>
	</table>
			
	</form>
</div>