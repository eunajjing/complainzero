<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
	
<style>
.boardTable{
	border : 1px solid black;
}
#selectBoard{
	float:right;
}
</style>
	
	
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <h2>글조회</h2>
          
            <div>
	          	<select id="selectBoard" onChange="goChange(this.value)">
	          		<option value="1">전체</option>
	          		<option value="2">게시글</option>
	          		<option value="3">댓글</option>
	          		<option value="4">공감글</option>
	          	</select>
          	</div>
          	
          	<div id="totalBoard">
	          	<br>
	          	<h3>게시글</h3>
	          	<div class="boardTable">
		          	<table class="dt">
		          	<thead>
		          		<tr>
		          			<th>제목</th>
		          			<!-- <th>내용</th> -->
		          			<th>작성일자</th>
		          			<th>조회수</th>
		          		</tr>
		       		</thead>
		       		<tbody>
		          	<c:forEach items="${myBoard.board}" var="board">
		          		<tr>
		          			<td><a href="selectOneBoard.do?bno=${board.bno}">${board.title}</a></td>
							<%-- <td>${board.bContent}</td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writeDate}"/></td>
							<td>${board.readCount}</td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
	          	
	          	<br>
	          	<h3>댓글</h3>
	          	<div class="boardTable">
		          	<table class="dt">
		          	<thead>
		          		<tr>
		          			<th>댓글</th>
		          			<th>게시글제목</th>
		          			<th>작성일자</th>
		          		</tr>
		          	</thead>
		          	<tbody>
		          	<c:forEach items="${myBoard.comment}" var="comment">
		          		<tr>
							<td>${comment.cContent}</td>
							<td><a href="selectOneBoard.do?bno=${comment.bno}">${comment.title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/></td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
	          	
	          	<br>
	          	<h3>공감글</h3>
	          	<div class="boardTable">
		          	<table class="dt">
		          	<thead>
		          		<tr>
		          			<th>제목</th>
		          			<!-- <th>내용</th> -->
		          			<th>작성일자</th>
		          			<th>조회수</th>
		          		</tr>
		       		</thead>
		       		<tbody>
		          	<c:forEach items="${myBoard.likes}" var="likes">
		          		<tr>
		          			<td><a href="selectOneBoard.do?bno=${likes.bno}">${likes.title}</a></td>
							<%-- <td>${board.bContent}</td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${likes.writeDate}"/></td>
							<td>${likes.readCount}</td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
          	</div>
          	
          	<div id="myBoard" style="display:none;">
	          	<br>
	          	<h3>게시글</h3>
	          	<div class="boardTable">
		          	<table class="eachDt" class="table table-striped table-bordered table-hover">
		          	<thead>
		          		<tr>
		          			<th>제목</th>
		          			<!-- <th>내용</th> -->
		          			<th>작성일자</th>
		          			<th>조회수</th>
		          		</tr>
		       		</thead>
		       		<tbody>
		          	<c:forEach items="${myBoard.board}" var="board">
		          		<tr>
		          			<td><a href="selectOneBoard.do?bno=${board.bno}">${board.title}</a></td>
							<%-- <td>${board.bContent}</td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writeDate}"/></td>
							<td>${board.readCount}</td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
          	</div>
          	
          	<div id="myComment" style="display:none;">
          		<br>
	          	<h3>댓글</h3>
	          	<div class="boardTable">
		          	<table class="eachDt">
		          	<thead>
		          		<tr>
		          			<th>댓글</th>
		          			<th>게시글제목</th>
		          			<th>작성일자</th>
		          		</tr>
		          	</thead>
		          	<tbody>
		          	<c:forEach items="${myBoard.comment}" var="comment">
		          		<tr>
							<td>${comment.cContent}</td>
							<td><a href="selectOneBoard.do?bno=${comment.bno}">${comment.title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/></td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
          	</div>
          	
          	<div id="myLikes" style="display:none;">
          		<br>
	          	<h3>공감글</h3>
	          	<div class="boardTable">
		          	<table class="eachDt">
		          	<thead>
		          		<tr>
		          			<th>제목</th>
		          			<!-- <th>내용</th> -->
		          			<th>작성일자</th>
		          			<th>조회수</th>
		          		</tr>
		       		</thead>
		       		<tbody>
		          	<c:forEach items="${myBoard.likes}" var="likes">
		          		<tr>
		          			<td><a href="selectOneBoard.do?bno=${likes.bno}">${likes.title}</a></td>
							<%-- <td>${board.bContent}</td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${likes.writeDate}"/></td>
							<td>${likes.readCount}</td>
						</tr>
		          	</c:forEach>
		          	</tbody>
		          	</table>
	          	</div>
          	</div>
          	
        </div>
      </div>
      </div>
      <!-- /.row -->
      <script src="vendor/jquery/jquery.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
<script>
$(document).ready(function(){
	//전체데이터테이블
	$('.dt').DataTable({
		"pageLength": 3,
		 "lengthChange": false,
		 "info": false		 
	});
	
	//데이터테이블
	$('.eachDt').DataTable({
		
	});
});

function goChange(val){
	if(val == 1){
		$('#totalBoard').show();
		$('#myBoard').hide();
		$('#myComment').hide();
		$('#myLikes').hide();
	}else if(val == 2){
		$('#totalBoard').hide();
		$('#myBoard').show();
		$('#myComment').hide();
		$('#myLikes').hide();
	}else if(val == 3){
		$('#totalBoard').hide();
		$('#myBoard').hide();
		$('#myComment').show();
		$('#myLikes').hide();
	}else{
		$('#totalBoard').hide();
		$('#myBoard').hide();
		$('#myComment').hide();
		$('#myLikes').show();
	}
}
</script>