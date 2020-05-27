<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#insertReply").on("click", function(){
			if($("#content").val() !=""){
				$.ajax({
					url:"/maius/board/replyinsert",
					data:{
						board_no:"${detail.board_no}",
						reply_content:$("#content").val(),
						user_no:"${user_no}"
					},
					success:function(data){
						if(data=="success"){
							alert("댓글이 정삭적으로 등록되었습니다");
							$("#content").val("");
							getreplyList();
						}
					}
				})
			}
			else{
				alert("댓글을 입력하세요");
				$("#content").focus();
			}
		});
		
	});
	
	onload = getreplyList();
	
	function getreplyList(){
		$.ajax({
			url:"/maius/board/replylist",
			data:{
				board_no:"${detail.board_no}"
			},
			success:function(data){
				console.log(data);
				console.log(data.length);
				var html ="";
				var cCnt=data.length;
				var id = "${user_no}";
				if(data.length > 0){
					for(var i=0; i<data.length; i++){
						var age = "${year}"-data[i].user_birth.substring(0,4)+1;
						html +="<div>";
						html +="<div><table><tr><td data-reply-no="+data[i].reply_no;
						html +=" data-board-no="+data[i].board_no;
						html +=" data-user-no="+data[i].user_no+">"+data[i].user_name+"("+age+"세)";
						html +=data[i].reply_wdate.substring(0,16);
						if(id==data[i].user_no){
							html +='<button class="modify">수정</button><button class="del">삭제</button></td></tr>';
						}
						else{
							html +="</td></tr>"; 
						}
						html +="<tr><td>"+data[i].reply_content;
						html +="</td></tr></table></div></div>";
						console.log(id);
						console.log(data[i].user_no);
						console.log(id==data[i].user_no);
					}
				}
				$("#reply_count").html(cCnt);
				$("#commentList").html(html);
			}
		});
		
	}
	$(function(){
		$(document).on("click", ".modify",function(){
			console.log("ddd");
			if($(this).text()=="수정"){
				var cell = $(this).parent().parent().next().children();
				var text = cell.text();
				cell.empty();
				$("<input>").val(text).appendTo(cell);
				$(this).text("완료");
			}
			else{
				var td = $(this).parent().prev();
				var cell = $(this).parent().parent().next().children();
				var text = cell.children().val();
				cell.empty();
				cell.text(text);
				$(this).text("수정");
				var content = cell.text();
				var no = td.data("reply-no");
				var boardno = td.data("board-no");
				var userno = td.data("user-no");
				
				$.ajax({
					url:"/maius/board/replyedit",
					data:{
						"reply_no": no,
						"board_no": boardno,
						"user_no" : userno,
						"reply_content": content
					},
					success:function(data){
						if(data=="success"){
							alert("수정이 완료됐습니다");
						}
					}
				});
				
			}
		});
		$(document).on("click", ".del", function(){
			if(confirm("정말 삭제하시겠습니까?")==true){
				var td = $(this).parent().prev();
				var reply_no = td.data("reply-no");
				var board_no = td.data("board-no");
				console.log(reply_no);
				
				$.ajax({
					url:"/maius/board/replydel",
					data:{
						"reply_no":reply_no,
						"board_no":board_no
					},
					success:function(data){
						if(data=="success"){
							getreplyList();
							alert("댓글이 삭제됐습니다");
						}
					}
				});
			}
			
		});
	});
	
	
	function check(){
		if(confirm("정말 삭제하시겠습니까?")==true){
			return true;
		}
		else{
			return false;
		}
	}
	
	function delCheck(){
		if(confirm("정말 삭제하시겠습니까?")==true){
			return true;
		}
		return false;
	}
	
</script>

</head>
<body>
<h2>게시글 상세보기</h2>
<table border="1" align="center">
	<tr>
		<td>${detail.board_title }</td>
		<td>${detail.board_wdate.substring(0, 16) }</td>
	</tr>
	<tr>
		<td colspan="2">${detail.user_id }(${year-detail.user_birth.substring(0,4)+1}세)</td>
	</tr>
	<tr>
		<td colspan="2">${detail.board_content}</td>
	</tr>
	<tr>
		<td colspan="2">댓글수(<span id="reply_count"></span>) / 조회수(${detail.board_readcount})</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="${pageContext.request.contextPath}/board/regist"><button>글쓰기버튼</button></a>
			<c:if test="${detail.user_no==user_no}">
				<a href="${pageContext.request.contextPath}/board/edit?board_no=${detail.board_no }"><button>수정버튼</button></a>
				<a onclick="return delCheck();" href="${pageContext.request.contextPath}/board/delete?board_no=${detail.board_no}"><button>삭제버튼 </button></a>
			</c:if>
			<a href="${pageContext.request.contextPath}/board/list"><button> 목록버튼</button></a>
		 </td>
	</tr>
	<tr>
		<td><input type="text" name="reply_content" id="content"></td>
		<td><button id="insertReply">댓글등록</button></td>
	</tr>
</table>
	<div id="commentList" align="center"></div>
</body>

</html>