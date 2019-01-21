<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<!-- 
Date : 19-01-10
내용 : 로그인 모달 추가
Date : 19-01-15
내용 : 시큐리티 권한 설정
작성자 : 고은아
-->
<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link href="css/header.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
</head>

<body>	
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="main.do">Complain Zero</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<c:if test="${empty pageContext.request.userPrincipal}">
						<li class="nav-item"><a href="loginForm.do" class="nav-link" id="loginBtn">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm.do">회원가입</a></li>
					</c:if>

					<li class="nav-item"><a class="nav-link" href="boardForm.do">게시판</a></li>

					<c:if test="${not empty pageContext.request.userPrincipal}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img alt=""
							src="https://github.githubassets.com/images/modules/open_graph/github-octocat.png"
							id="profile">&nbsp<span id="nickname"></span> 님
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<se:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
							<a class="dropdown-item" href="#">작성 글 확인</a> 
							</se:authorize>
							<a class="dropdown-item" href="userMyPage.do">내 정보 수정</a>
							<se:authorize ifAnyGranted="ROLE_COMPANY">
							<a class="dropdown-item" href="enterUserMyPage.do">상인유저 테스트</a>  
							</se:authorize>
							<se:authorize ifAnyGranted="ROLE_ADMIN">
							<a class="dropdown-item" href="adminForm.do">관리자 - 마이페이지</a> 
							</se:authorize>
							<a class="dropdown-item" href="j_spring_security_logout">로그아웃</a>
						</div></li>
						
											<li class="nav-item"><a class="nav-link" href="#"> <i
							class="far fa-bell"></i><span class="badge">0</span>
					</a>
					<li class="nav-item"><a class="nav-link" href="#"> <i
							class="far fa-comments"></i><span class="badge">0</span>
					</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	
	<script type="text/javascript">
	var session  = ('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}');
	$(function() {
		if (session != null) {
			// ajax 돌려서 프로필 이미지, 닉네임 붙여넣기!
		}
	})
	</script>