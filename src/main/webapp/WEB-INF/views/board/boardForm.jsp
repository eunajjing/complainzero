<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
Date : 19-01-11
내용 : 게시판 뷰 초기 작성
Date : 19-01-19
내용 : 게시판 뷰 게시물 없을 때 제어
Date : 19-01-21
내용 : 게시판 뷰 정렬
작성자 : 고은아
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
					</select> &nbsp; <input class="form-control" type="search"
						placeholder="검색 키워드 입력"> &nbsp;
					<button class="btn" type="submit">검색</button>
				</div>
			</form>
		</div>
		<a class="btn btn-secondary" href="writeBoardForm.do">글쓰기</a>
	</div>
	<hr>



	<c:if test="${empty boardList}">
		<div class="card mb-4">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<p class="card-text">게시글이 없습니다. 곧 게시판을 닫아야 할지도 모르겠군요.</p>
					</div>

				</div>
			</div>
		</div>
	</c:if>
	<div class="row">
		<c:forEach items="${boardList}" var="boardList">
			<c:if test="${boardList.thumbNail != null }">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="selectOneBoard.do?bno=${boardList.bno}"> <img
							src="http://localhost:8888/img/boardThumbNail/${boardList.thumbNail }"
							class="card-img-top" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="selectOneBoard.do?bno=${boardList.bno}">${boardList.title}</a>
							</h4>
							<p class="card-text">${boardList.mid}</p>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<div>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="boardForm.do?page=${pageMaker.startPage - 1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="boardForm.do?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<li><a href="boardForm.do?page=${pageMaker.endPage +1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
</div>




