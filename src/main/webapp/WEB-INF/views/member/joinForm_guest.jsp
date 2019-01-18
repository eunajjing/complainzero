<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
date : 19-01-10
내용 : 회원가입 폼 작성
date : 19-01-15 ~ 16
내용 : 회원가입 제어
작성자 : 고은아
-->

<link href="css/joinForm.css" rel="stylesheet">
<div>
	<div class="modal-dialog">
		<div class="modal-content" id="joinForm">
			<div class="modal-header">
				<h4 class="modal-title">회원가입</h4>
			</div>
			<form action="join.do" method="post">
			<!-- 멀티파트! -->
			<div class="modal-body">
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
						<label for="pw2">비밀번호 확인</label> <input id="pw2"
							type="password" class="form-control" placeholder="password를 다시 한 번 입력해주세요"
							required="required">
					</div>
					<div class="validateDiv" id="pwValidateDiv"></div>
					<div class="form-group">
					<div class="validateDiv" id="nicknameValidateDiv"></div>
						<label for="nickname">닉네임</label> <input id="nickname"
							name="nickname" type="text" class="form-control"
							placeholder="닉네임" required="required">
					</div>
					<div class="form-group">
						<label for="profile">프로필 이미지</label>
						<input type="file" name="profile" multiple="multiple">
					</div>
					<div id="profilePrewDiv">
						<img alt="" src="https://tettra.co/wp-content/logos/github.png" id="profilePrew">
					</div>
				
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" id="submitBtn" disabled="disabled">가입</button>
			</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- /.modal -->
<script type="text/javascript">

//라디오 버튼 체크에 따라 폼 요소 값 변경 이벤트
$('#ROLE_COMPANY').click(function() {
	$("label[for='nickname']").text("회사명");
	$("label[for='profile']").text("사업자등록증");
	$('#nickname').attr('placeholder', '회사명');
});
$('#ROLE_USER').click(function() {
	history.go(0);
});


// 비밀번호 유효성 검사
function pwcheck() {
	// 비밀번호 정규 표현식
	const reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	let pw1 = $('#pw1').val().trim();
	let pw2 = $('#pw2').val().trim();
	$('#pwValidateDiv').empty();
	
	return new Promise(function(resolve, reject) { 
		if ($('#pw1').val().trim().length != 0 && $('#pw2').val().trim().length != 0) {
			if (pw1 == pw2) {
				if(reg_pwd.test(pw1)) {
					$('#pwValidateDiv').attr('class', 'validateGreenDiv');
					$('#pwValidateDiv').append('비밀번호 일치');
					resolve();
				} else {
					$('#pwValidateDiv').attr('class', 'validateDiv');
					$('#pwValidateDiv').append('비밀번호는 영문, 숫자를 혼합하여 6~20자 이내로 설정해주세요.');
					$('#submitBtn').attr("disabled", true); 
					reject();
				}
			} else {
				$('#pwValidateDiv').attr('class', 'validateDiv');
				$('#pwValidateDiv').append('비밀번호가 일치하지 않습니다.');
				$('#submitBtn').attr("disabled", true);
				reject();
			}
		} else {
			$('#pwValidateDiv').attr('class', 'validateDiv');
			$('#submitBtn').attr("disabled", true);
			reject();
		}
	});
}

// 닉네임 유효성
function nickname() {
	let nickname = $('#nickname').val().trim();
	$('#nicknameValidateDiv').empty();
	
	return new Promise(function(resolve, reject) {	
		if(nickname.length != 0) {
			if (nickname.length < 8) {
				let result;
				$.ajax({
					type : 'post',
					url : 'nicknameCheck.do',
					data : {"nickname" : nickname},
					success : function(data) {
						if (!data) {
							$('#nicknameValidateDiv').append('이미 사용 중인 닉네임 입니다.');
							reject();
						} else {
							$('#submitBtn').attr("disabled", true);
							resolve();
						}
					}
				});
			} else {
				$('#nicknameValidateDiv').append('글자 수(8자 이하)에 맞게 입력해주세요.');
				$('#submitBtn').attr("disabled", true);
				reject();
			}
		} else {
			$('#submitBtn').attr("disabled", true);
			reject();
		}
	});
}

// id 유효성 체크
function id() {
	// 이메일 정규표현식
	const validateEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let id = $('#id').val().trim();
	$('#idValidateDiv').empty();
	
	return new Promise(function(resolve, reject) { 

		if (id.length != 0 && validateEmail.test(id)) {
			$.ajax({
				type : 'post',
				url : 'idcheck.do',
				data : {"id" : id},
				success : function(data) {
					if (data) {
						$('#validateBtn').attr("disabled", false);
						$('#submitBtn').attr("disabled", true);
						resolve();
					} else {
						$('#idValidateDiv').append('이미 사용 중인 아이디 입니다.');
						$('#validateBtn').attr("disabled", true);
						$('#submitBtn').attr("disabled", true);
						reject();
					}
				}
			});			
		} else {
			$('#idValidateDiv').append('이메일 형식으로 입력해주세요.');
			$('#validateBtn').attr("disabled", true);
			$('#submitBtn').attr("disabled", true);
			reject();
		}	
	});
}


// 자바 메일 발송
$('#validateBtn').click(function() {
	$('#id').attr("readonly", "readonly");
	
	$.ajax({
		type : 'post',
		url : 'emailcheck.do',
		data : {"id" : $('#id').val()},
		success : function(data) {
			console.log(data);
		}
	});
});


$('#joinForm').keyup(function() {
	id() // 이메일 인증 해야함
	.then(pwcheck)
	.then(nickname)
	.then(function() {
		$('#submitBtn').attr("disabled", false); 
	});
});

</script>

