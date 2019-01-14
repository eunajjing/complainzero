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
        <li class="breadcrumb-item active">회원탈퇴</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="userMyPage.do" class="list-group-item">정보 수정</a>
            <a href="myBoard.do" class="list-group-item">글조회</a>
            <a href="deleteMember.do" class="list-group-item">회원탈퇴</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <h2>회원탈퇴</h2>

          <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><img src="#"></span>
              </div>
              <input type="text" class="form-control" placeholder="Username">
          </div>

          <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><img src="#"></span>
              </div>
              <input type="password" class="form-control" placeholder="Password">
          </div>

        </div>
      </div>
      <!-- /.row -->
