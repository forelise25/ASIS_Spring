<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/lib_header.jsp" %> 
<script>
$(function(){
	listReply();
	//listReply2();
	$("#btnReply").click(function(){
		var replytext=$("#replytext").val();
		var bno="${dto.bno}";
		var param="replytext="+replytext+"&bno="+bno;
		$.ajax({
			type:"post",
			url:"${path}/reply/insert.do",
			data:param,
			success:function(){
				alert("댓글이 등록되었습니다.");
				//listReply2();
				listReply();
			}
		});
	});
	
	$("#btnList").click(function(){
		history.back();
	});
	
	//게시글 삭제 버튼 클릭 이벤트
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "${path}/board/delete.do";
			document.form1.submit();
		}
	});
	//게시글 수정 버튼 클릭 이벤트
	$("#btnUpdate").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		//var writer = $("#writer").val();
		if(title==""){
			alert("제목을 입력하세요");
			title.focus();
			return;
		}
		if(title==""){
			alert("제목을 입력하세요");
			title.focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		/*
		if(writer==""){
			alert("이름을 입력하세요");
			writer.focus();
			return;
		}
		*/
		document.form1.action="${path}/board/update.do"
        document.form1.submit();
	});
});
$(function(){
	  $('input').addClass('form-control');
	  $('textarea').addClass('form-control');
});
function listReply(){
	$.ajax({
		type:"get",
		url:"${path}/reply/list.do?bno=${dto.bno}",
		success:function(result){
			$("#listReply").html(result);
		}
	});
}
function listReply2(){
	$.ajax({
		type:"get",
		url:"${path}/reply/listJson.do?bno=${dto.bno}",
		success:function(result){
			var output="<table>";
			for(var i in result){
				output+="<tr>";
				output+="<td>"+result[i].userName;
				output+="("+changeDate(result[i].regdate)+")<br>";
				output+=result[i].replytext+"</td>";
				output+="</tr>";
			}
			output += "</table>";
			$("#listReply").html(output);
		}
	});
}
function changeDate(date){
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth()+1;
	day = date.getDate();
	hour = date.getHours();
	minute = date.getMinutes();
	second = date.getSeconds();
	strDate = year+"-"+month+"-"+day+"  "+hour+":"+minute+":"+second;
	return strDate;
}
function showReplyModify(rno){
    $.ajax({
        type: "get",
        url: "${path}/reply/detail/"+rno,
        success: function(result){
            $("#modifyReply").html(result);
            // 태그.css("속성", "값")
            $("#modifyReply").css("visibility", "visible");
        }
    })
}
</script>
<style>
form div{
	margin-top:20px;
	margin-bottom:20px;
}
span{
	font-weight: 600;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<%@ include file="../include/global_nav.jsp" %>
<%@ include file="../include/main_header.jsp" %>
<%@ include file="../include/main_nav.jsp" %>
<div class="container" style="width:800px;">
 <h2>게시글 보기</h2>
 <form name="form1" method="post">
 	<div>
 		<span>작성일자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
 	</div>
 	<div>
 		<span>조회수</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.viewcnt}
 	</div>
 	<div>
 		제목 <input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
 	</div>
 	<div>
 		내용 <textarea id="content" name="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.content}</textarea>
 	</div>
 	
	<div>
	이름
	<input type="hidden" name="writer" value="${dto.writer}">
	${dto.writer}
	</div>
	
	<div style="width:650px; text-align:center;">
	<!-- 게시물번호를 hidden으로 처리 -->
	<input type="hidden" name="bno" value="${dto.bno}">
	</div>
	<center style="margin:20px;">
	<c:if test="${sessionScope.userId==dto.writer}">
		
		<button type="button" class="btn btn-default"  id="btnUpdate">수정 </button>
		<button type="button" class="btn btn-default" id="btnDelete">삭제</button>
	 	
 	</c:if>
 		<button type="button" id="btnList">목록</button>
 	</center>
 </form>
 <div style="width:600px; text-align:center;">
 	<c:if test="${sessionScope.userId != null}">
 		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea>
 		<br>
 		<button type="button" id="btnReply">댓글쓰기</button>
 	</c:if>
 </div>
 <div id="listReply"></div>
</div>

</body>
</html>