<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
<!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">개인정보
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="main.do">Home</a>
        </li>
        <li class="breadcrumb-item active">제안서 조회</li>
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
        <div class="col-lg-9 mb-4">
          <h2>제안서</h2>
          
          	<br>
          	<h3>댓글</h3>
          	<div class="boardTable">
	          	<table class="dt">
	          	<thead>
	          		<tr>
	          			<th>내용</th>
	          			<th>작성시간</th>
	          			<th>게시글제목</th>
	          		</tr>
	          	</thead>
	          	<tbody>
	          	<c:forEach items="${myBoard.comment}" var="comment">
	          		<tr>
						<td>${comment.cContent}</td>
						<td>${comment.writeDate}</td>
						<td>aaaa</td>
						<%-- <td>${comment.title}</td> --%>
					</tr>
	          	</c:forEach>
	          	</tbody>
	          	</table>
          	</div>
          	
        </div>
      </div>
      <!-- /.row -->
      <script src="vendor/jquery/jquery.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
<script>
$(document).ready(function(){
	$('.dt').DataTable({
		pageLength: 3
	});
});
</script>
