<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<%@ include file="../include/lib_header.jsp" %>
<script>
	$(function(){
		$("#btnLogin").click(function(){
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if(userId ==""){
				alter("아이디를 입력하세요");
				$("#userId").focus();
				return;
			}
			if(userPw ==""){
				alter("비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			document.form1.action = "${path}/login/loginCheck.do";
			document.form1.submit();
		});
	});
</script>
</head>
<body>

<%@ include file="../include/global_nav.jsp" %>
<div class="container">
            <div class="row">
              <div class="col-md-4 col-md-offset-4" id="loginModalCol">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <form name="form1" method="post">
                      <fieldset>
                        <div class="form-group">
                          <input class="form-control" placeholder="ID" type="text" name="userId" id="userId">
                        </div>
                        <div class="form-group">
                          <input class="form-control" placeholder="Password" type="password" name="userPw" id="userPw">
                        </div>
                        <div class="checkbox">
                          <label>
                                <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                              </label>
                        </div>
                        <button class="btn btn-lg btn-success btn-block btn-login" type="button" id="btnLogin">login</button>
                      </fieldset>
                    </form>
                    <hr/>
                    <center>
                      <h4>OR</h4></center>
                    <input class="btn btn-lg btn-facebook btn-block" type="submit" value="Login via facebook">
                  </div>
                  <c:if test="${msg=='failure'}">
					<div style="color:red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${msg=='logout'}">
					<div style="color:red">로그아웃되었습니다.</div>
				</c:if>
                </div>
              </div>
            </div>
          </div>
</body>
</html>