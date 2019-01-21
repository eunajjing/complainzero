<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
Date : 19-01-11
작성자 : 고은아
내용 : 게시판 뷰 초기 작성
 -->
<div class="container">
	<h1 class="mt-4 mb-3">
		<small>불만을 작성해주세요</small>
	</h1>
	불만이 없어지는 날에 이 게시판은 닫힙니다
	<div class="rightOutDiv">
	<div class="rightInDiv">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option>전체</option>
					<option>식품</option>
					<option>보건/의료</option>
					<option>주거/시설</option>
					<option>가전/생활용품</option>
					<option>의류/세탁</option>
					<option>자동차/기계류</option>
					<option>정보통신</option>
					<option>금융/보험</option>
					<option>교육/문화</option>
					<option>레져/스포츠</option>
					<option>관광/운송</option>
					<option>기타</option>
				</select>
				&nbsp;
				<input class="form-control" type="search" placeholder="검색 키워드 입력">
				&nbsp;
				<button class="btn" type="submit">검색</button>
			</div>
		</form>
	</div>
	<a class="btn btn-secondary" href="writeBoardForm.do">글쓰기</a>
	</div>
	<hr>
	<c:forEach items="${boardList}" var="boardList">
	<div class="row">
<%-- 	<% for(int i=0; i < 3; i++ ) { %> --%>
<%-- 		<c:forEach var="board" items="${boardList }"> --%>
		<c:if test="${boardList.thumbNail != null }">
		<div class="col-lg-4 col-sm-6 portfolio-item">
			<div class="card h-100">
				<a href="selectOneBoard.do?bno=${boardList.bno}">
<%-- 				<img src="download.do?bno=${boardList.bno }" class="card-img-top" alt=""></a> --%>
				<img src="http://localhost:8888/img/boardThumbNail/${boardList.thumbNail }" class="card-img-top">이미지</a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="selectOneBoard.do?bno=${boardList.bno}">제목 : ${boardList.title}</a>
						<p class="card-text">${boardList.bContent}</p>
					</h4>
<%-- 					<p class="card-text">${boardList.bContent}</p>  --%>
					<p class="card-text">작성자 : ${boardList.mid}</p>
		
				</div>
			</div>
		</div>
		</c:if>
<%-- 		</c:forEach> --%>
<%-- 		<%} %> --%>
	</div>
		</c:forEach>
</div>

	
	
	
