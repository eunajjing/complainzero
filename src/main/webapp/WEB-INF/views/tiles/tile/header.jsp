<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!-- 
Date : 19-01-10
내용 : 로그인 모달 추가
Date : 19-01-15
내용 : 시큐리티 권한 설정
작성자 : 고은아
Date : 19-01-24
내용 : 알림 구현
작성자 : 조영규
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
<se:authentication property="principal" var="principal"/>

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
						<li class="nav-item"><a href="loginForm.do" class="nav-link"
							id="loginBtn">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm.do">회원가입</a></li>
					</c:if>

					<li class="nav-item"><a class="nav-link" href="boardForm.do">게시판</a></li>

					<c:if test="${not empty pageContext.request.userPrincipal}">
					<input type="hidden" value="${principal.username }" id="session">
						<li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="#"
            id="navbarDropdownPortfolio" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false"> <img alt=""
              src="https://github.githubassets.com/images/modules/open_graph/github-octocat.png"
              id="profile" name="profile">&nbsp&nbsp<span id="hnickname"name="hnickname">님</span> 
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

            <!-- 알림 시작 -->
            <input type="hidden" value="${temp }" id="temp">
            <li class="nav-item dropdown" id="alarm">
            <a class="nav-link dropdown-toggle" href="#"
            id="alarmToggle" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <i class="far fa-bell"></i> 
            <span class="badge" style="color: yellow;">0</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right"
                aria-labelledby="alarmToggle" id="div" 
                style="overflow:scroll; width:300px; height:500px; padding:10px;">
            </div>
            </li>
            <!-- 알림 끝 -->
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

  <script src="http://localhost:3000/socket.io/socket.io.js"></script>
	<script type="text/javascript">

		var session = ('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}');
		$(function() {
			if (session != null) {
				// ajax 돌려서 프로필 이미지, 닉네임 붙여넣기!
			}
			
			if($('#session').val() != null) {
			 var socket = io("http://localhost:3000");
			 var id = $('#session').val();
			 
			 socket.on('connect', function() {
				 socket.emit('login', id);
				 
				 socket.on('alarmList', function(alarmList) {
// 					 var cnt = 1;
					 
					 $('.badge').text(alarmList.count);
					 $('#alarm').click(function() {
						 $.each(alarmList.data, function(i, alarm) {
							 var code;
							 
							 if(alarm.alarmCode == 'A00') {
// 								 if(cnt == 1) {
								  code = '새로운 신고가 접수되었습니다';
								  $('#div').append("<a class='dropdown-item' name='name' href='selectReport.do''>" + code + "</a>");
// 								  cnt = 0;
// 								 }
							 } if(alarm.alarmCode == 'A01') {
								 code = '게시물에 댓글이 달렸습니다';
								 $('#div').append("<a class='dropdown-item' name='name' href='selectOneBoard.do?bno='" + alarm.bno + ">" + code + "</a>");
							 } if(alarm.alarmCode == 'A02-1') {
								 code = '제안이 승인되었습니다';
								 $('#div').append("<a class='dropdown-item' name='name' href='mySuggest.do''>" + code + "</a>");
				       } if(alarm.alarmCode == 'A02-2') {
				    	   code = '제안이 거절되었습니다';
				    	   $('#div').append("<a class='dropdown-item' name='name' href='mySuggest.do''>" + code + "</a>");
				       } if(alarm.alarmCode == 'A03') {
				    	   code = '공감글에 대한 승인된 제안서가 도착했습니다';
				    	   $('#div').append("<a class='dropdown-item' name='name' href='selectOneBoard.do?bno='" + alarm.bno + ">" + code + "</a>");
				       }
				       $('#div').append("<a class='dropdown-item' href='javascript:;''>" + alarm.alarmDate + "</a>");
				       $('#div').append("<input type='hidden' class='hide' value=" + alarm.ano + ">");
						 });
					 });
         });
			 });
			}
			
			$(document).on('click', 'a[name=name]', function() {
				var no = $(this).next().next().attr('value');
				
				$.ajax({
			          url : 'updateAlarm.do/' + no,
			          type : 'PUT',
			          contentType : 'application/json;charset=UTF-8',
//			          data : parameter,
			          success : function(data) {
			            alert("삭제");
			          }, error :  function(xhr, status, error) {
			            alert(error);
			          }
			  });
			})
		});

	var session  = ('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}');
	$(function() {
		if (session != null) {
			// ajax 돌려서 프로필 이미지, 닉네임 붙여넣기!
			$.ajax({
    				"url" : "headerInfo.do",
    				"type" : "get",
    				
    				"success" : function(data){
  
    					$('#hnickname').text(data.nickname);
    					if(data.profile == null){
    						$('#profile').attr('src', 'http://localhost:8888/img/profile/profile.jpeg');
    					}else{
	    					$('#profile').attr('src', 'http://localhost:8888/img/profile/'+data.profile);    						
    					}
    					
    					
					}
			});
		}
   	
    });
	</script>