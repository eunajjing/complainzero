<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
date : 19-01-14
내용 : 로그인 페이지 작성
date : 19-01-15 
내용 : 시큐리티 에러 메시지 출력
date : 19-01-21
내용 : 시큐리티 에러 메시지 출력
작성자 : 고은아
-->
    
    <div>
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
				<div class="modal-header">
				<c:if test="${param.error !=null }">
					입력하신 정보가 올바르지 않습니다.
					<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message }"/>
				</c:if>
				</div>
				<form name="f" class="navbar-form navbar-left" action="/j_spring_security_check" method="post">
				<div class="modal-body">
						<div class="form-group">
							<input id="id" name="id" type="email" class="form-control" placeholder="Email" required="required" autofocus="autofocus">
						</div>
						<div class="form-group">
							<input id="pw" name="pw" type="password" class="form-control" placeholder="password" required="required">
						</div>
					
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default">비밀번호 찾기</button> -->
					<!-- 비밀번호 찾기 단 구현 안됨 -->
					<button type="submit" name="submit" class="btn btn-primary">로그인</button>
				</div>
				</form>
			</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->