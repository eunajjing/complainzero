<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원 목록</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
</head>

<body>
    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Sidebar Page
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">About</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="index.html" class="list-group-item">회원 관리</a>
            <a href="about.html" class="list-group-item">제안서 관리</a>
            <a href="services.html" class="list-group-item">신고 관리</a>
          </div>
        </div>
        
        <!-- Content Column -->
        <table class="col-lg-3 mb-4">
          <thead>
            <tr>
              <th>ID</th>
              <th>nickname</th>
            </tr>
          </thead>
          <tbody>     
            <c:forEach var="member" items="${memberList }">
            <tr class="table-primary">
              <td>${member.id }</td>
              <td>${member.nickname }</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>