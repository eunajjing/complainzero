<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
input[type="password"]{
	color:#000;
	font-family: serif;
}
</style>
    
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
            <a href="#" data-toggle="modal"
						data-target="#deleteModal"  class="list-group-item">회원탈퇴</a>
          </div>
        </div>
        
        <div id="deleteModal" class="modal fade bs-example-modal-sm">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="navbar-form navbar-left">
						<div class="form-group">
							<input type="password" class="form-control" id="epw" placeholder="password" required="required">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="mDelete" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#mDelete').click(function(){
			if($('#epw').val() == ""){
				alert("비밀번호를 입력하세요.");
			}else{
				$.ajax({
					url : 'pwCheck.do',
		  			  type : 'POST',
		  			  data : {epw : $('#epw').val()},
		  			  success : function(data) {
		  				  if(data == true){
			  				  location.href = "deleteMember.do";
		  				  }else{
		  					  alert("비밀번호가 틀렸습니다.");
		  				  }
		  	          },
		  	          error : function(){
		  	        	  alert("error");
		  	          }
				});
			}
		});
	</script>