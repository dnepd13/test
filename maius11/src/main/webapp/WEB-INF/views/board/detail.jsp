<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#insertReply").on("click", function(){
			$.ajax({
				url:"/maius/board/replyinsert",
				data:{
					board_no:"${detail.board_no}",
					reply_content:$("#content").val()
				},
				success:function(data){
					if(data=="success"){
						alert("댓글이 정삭적으로 등록되었습니다");
					}
				}
			})
		});
	});
</script>

</head>
<body>
<h2>게시글 상세보기</h2>
<table border="1">
	<tr>
		<td>${detail.board_title }</td>
		<td>${detail.board_wdate }</td>
	</tr>
	<tr>
		<td colspan="2">${detail.user_id }</td>
	</tr>
	<tr>
		<td colspan="2">${detail.board_content}</td>
	</tr>
	<tr>
		<td colspan="2">댓글수(${detail.board_replycount}) / 조회수(${detail.board_readcount})</td>
	</tr>
	<c:forEach var="list" items="${reply }">
	
	<tr>
		<td colspan="2">${list.user_no} 및 ${list.reply_wdate}</td>
	</tr>
	<tr>
		<td colspan="2">${list.reply_content } 및 수정버튼</td>
	</tr>
	</c:forEach>
	<tr>
		<td><input type="text" name="reply_content" id="content">
		<td><button id="insertReply">댓글등록</button></td>
	</tr>
	<tr>
		<td colspan="2">
			<button>글쓰기버튼 </button>
			<button>수정버튼</button>
			<button>삭제버튼 </button>
			<button> 목록버튼</button>
		 </td>
	</tr>
</table>
</body>
</html>