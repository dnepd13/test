<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<title>maius</title>
<style>
	#copyright{
		font-family: 'Noto Sans';
	    font-weight: 400;
	    font-size: 11px;
	    padding : 3px;
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
	.cont{
		padding-top: 20px;
		padding-left: 150px;
		padding-right: 150px;
		padding-bottom: 20px;
	}
	table tr th{
	background-color: whitesmoke;
	vertical-align: middle;
	line-height: 1.5;
	}
</style>
<script type="text/javascript">
	function loadEditor(){
	    var editor = SUNEDITOR.create((document.querySelector('textarea[name=board_content]')),{
        //언어 설정
        lang: SUNEDITOR_LANG['ko'],
        
        //버튼 목록
        buttonList:[
        	   ['font', 'fontSize', 'fontColor','underline', 'italic','align']
        ],
        //글꼴 설정
        font:[
            '굴림', '궁서', 'Verdana', 'Arial'
        ],
        //크기 설정
        fontSize:[
            10, 16, 32
        ],       
    });
  	//중요 : 키입력시마다 값을 원래위치(textarea)에 복사
    editor.onKeyUp = function(e){
    	var content = document.querySelector("textarea[name=board_content]");
    	content.value = editor.getContents();
    }
}
//윈도우 로딩 시 loadEditor를 실행하도록 설정(body에 onload 한 효과)
	window.onload = loadEditor;

</script>
<body>
<main>
<section>
<div>	<!-- header와 경계선 -->
	<p style="background-color: rgb(224, 224, 224); padding: 7px; padding-left:50px; font-weight: bold; font-size: 1.1rem;">> 자유게시판</p>
</div> 

<div class="cont" >    
	<h3>글쓰기</h3><span id="copyright">저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.</span><br><br>

	<form action="regist" method="post"  >
		<%-- <input id="writer" type="hidden" name="board_no" value="${id}"> --%>
	
	<table class="table table-bordered">
		<tr align="center">
			<th>제목</th>
			<td>
				<input type="text" name="board_title"  required style="width:100%; height:30px; ">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea style="width: 100%; height: 280px;" name="board_content" required></textarea>
			</td>
		</tr>
		
		<tr style="background-color: whitesmoke;">
			<td colspan="2" align="center">
				<input class="clickbtn" type="submit" value="등록">
				<a href="${pageContext.request.contextPath}/board/list">
					<input class="clickbtn"  type="button" value="목록" style="background-color: #3498DB;">
				</a>
			</td>
		</tr>
	</table>
			
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</section>
</main>
</body>
</html>