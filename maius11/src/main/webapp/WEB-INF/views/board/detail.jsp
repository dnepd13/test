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
				var html ="";
				var cCnt=data.length;
				var id = "${user_no}";
				if(data.length > 0){
					for(var i=0; i<data.length; i++){
						var age = "${year}"-data[i].user_birth.substring(0,4)+1;
						html +="<div>";
						html +="<div><table class=table table-bordered><tr><td data-reply-no="+data[i].reply_no;
						html +=" data-board-no="+data[i].board_no;

						html +=" data-user-no="+data[i].user_no+">"+"<span class=space>"+data[i].user_name+"("+age+"세)</span>";
						html +="<span class=space>"+data[i].reply_wdate.substring(0,16)+"</span>";

						if(id==data[i].user_no){
							html +='<button class="modify">수정</button><button class="del">삭제</button></td></tr>';
						}
						else{
							html +="</td></tr>"; 
						}
						html +="<tr><td>"+data[i].reply_content;
						html +="</td></tr></table></div></div>";
					}
				}
				$("#reply_count").html(cCnt);
				$("#commentList").html(html);
			}
		});
		
	}
	$(function(){
		$(document).on("click", ".modify",function(){
			if($(this).text()=="수정"){
				var cell = $(this).parent().parent().next().children();
				var text = cell.text();
				cell.empty();
				$("<input class=edit>").val(text).appendTo(cell);
				$(this).text("완료");
			}
			else{
				var td = $(this).parent();
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
				var td = $(this).parent();
				var reply_no = td.data("reply-no");
				var board_no = td.data("board-no");
				
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
<style>
	.color{
		background-color: whitesmoke;
		vertical-align: middle;
		line-height: 1.5;
	}
	.flex-wrap{
            display: flex;
            flex-direction: row;           /* 줄 안에 배치 */
        }
        @media screen and (max-width:640px){
            .flex-wrap{
             flex-direction: column;   /* 칸 안에 배치 */    
             }
        }
        .item1{
            flex-grow: 9;                   /* 줄에서 남은 공간을 차지하는 비율 */
            height: 100px;                 /* 1개만 높이가 있어도 나머지가 같은 높이로 설정된다. */
        }
        .item2{
            flex-grow: 1;
        }
         .item3{
            flex-grow: 9;                   /* 줄에서 남은 공간을 차지하는 비율 */
            height: 20px;                 /* 1개만 높이가 있어도 나머지가 같은 높이로 설정된다. */
        }
        .item4{
            flex-grow: 1;
            text-align : right;
        }
        .re_input{
		     font-size: 13px;
			  display: inline-block;
			  font-weight: 400;
			  color: #212529;
			  text-align: center;
			  vertical-align: middle;
			  background-color: whitesmoke;
			  border: 1px solid #dee2e6;
			  padding: 0.375rem 0.75rem;
			  line-height: 1.5;
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
	 .clickbtn2{
			border:none;
			font-size: 13px;
			background-color: #3498DB;
			border-radius: 0.25rem;
			color: white;		
			padding: 0.375rem 0.75rem;
			text-decoration: none;
		}
		.space{
			margin-right: 20px;
		}
		.modify{
			border:none;
			font-size: 13px;
			background-color: rgb(94, 94, 94);
			border-radius: 0.25rem;
			color: white;		
			padding: 0.2rem 0.5rem;
			text-decoration: none;
			margin-right: 5px;
		}
		.del{
			border:none;
			font-size: 13px;
			background-color: #3498DB;
			border-radius: 0.25rem;
			color: white;		
			padding: 0.2rem 0.5rem;
			text-decoration: none;
		}
		.edit{
			width: 100%;
			height: 70px;
		}
</style>

</head>
<body>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 자유게시판</p>
</div> 

<div class="container"  style="border: 1px solid #dee2e6 !important; padding-top: 15px; margin-bottom: 10px; font-size: 14px;">	
<table class="table table-bordered">
	<tr>
		<td class="color" colspan="2">
			<div class="flex-wrap">
				<span class="item3">${detail.board_title }</span>

				<span class="item4" style="text-align: right">${detail.board_wdate.substring(0,16) }</span>
			</div>
		</td>

	</tr>
	<tr>
		<td colspan="2">${detail.user_id }(${year-detail.user_birth.substring(0,4)+1}세)</td>
	</tr>
	<tr>
		<td colspan="2" height="200">${detail.board_content}</td>
	</tr>
	<tr>
		<td  class="color" colspan="2">댓글수 <span id="reply_count"></span> &nbsp; | &nbsp; 조회수 ${detail.board_readcount}</td>
	</tr>
</table>
	
<div id="commentList" align="center"></div>

<table class="table table-bordered">	
	<tr>
		<td>
			<div class="flex-wrap">
				<textarea name="reply_content" id="content" rows="4" required style="width: 87%;"></textarea>
				<button class="re_input item2" id="insertReply">댓글등록</button>
			</div>
		</td>
	</tr>
	<tr align="right">
		<td colspan="2">
			<a href="${pageContext.request.contextPath}/board/regist"><button class="clickbtn2">글쓰기</button></a>
			<c:if test="${detail.user_no==user_no}">
				<a href="${pageContext.request.contextPath}/board/edit?board_no=${detail.board_no }"><button class="clickbtn">수정</button></a>
				<a onclick="return delCheck();" href="${pageContext.request.contextPath}/board/delete?board_no=${detail.board_no}"><button class="clickbtn">삭제 </button></a>
			</c:if>
			<a href="${pageContext.request.contextPath}/board/list"><button class="clickbtn2"> 목록</button></a>
		 </td>
	</tr>
</table>
</div>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>