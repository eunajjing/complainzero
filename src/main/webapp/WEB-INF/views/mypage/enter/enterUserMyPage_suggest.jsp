<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

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
		 "info": false		 
	});
});
</script>
