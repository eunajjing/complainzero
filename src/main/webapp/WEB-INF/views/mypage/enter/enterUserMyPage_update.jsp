<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    #img{
		width:300px;
    }
    input[name="img"]{
    	opacity: 0;
    }
    </style>
        <!-- Content Column -->
        <div>
          <h2>정보 수정</h2>
          
          	<div>
          		<form id="formdata" enctype="multipart/form-data">
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
	           		<c:choose>
		            	<c:when test="${empty member.profile}">
		           		<center><img src="http://localhost:8888/img/profile/profile.jpeg" id="img"></center><br>
		           		</c:when>
		           		<c:otherwise>
		           		<center><img src="http://localhost:8888/img/profile/${member.profile}.jpg" id="img"></center><br>
		           		</c:otherwise>
	           		</c:choose>
	            	<input type="file" id="input_img" name="img" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
	            </label>
	              
	            <p class="help-block"></p>
	            <center><button class="btn btn-secondary" id="updateBtn" type="button">수정</button></center>
	            <p class="help-block"></p>
	            
	            </form>
            </div>
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    
    <script>
    $('#input_img').change(function(){
    	filePreShow(this);
    });
    
    function filePreShow(e){
    	var reader = new FileReader();
    	reader.onload = function(e){
    		$('#img').attr('src',e.target.result);
    	}
    	reader.readAsDataURL(e.files[0]);
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
		  			   		var form = $('form')[0];
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