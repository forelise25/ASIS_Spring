<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
  <%@ include file="../include/lib_header.jsp" %>
  <script>
  $(document).ready(function(){
	 $("#btnWrite").click(function(){
		location.href="${path}/board/write.do"; 
	 });
  });
  function list(page){
	  location.href="${path}/board/list.do?curPage="+page;
  }
  </script>
  <style>
  #selectBtn{
  	background-color: white; 
  	border-radius: 5px;
  	height:38px;
  	border:1px solid #d9d9d9;
  	width:100px;
  	font-size: 10pt;
  }
  
  #selectBtn {
      width: 90px;
      height:38px;
	  background-color: #376457;
	  border:2px solid #376457;
	  color:#FFFFFF;
	  font-weight: bold;
	  transition: all .2s ease-in-out;
	  border-radius: 7px;
	}
	#selectBtn:hover {
	  background-color: #d9d9d9;
	  color:#376457;
	}
	
  #selectNum:hover{
  	
  }
  #selectTitle{
  	color:black;
  	text-decoration: none;
  }
  #selectTitle:hover{
  	color:#376457;
  	
  	font-weight: bold;
  }
  .aPage{
  
  }
  #spanSelectPage{
  
  }
  </style>
  
</head>
<body>
<%@ include file="../include/global_nav.jsp" %>
<%@ include file="../include/main_header.jsp" %>
<%@ include file="../include/main_nav.jsp" %>
<div class="container" style="width:800px;margin-top:20px;">
<center>
<h2>
<b>
<span style="margin-bottom: 20px;">
게시글 목록
</span>
</b>
</h2>
</center>
 <form name="form1" method="post" action="${path}/board/list.do" style="margin:10px;">
        <select name="searchOption" class="form-control" style="width:100px;font-size:10pt;display:inline;">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
            <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>
        <input name="keyword" class="form-control" placeholder="키워드를 입력..." style="width:500px;display:inline;"value="${map.keyword}">
        <input type="submit" id="selectBtn" value="조회">
    </form>

	<span style="font-size:10pt;" id="selectNum"><span style="font-weight:900;">${map.count}</span> 개의 게시물이 있습니다</span>
<table width="600px"class="table table-hover" style="font-size:10pt;margin-top:10px;">
	<tr>
		<th>번호</th><th>제목</th><th>이름</th><th>작성일</th><th>조회수</th>
	</tr>
	<c:forEach var="row" items="${map.list}">
		<tr>
			<td>${row.bno}</td>
			<td>
				<a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
					<span id="selectTitle">${row.title}</span>
					<c:if test="${row.recnt > 0}">
						<span class="badge badge-primary" style="background-color: #376457; margin-left:5px;">${row.recnt}</span>
					</c:if>
				</a>
			</td>
			<td>${row.userName}</td>
			<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${row.viewcnt}</td>
		</tr>
	</c:forEach>
	
</table>
<center>
			<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('1')">[ 처음 ]</a>
			</c:if>
			
			<c:if test="${map.boardPager.curBlock > 1}">
				<a href="javascript:list('${map.boardPager.prevPage}')">[ 이전 ]</a>
			</c:if>
			<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
				<c:choose>
					<c:when test="${num==map.boardPager.curPage}">
						<span style="color:red">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage}')">[ 다음 ]</a>
			</c:if>
			<c:if test="${map.boardPager.curBlock <= map.boardPager.totPage}">
				<a href="javascript:list('${map.boardPager.totPage}')">[ 끝 ]</a>
			</c:if>
	</center>
<c:if test="${sessionScope.userId != null}">
<!-- jstl과 그 속에 이엘코드  -->
	<button type="button" class="btn btn-default" id="selectBtn">글쓰기</button>
</c:if>
</div>
</body>
</html>