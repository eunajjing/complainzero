<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">개인정보
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="main.do">Home</a>
        </li>
        <li class="breadcrumb-item active">글조회</li>
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
          <h2>글조회</h2>
          	<h3>게시글</h3>
          	<c:forEach items="${myBoard.board}" var="board">
          		${board.title}
          		<br>
				${board.bContent}
				<br>
				${board.writeDate}
				<br>
				${board.readCount}
				<br>
          	</c:forEach>
          	
          	<h3>댓글</h3>
          	<c:forEach items="${myBoard.comment}" var="comment">
				${comment.cContent}
				<br>
				${comment.writeDate}
				<br>
				<%-- ${comment.title} --%>
				<br>
          	</c:forEach>
        </div>
      </div>
      <!-- /.row -->
