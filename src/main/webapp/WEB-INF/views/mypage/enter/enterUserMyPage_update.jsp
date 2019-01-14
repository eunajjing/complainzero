<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">개인정보
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="main.do">Home</a>
        </li>
        <li class="breadcrumb-item active">정보 수정</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="enterUserMyPage.do" class="list-group-item">정보 수정</a>
            <a href="mySuggest.do" class="list-group-item">제안서 조회</a>
            <a href="deleteMember.do" class="list-group-item">회원탈퇴</a>
          </div>
        </div>
        <!-- Content Column -->
        <div>
          <h2>정보 수정</h2>
          
          	<div>
	          <label>아이디: </label>
	          	<input type="text" class="form-control" id="id" value="${member.id}" readonly>
	          <p class="help-block"></p>
	          
	          <label>비밀번호:</label>
              	<input type="password" class="form-control" id="pw">
           	  <p class="help-block"></p>
              
              <label>니네임:</label>
              	<input type="text" class="form-control" id="nickname" value="${member.nickname}">
              <p class="help-block"></p>
              
            <img src="http://placehold.it/500x300" alt=""><br>
            <p class="help-block"></p>
            <center><button class="btn btn-secondary" type="button">수정</button></center>
            <p class="help-block"></p>
            
            </div>
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->