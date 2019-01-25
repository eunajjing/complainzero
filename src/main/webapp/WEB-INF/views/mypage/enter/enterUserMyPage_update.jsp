<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
        <!-- Content Column -->
        <div>
          <h2>정보 수정</h2>
          
          	<div>
          		<form action="updateMember.do" id="formdata" method="post" enctype="multipart/form-data">
		          <label>아이디: </label>
		          	<input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly>
		          <p class="help-block"></p>
		          
		          <label>비밀번호:</label>
	              	<input type="password" class="form-control" id="wpw" name="pw" required="required">
	           	  <p class="help-block"></p>
	              
	              <label>닉네임:</label>
	              	<input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}">
	              <p class="help-block"></p>
	              
	            <label>
	            	<c:choose>
	            		<c:when test="${empty member.profile}">
							<center><img src="http://localhost:8888/img/profile/profile.jpeg" id="showImg"></center><br>
	            			<input type="file" id="input_img" name="img" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
	            		</c:when>
	            		<c:otherwise>
			           		<center><img src="http://localhost:8888/img/profile/${member.profile}" id="showImg"></center><br>
			            	<input type="file" id="input_img" name="img" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
	            		</c:otherwise>
	            	</c:choose>
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
    		$('#showImg').attr('src',e.target.result);
    	}
    	reader.readAsDataURL(e.files[0]);
    }
    
	   	$('#updateBtn').click(function(){
	   		if($('#wpw') == ""){
	       		alert("비밀번호를 입력하세요");
	       	}else if($('#nickname') == ""){
	       		alert("닉네임을 입력하세요");
	       	}else{
	       		//비밀번호 검사
	       		$.ajax({
					url : 'pwCheck.do',
		  			  type : 'POST',
		  			  data : {epw : $('#wpw').val()},
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
		  		  	    		  $('#wpw').val('');
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