<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Content Column -->
        
        <link href="css/joinForm.css" rel="stylesheet">
        
      <div>
	<div class="modal-dialog">
		<div class="modal-content" id="joinForm">
			<div class="modal-header">
				<h4 class="modal-title" align="center">정보 수정</h4>
			</div>
			<form action="updateMember.do" id="formdata" method="post" enctype="multipart/form-data">
			<!-- 멀티파트! -->
			<div class="modal-body">
			
					<div class="form-group">
							<label for="id">이메일</label>
							<div>
							<div class="validateDiv" id="idValidateDiv">
							</div>
								<input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly>
							
							</div>
						</div>
					
					<div class="form-group">
						<label for="pw1">비밀번호</label> <input type="password" class="form-control"
						 id="pw" name="pw" required="required">
					</div>
					
					
					<div class="form-group">
					<div class="validateDiv" id="nicknameValidateDiv"></div>
						<label for="nickname">닉네임</label> <input id="nickname"
							name="nickname" type="text" class="form-control"
							placeholder="닉네임" required="required">
					</div>
					<div class="form-group">
						<label for="profile">프로필 이미지</label>
						<input type="file" id="input_img" name="img" style="opacity: 0;"/>
						<p class="help-block"></p>
						</div>
					<!-- <div id="profilePrewDiv">
						<img alt="" src="https://tettra.co/wp-content/logos/github.png" id="profilePrew">
					</div> -->
					
					  <div id="profileprewDiv">
	            	
	           		<center><img src="img/profile/Jellyfish.jpg" id="img" style="width:300px; width:300px;"></center><br>
	            	<input type="file" id="input_img" name="img" style="opacity: 0;"/>
	            </div>
				
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" id="updateBtn" type="button">수정완료</button>
			</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div> 
 <%--     <div>
          <h2>정보 수정</h2>
          
          	<div>
          		<form action="updateMember.do" id="formdata" method="post" enctype="multipart/form-data">
		          <label>아이디: </label>
		          	<input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly>
		          <p class="help-block"></p>
		          
		          <label>비밀번호:</label>
	              	<input type="password" class="form-control" id="pw" name="pw" required="required">
	           	  <p class="help-block"></p>
	              
	              <label>니네임:</label>
	              	<input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}">
	              <p class="help-block"></p>
	              
	            <label>
	            	
	           		<center><img src="img/profile/Jellyfish.jpg" id="img" style="width:300px; width:300px;"></center><br>
	            	<input type="file" id="input_img" name="img" style="opacity: 0;"/>
	            </label>
	              
	            <p class="help-block"></p>
	            <center><button class="btn btn-secondary" id="updateBtn" type="button">수정</button></center>
	            <p class="help-block"></p>
	            
	            </form>
            </div>
        </div>
      </div>
      <!-- /.row -->

    </div> --%>
    <!-- /.container -->
    
    <script>
    $(document).ready(function(){
    	$('#input_img').on('change',handleImgFileSelect);
    });
    
    function handleImgFileSelect(e){
    	var files = e.target.files;
    	var fileArr = Array.prototype.slice.call(files);
    	
    	fileArr.forEach(function(f){
    		if(!f.type.match("image.*")){
    			alert("확장자는 이미지 확장자만 가능합니다.");
    			return;
    		}
    		
    		var reader = new FileReader();
    		reader.onload = function(e){
    			$('#img').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(f);
    	});
    }
    
	   	$('#updateBtn').click(function(){
	   		if($('#pw') == ""){
	       		alert("비밀번호를 입력하세요");
	       	}else if($('#nickname') == ""){
	       		alert("닉네임을 입력하세요");
	       	}else{
	       		//비밀번호 검사
	       		$.ajax({
					url : 'pwCheck.do',
		  			  type : 'POST',
		  			  data : {epw : $('#pw').val()},
		  			  success : function(data) {
		  				  //성공시 정보변경
		  				  if(data == true){
		  					/* var form = document.getElementById('formdata'); */
		  			   		var form = $('form')[1];
		  			   		var formData = new FormData(form);
		  		       		
		  		    		$.ajax({
		  		  			  url : 'updateMember.do',
		  		  			  type : 'POST',
		  		  			  data : formData,
		  		  			  enctype : 'multipart/form-data',
		  		  			contentType: false,
		  					processData: false,
		  		  			  success : function() {
		  		  	    		  $('#pw').val('');
		  		  	    		  alert("수정되었습니다.");
		  		  	          },
		  		  	          error : function(){
		  		  	        	  alert("error");
		  		  	          }
		  	  		  		});
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