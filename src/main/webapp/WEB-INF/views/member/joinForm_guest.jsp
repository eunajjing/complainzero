<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
date : 19-01-10
내용 : 회원가입 폼 작성
date : 19-01-15
내용 : 회원가입 제어
작성자 : 고은아
-->
<link href="css/joinForm.css" rel="stylesheet">
<div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원가입</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<label class="radio-inline">
						<input type="radio"
							name="roleCode" id="ROLE_USER" value="ROLE_USER" checked="checked">
							일반 회원
						</label>
						<label class="radio-inline"> <input type="radio"
							name="roleCode" id="ROLE_COMPANY" value="ROLE_COMPANY">
							기업 회원
						</label>
						</div>
						<div class="form-group">
							<label for="id">이메일</label>
							<div>
							<div class="validateDiv" id="idValidateDiv">
							</div>
								<input id="id" name="id" type="email" class="form-control" placeholder="Email" required="required">
								<button id="validateBtn" type="button" class="btn-xs btn" disabled="disabled">인증번호 발송</button>
							</div>
						</div>
					<div class="form-group">
						<label for="validityCheck">인증번호</label> <input id="validityCheck"
							type="number" class="form-control" placeholder="발송된 인증번호를 입력해주세요"
							required="required">
					</div>
					<div class="form-group">
						<label for="pw1">비밀번호</label> <input id="pw1" name="pw"
							type="password" class="form-control" placeholder="password"
							required="required">
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 확인</label> <input id="pw2" name="pw"
							type="password" class="form-control" placeholder="password를 다시 한 번 입력해주세요"
							required="required">
					</div>
					<div class="form-group">
					<div class="validateDiv" id="nicknameValidateDiv"></div>
						<label for="nickname">닉네임</label> <input id="nickname"
							name="nickname" type="text" class="form-control"
							placeholder="닉네임" required="required">
					</div>
					<div class="form-group">
						<label for="profile">프로필 이미지</label> <input type="file" class="custom-file-input">
					</div>
					<div id="profilePrewDiv">
					<img alt="" src="https://tettra.co/wp-content/logos/github.png" id="profilePrew">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" disabled="disabled" id="submitBtn">가입</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">

// 모든 값이 정상적인지를 확인
function lastCheck() {
	var id = $('#id').val().trim();
	var validityCheck = $('#validityCheck').val().trim();
	var pw1 = $('#pw1').val().trim();
	var pw2 = $('#pw2').val().trim();
	var nickname = $('#nickname').val().trim();
		
	if (id.length != 0 && pw1.length != 0 && validityCheck.length != 0 && nickname.length != 0) {
		if (pw1 == pw2) {
			$('#submitBtn').attr("disabled", false);
		} else {
			
		}
	} else {
		$('#submitBtn').attr("disabled", true);
	}

}

/* 라디오 버튼 체크에 따라 폼 요소 값 변경 이벤트 */
$('#ROLE_COMPANY').click(function() {
	$("label[for='nickname']").text("회사명");
	$("label[for='profile']").text("사업자등록증");
	$('#nickname').attr('placeholder', '회사명');
});
$('#ROLE_USER').click(function() {
	history.go(0);
});

// id 체크
$('#id').keyup(function() {

	const validateEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let id = $('#id').val().trim();
	$('#idValidateDiv').empty();
			
	if (id.length != 0 && validateEmail.test(id)) {
				
		$.ajax({
			type : 'post',
			url : 'idcheck.do',
			data : {"id" : id},
			success : function(data) {
				if (data) {
					$('#validateBtn').attr("disabled", false);
				} else {
					$('#idValidateDiv').append('이미 사용 중인 아이디 입니다.');
				}
			}
		});
				
	} else {
		$('#idValidateDiv').append('이메일 형식으로 입력해주세요.');
		$('#validateBtn').attr("disabled", true);
	}
});

// 닉네임 유효성 검사
$('#nickname').keyup(function() {
	let nickname = $('#nickname').val().trim();
	$('#nicknameValidateDiv').empty();
	
	if (nickname.length != 0 && nickname.length < 8) {
		$.ajax({
			type : 'post',
			url : 'nicknameCheck.do',
			data : {"nickname" : nickname},
			success : function(data) {
				if (data) {
					lastCheck();
				} else {
					$('#nicknameValidateDiv').append('이미 사용 중인 닉네임 입니다.');
				}
			}
		});
	} else {
		$('#nicknameValidateDiv').append('글자 수(8자 이하)에 맞게 입력해주세요.');
	}
	
});

// 자바 메일 발송
$('#validateBtn').click(function() {
	$('#id').attr("readonly", "readonly");
});

</script>

