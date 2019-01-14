<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
date : 19-01-10
작성자 : 고은아
내용 : 회원가입 폼 작성
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
						</label> <label class="radio-inline"> <input type="radio"
							name="roleCode" id="ROLE_COMPANY" value="ROLE_COMPANY">
							기업 회원
						</label>
						</div>
						<div class="form-group">
							<label for="id">이메일</label>
							<div>
								<input id="id" name="id" type="email" class="form-control" placeholder="Email" required="required">
								<button type="button" class="btn-xs btn" disabled="disabled">인증번호 발송</button>
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
						<label for="nickname">닉네임</label> <input id="nickname"
							name="nickname" type="number" class="form-control"
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
				<button type="button" class="btn btn-primary" disabled="disabled">가입</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

