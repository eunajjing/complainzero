<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Content Column -->
        <div>
          <h2>정보 수정</h2>
          
          	<div>
	          <label>아이디: </label>
	          	<input type="text" class="form-control" id="id" value="${member.id}" readonly>
	          <p class="help-block"></p>
	          
	          <label>비밀번호:</label>
              	<input type="password" class="form-control" id="pw" required="required">
           	  <p class="help-block"></p>
              
              <label>니네임:</label>
              	<input type="text" class="form-control" id="nickname" value="${member.nickname}">
              <p class="help-block"></p>
              
            <img src="http://placehold.it/500x300" alt=""><br>
            <p class="help-block"></p>
            <center><button class="btn btn-secondary" id="updateBtn" type="button">수정</button></center>
            <p class="help-block"></p>
            
            </div>
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
    
    <script>
    
    	if($('#pw') == ""){
    		alert("비밀번호를 입력하세요");
    	}else if($('#nickname') == ""){
    		alert("닉네임을 입력하세요");
    	}else{
	    	$('#updateBtn').click(function(){
	    		var id = $('#id').val();
	    		var pw = $('#pw').val();
	    		var nickname = $('#nickname').val();
	    		var parameter = JSON.stringify({ 'id' : id, 'pw' : pw, 'nickname' : nickname});
	    		
	    		$.ajax({
	  			  url : 'updateMember.do',
	  			  type : 'PUT',
	  			  contentType : 'application/json;charset=UTF-8',
	  			  data : parameter,
	  			  success : function() {
	  	    		  $('#pw').val('');
	  	    		  alert("수정되었습니다.");
	  	          },
	  	          error : function(){
	  	        	  alert("error");
	  	          }
	  		  });
	    	});
    	}
    </script>