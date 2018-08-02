<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="include/lib_header.jsp" %>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="${path}/resources/css/global.css">
  <link rel="stylesheet" href="${path}/resources/css/loginForm.css">
  <link rel="stylesheet" href="${path}/resources/css/index.css">
</head>
<body>
  
  <%@ include file="include/global_nav.jsp" %>
  <!-- The registModal -->
  <div class="modal" id="registModal">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Register ASIS site</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <div class="container">
            <div class="row">
              <div class="col-md-4 col-md-offset-4" id="registerModalCol">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <article class="card-body">
                    <form>
                      
                      <div class="form-group">
                        <label>아이디</label>
                        <input type="text" name="userId" class="form-control" placeholder="대소문자 구분">
                      </div> <!-- form-group end.// -->
                      <div class="form-group">
                        <label>비밀번호</label>
                        <input type="password" name="userPw" class="form-control" placeholder="대소문자구분 12자리 이하">
                      </div> <!-- form-group end.// -->
                      <div class="form-group">
                        <label>이름</label>
                        <input type="text" name="userName" class="form-control" placeholder="">
                        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                      </div> <!-- form-group end.// -->
                       <div class="form-group">
                        <label>Email address</label>
                        <input type="email" class="form-control" placeholder="">
                        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                      </div> <!-- form-group end.// -->
                      <div class="form-group">
                          <label class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" value="option1">
                          <span class="form-check-label"> Male </span>
                        </label>
                        <label class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" value="option2">
                          <span class="form-check-label"> Female</span>
                        </label>
                      </div> <!-- form-group end.// -->
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label>City</label>
                          <input type="text" class="form-control">
                        </div> <!-- form-group end.// -->
                        <div class="form-group col-md-6">
                          <label>Country</label>
                          <select id="inputState" class="form-control">
                            <option> Choose...</option>
                              <option>Uzbekistan</option>
                              <option>Russia</option>
                              <option selected="">United States</option>
                              <option>India</option>
                              <option>Afganistan</option>
                          </select>
                        </div> <!-- form-group end.// -->
                      </div> <!-- form-row.// -->
                      <div class="form-group">
                        <label>Create password</label>
                          <input class="form-control" type="password">
                      </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block" style="background-color:#376457;border-color:#376457;"> Register  </button>
                        </div> <!-- form-group// -->
                        <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>
                    </form>
                    </article>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="jumbotron text-center" style="background-image: url('${path}/resources/images/mainBackground.jpg');">
    <span id="mainTitle">Active Senior Increase Social</span>
    <p style="margin-bottom:30px;">액티브 시니어가 사회를 성장시킵니다</p>
    <form action="/action_page.php">
      <input class="form-control mr-sm-2" id="searchInput" type="text" placeholder="Search">
      <button class="btn btn-success" id="searchBtn" type="submit">Search</button>
    </form>
  </div>
	
  <%@ include file="include/main_nav.jsp" %>
  
  <div class="container">
    <div class="row">
        <div class="col-sm-4 recruitAnnounceBlock">
          <article>
            <div class="container img-wrap">
              <img class="img-responsive" src="${path}/resources/images/logo1_sk.png">
            </div>
            <h5><b>SK이노베이션(주)</b></h5>
            <p>2018 하반기 신입/경력 공개채용</p>
            <p style="margin-top:15px;margin-bottom:0px;"><span style="margin-right:240px;">D-4</span><img class="heart" src="${path}/resources/images/emptyHeart.png"/></p>
          <article>
        </div>
      </article>
      <div class="col-sm-4 recruitAnnounceBlock">
        <article>
          <div class="container img-wrap">
            <img class="img-responsive" src="${path}/resources/images/logo2_woori.jpg">
          </div>
          <h5><b>우리은행(주)</b></h5>
          <p>신입 및 경력사원 수시채용</p>
          <p style="margin-top:15px;margin-bottom:0px;"><span style="margin-right:240px;">D-4</span><img class="heart" src="${path}/resources/images/emptyHeart.png"/></p>
        </article>
      </div>
      <div class="col-sm-4 recruitAnnounceBlock">
        <article>
          <div class="container img-wrap">
            <img class="img-responsive" src="${path}/resources/images/logo3_line.gif">
          </div>
          <h5><b>LINE(주)</b></h5>
          <p>2018 연구개발본부 경력채용</p>
          <p style="margin-top:15px;margin-bottom:0px;"><span style="margin-right:240px;">D-4</span><img class="heart" src="${path}/resources/images/emptyHeart.png"/></p>
        </article>
      </div>
    </div>
  </div>

</body>
