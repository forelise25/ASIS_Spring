<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/lib_header.jsp" %>
</head>
<body>
    <table style="width:700px">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.userName}(<fmt:formatDate value="${row.regdate}" 
                pattern="yyyy-MM-dd HH:mm:ss"/>)
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <c:if test="${sessionScope.userId == row.replyer}">
                    <input type="button" id="btnModify" value="수정" 
                    onclick="showReplyModify('${row.rno}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach>
   </table>
    <div id="modifyReply"></div>
</body>
</html>