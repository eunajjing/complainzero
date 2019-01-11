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
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- datatable css -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
</head>

<body>  
<!--     Page Content -->
    <div class="container">

      Page Heading/Breadcrumbs
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
        <table class="table table-striped table-bordered table-hover" id="dt">
          <thead>
            <tr>
              <th class="text-center">Firstname</th>
              <th class="text-center">Lastname</th>
              <th class="text-center">Email</th>
            </tr>
          </thead>
          <tbody>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
<!--             <tr> -->
<!--               <td>Default</td> -->
<!--               <td>Defaultson</td> -->
<!--               <td>def@somemail.com</td> -->
<!--             </tr>       -->
<%--             <c:forEach var="member" items="${memberList }"> --%>
<!--             <tr class="table-primary"> -->
<%--               <td>${member.id }</td> --%>
<!--               <td>Joe</td> -->
<!--               <td>joe@example.com</td> -->
<!--             </tr> -->
<%--             </c:forEach> --%>
<!--             <tr class="table-success"> -->
<!--               <td>Success</td> -->
<!--               <td>Doe</td> -->
<!--               <td>john@example.com</td> -->
<!--             </tr> -->
<!--             <tr class="table-danger"> -->
<!--               <td>Danger</td> -->
<!--               <td>Moe</td> -->
<!--               <td>mary@example.com</td> -->
<!--             </tr> -->
<!--             <tr class="table-info"> -->
<!-- 			        <td>Info</td> -->
<!-- 			        <td>Dooley</td> -->
<!-- 			        <td>july@example.com</td> -->
<!--             </tr> -->
<!--             <tr class="table-warning"> -->
<!-- 			        <td>Warning</td> -->
<!-- 			        <td>Refs</td> -->
<!-- 			        <td>bo@example.com</td> -->
<!--             </tr> -->
<!--             <tr class="table-active"> -->
<!-- 			        <td>Active</td> -->
<!-- 			        <td>Activeson</td> -->
<!-- 			        <td>act@example.com</td> -->
<!--             </tr> -->
<!--             <tr class="table-secondary"> -->
<!--               <td>Secondary</td> -->
<!--               <td>Secondson</td> -->
<!--               <td>sec@example.com</td> -->
<!--             </tr> -->
<!-- 			      <tr class="table-light"> -->
<!-- 			        <td>Light</td> -->
<!-- 			        <td>Angie</td> -->
<!-- 			        <td>angie@example.com</td> -->
<!-- 			      </tr> -->
<!-- 			      <tr class="table-dark text-dark"> -->
<!-- 			        <td>Dark</td> -->
<!-- 			        <td>Bo</td> -->
<!-- 			        <td>bo@example.com</td> -->
<!-- 			      </tr> -->
          </tbody>
        </table>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- datatable js -->
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
    
    <script type="text/javascript">
     $(document).ready(function() { 
     	$('#dt').DataTable({
//      		responsive: true,
//         searching: true,
//         bAutoWidth: true,
//         bPaginate: true
     	}); 
     }); 
    </script>
  </body>
</html>