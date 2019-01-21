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
	          			<th>no</th>
	          			<th>게시판 제목</th>
	          			<th>기타 사항</th>
	          			<th>처리 상태</th>
	          		</tr>
	          	</thead>
	          	<tbody>
	          	<c:forEach items="${mySuggest}" var="mySuggest">
	          		<tr>
						<td>${mySuggest.sno}</td>
						<td>${mySuggest.title}</td>
						<td>${mySuggest.etc}</td>
						<c:if test="${mySuggest.statusCode == 'S00' }">
              				<td>대기</td>
              			</c:if>
              			<c:if test="${mySuggest.statusCode == 'S01' }">
              				<td>반려</td>
              			</c:if>
						<c:if test="${mySuggest.statusCode == 'S02' }">
              				<td>승인</td>
              			</c:if>
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
