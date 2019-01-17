<!-- 
date : 2019-01-11
작성자 : 고은아
내용 : 게시글 상세보기 뷰단 초기 구현
 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
    <!-- 신고 모달 -->
<div class="modal" id="reportModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="form-group">
			  <label for="reasonCode">신고사유</label>
			  <select class="form-control" id="reasonCode">
			  	<option>신고사유 선택</option>
			    <option>무분별한 비속어 사용</option>
			    <option>광고성 게시물</option>
			    <option>음란성 게시물</option>
			    <option>명예훼손 게시물</option>
			    <option>기타 사유</option>
			  </select>
			  </div>
			  <div class="form-group">
	          	<textarea class="form-control" rows="3" placeholder="자세한 내용을 적어주세요"></textarea>
	          </div>
		</div>

          <div class="alert alert-info">
    		<button type="button" class="close" data-dismiss="alert">&times;</button>
    		<strong>허위 신고 시</strong>
    		회원 활동에 있어 불이익이 발생할 수 있습니다.
  			</div>
  			<div class="modal-footer">
          <button type="button" class="btn btn-danger">전송</button>
        </div>
        </div>

      </div>
    </div>

    <!-- 신고 모달 끝  -->
<div class="container">
	   
      <h1 class="mt-4 mb-3">게시글 제목
        <small>by
          <a href="#">카테고리명</a>
        </small>
      </h1>
      
      <div class="row">
      	<div class="col-lg-8">
      		<img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">
      		<hr>
      		<p>작성 날짜</p>
          	<hr>
          	
          	<!-- 콘텐츠 내용 시작 -->
          	블라블라!
          	<!-- html 내용으로 뿌리는 에디터기를 찾아야 하나..? -->
          	
          	<hr>
          	<div class="rightOutDiv">
          	<button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#reportModal">신고</button>  
          	</div>
          	<div class="card my-4">
				<div class="card-body rightOutDiv">
				<!-- 만약 내가 쓴 글이 아니면 -->
		            이 글이 공감되시나요? <i class="far fa-heart"></i>
		            <!-- 토글했을 때 class가 fa-heart로 변경되어야 함 -->
		            <br>
		        
		        <!-- 만약 내가 쓴 글이면 -->
		        <div class="btn-group btn-group-sm">
  <button type="button" class="btn btn-outline-warning">수정</button>
  <button type="button" class="btn btn-outline-danger">삭제</button>
</div>
		        </div>
	        </div>
          	
          	<!-- 댓글 작성 폼 -->
          	<div class="card my-4">
	            <h5 class="card-header">댓글을 남겨보세요</h5>
	            <div class="card-body">
	              <!-- <form> -->
	                <div class="form-group">
	                  <textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
	                </div>
	                <div class="rightOutDiv">
	                <button type="button" onclick="insertComment()" class="btn btn-primary">등록</button>
	                </div>
	              <!-- </form> -->
	            </div>
	          </div>
	          
	          <!-- 기존에 달렸던 댓글들 뿌려주기 -->
	          <div class="commentList">
		          <c:forEach items="${commentList}" var="commentList">
			          <div class="comment" seq="${commentList.cno}">
				          <div class="media mb-4">
				            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
				            <div class="media-body">
				              <span id="cId">${commentList.id}</span>&nbsp;<button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#reportModal">신고</button>
				              
				              <!-- 세션 처리 해서 만약 본인이 쓴 댓글이면 -->
				              
				              	<div class="btn-group btn-group-sm">
								  <button type="button" onclick="updateComment(this)" class="btn btn-outline-warning">수정</button>
								  <button type="button" onclick="deleteComment(this)" class="btn btn-outline-danger">삭제</button>
								</div>
				              <br>
				              	${commentList.cContent}
				            </div>
				          </div>
			          </div>
		          </c:forEach>
	          </div>
	      	</div>
	      	
	      	<!-- 좋아요 시작 -->
	      	<div class="col-md-4">
	      		<div class="card my-4">
		            <h5 class="card-header">좋아요를 눌러보세요</h5>
		            <div class="card-body">
		              향후 불편함이 개선되는 상품이 나오면<br>
		              좋아요<i class="fas fa-heart"></i> 내역을 토대로 알림을 보내드립니다.
	            </div>
          </div>
	      	</div>
      </div>


</div>

<script>

function insertComment(){
	$.ajax({
		  url : 'boardCommentInsert.do',
		  type : 'POST',
		  data : {cContent : $('#cContent').val()},
		  success : function() {
			/* alert('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}'); */
		 	alert("작성되었습니다.");
		 	//동적으로 태그 생성
		 	
		 	var output = "";
		 	
		 	output += '<div class="comment" seq="' + $('.comment').attr('seq') + '">';
		 	
			output += '<div class="media mb-4">';
			output += '<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">';
			output += '<div class="media-body">';
			output += '${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}&nbsp;<button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#reportModal">신고</button>';
			output += '<div class="btn-group btn-group-sm">';
			output += '<button type="button" class="btn btn-outline-warning">수정</button>';
			output += '<button type="button" onclick="deleteComment(this)" class="btn btn-outline-danger">삭제</button>';
		    output += '</div>';
			output += '<br>';
			output += $('#cContent').val();
			output += '</div>';
			output += '</div>';
		
			$(".commentList").append(output);
			$('#cContent').val('');
     	  },
     	  error : function(){
    	  	alert("error");
      	  }
	});
}

function updateComment(e){
	//임시
	var cno = e.parentNode.parentNode.parentNode.parentNode.getAttribute('seq');
	//임시
	
	$.ajax({
		url : 'boardCommentUpdate.do/' + cno,
		  type : 'PUT',
		  success : function() {
		 	alert("수정되었습니다.");
		 	//임시
			e.parentNode.parentNode.parentNode.parentNode.remove();
		 	//임시
   	  	  },
	 	  error : function(){
  	  	 	 alert("error");
    	  }
	});
}

function deleteComment(e){
	
	//임시
	var cno = e.parentNode.parentNode.parentNode.parentNode.getAttribute('seq');
	//임시
	
	$.ajax({
		url : 'boardCommentDelete.do/' + cno,
		  type : 'PUT',
		  success : function() {
		 	alert("삭제되었습니다.");
		 	//임시
			e.parentNode.parentNode.parentNode.parentNode.remove();
		 	//임시
   	  	  },
	 	  error : function(){
  	  	 	 alert("error");
    	  }
	});
}

</script>