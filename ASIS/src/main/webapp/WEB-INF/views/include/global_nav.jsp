<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}/resources/css/global_nav.css">
<nav class="navbar navbar-expand-sm bg-white navbar-white">
    <!-- Links -->
    <ul class="navbar-nav globalNav">
      <li class="nav-item">
        <a class="nav-link" href="#">AS_IS 앱 설치</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">오투잡</a>
      </li>
      <li class="nav-item text-right">
        <a class="nav-link" href="#">고객센터</a>
      </li>
    </ul>
    <!-- Links -->
    <ul class="navbar-nav globalNav" id="globalNavLeft">
    <c:if test="${sessionScope.userId != null}">
		<li class="nav-item">
        <a class="nav-link" href="login/login.do">${sessionScope.userName}님 반갑습니다</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login/login.do">마이페이지</a>
      </li>
	</c:if>
	<c:if test="${sessionScope.userId == null}">
		<li class="nav-item">
        <a class="nav-link" href="login/login.do">로그인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="member.write.do">회원가입</a>
      </li>
	</c:if>
      
      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
          개인회원
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">개인회원안내</a>
          <a class="dropdown-item" href="#">이력서등록</a>
          <a class="dropdown-item" href="#">입사지원 현황</a>
          <a class="dropdown-item" href="#">최근 본 공고</a>
          <a class="dropdown-item" href="#">개인정보 수정</a>
        </div>
      </li>
      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
          기업회원
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">채용공고등록</a>
          <a class="dropdown-item" href="#">공고/지원자관리</a>
          <a class="dropdown-item" href="#">기업정보 수정</a>
          <a class="dropdown-item" href="#">결제내역 조회</a>
          <a class="dropdown-item" href="#">유료서비스 안내</a>
          <a class="dropdown-item" href="#">SIAT인적성검사</a>
        </div>
      </li>
      <li class="nav-item text-right">
        <a class="nav-link" href="#">알림센터</a>
      </li>
    </ul>
  </nav>