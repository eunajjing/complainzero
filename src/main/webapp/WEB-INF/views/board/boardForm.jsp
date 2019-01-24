<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 
Date : 19-01-11
내용 : 게시판 뷰 초기 작성
Date : 19-01-19
내용 : 게시판 뷰 게시물 없을 때 제어
Date : 19-01-21
내용 : 게시판 뷰 정렬
Date : 19-01-22
내용 : 셀렉트 박스 제어
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
					<select class="form-control" id="categorycodeSelect">
						<option value="all">전체</option>
						<option value="C01">식품</option>
						<option value="C02">보건/의료</option>
						<option value="C03">주거/시설</option>
						<option value="C04">가전/생활용품</option>
						<option value="C05">의류/세탁</option>
						<option value="C06">자동차/기계류</option>
						<option value="C07">정보통신</option>
						<option value="C08">금융/보험</option>
						<option value="C09">교육/문화</option>
						<option value="C10">레져/스포츠</option>
						<option value="C11">관광/운송</option>
						<option value="C00">기타</option>
					</select> &nbsp; <input class="form-control" type="search"
						placeholder="검색 키워드 입력" id="keyword"> &nbsp;
					<button class="btn" type="button" id="searchBtn">검색</button>
				</div>
			</form>
		</div>
		<se:authorize ifAnyGranted="ROLE_USER">
		<a class="btn btn-secondary" href="writeBoardForm.do">글쓰기</a>
		</se:authorize>
	</div>
	<hr>

	<c:choose>
		<c:when test="${empty boardList}">
			<div class="card mb-4">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12">
							<p class="card-text">게시글이 없습니다. 곧 게시판을 닫아야 할지도 모르겠군요.</p>
						</div>

					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<c:forEach items="${boardList}" var="boardList">
						<div class="col-lg-4 col-sm-6 portfolio-item">
							<div class="card h-100">
						<c:choose>
			          		<c:when test="${empty boardList.thumbNail}">
			          			<a href="selectOneBoard.do?bno=${boardList.bno}"> <img
			                     src="http://localhost:8888/img/boardThumbNail/thumbnail.png"
			                     class="card-img-top" alt=""></a>
			          		</c:when>
			          		<c:otherwise>
			          			<a href="selectOneBoard.do?bno=${boardList.bno}"> <img
			                     src="http://localhost:8888/img/boardThumbNail/${boardList.thumbNail }"
			                     class="card-img-top" alt=""></a>
			          		</c:otherwise>
			          	</c:choose>
						<div class="card-body">
							<h4 class="card-title">
								<c:choose>
				              		<c:when test="${fn:length(boardList.title) >= 12}">
				                		<a href="selectOneBoard.do?bno=${boardList.bno}"><c:out value="${fn:substring(boardList.title,0,12)}"/>..</a>              		
				              		</c:when>
				              		<c:otherwise>
				              			<a href="selectOneBoard.do?bno=${boardList.bno}">${boardList.title}</a>
				              		</c:otherwise>
				              	</c:choose>
							</h4>
							<p class="card-text">${boardList.mid}</p>
							<p class="card-text">${boardList.readCount}</p>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<c:if test="${pageMaker.prev}">
					<li><a class="page-link" href="boardForm.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
				</c:if>
			</li>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item">
					<%-- <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>> --%>
					<c:if test="${pageMaker.cri.page == idx }">
						<a class="page-link" style="color:black;" href="boardForm.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:if>
					<c:if test="${pageMaker.cri.page != idx }">
						<a class="page-link" href="boardForm.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:if>
				</li>
			</c:forEach>
			
			<li class="page-item">
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a class="page-link" href="boardForm.do${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
				</c:if>
			</li>
			
		</ul>
	</div>
		</c:otherwise>
	</c:choose>
</div>
	
<script type="text/javascript">
$(function() {
	let url = decodeURIComponent(location.href);
	
	let params = url.substring( url.indexOf('?')+1, url.length );
	params = params.split("&");
	for (let i = 0; i < params.length; i++) {
		if (params[i].split("=")[0] == 'categorycode') {
			$('#categorycodeSelect').val(params[i].split("=")[1]);
		} else {
			$('#keyword').val(params[i].split("=")[1]);
		}
	}
	
	
	$('#categorycodeSelect').on('change',handleCategorycodeSelect);
})

function handleCategorycodeSelect(e) {
	let target = e.target;
	let categorycode = target.options[target.selectedIndex].value;
	if ($('#categorycodeSelect').val() != 'all') {
		location.href='boardForm.do?categorycode='+categorycode;
	} else {
		console.log("?");
		location.href='boardForm.do';
	}
}

$('#searchBtn').click(function() {
	let categorycode = $('#categorycodeSelect').val();
	let keyword = $('#keyword').val().trim();
	if (categorycode == 'all') {
		location.href='boardForm.do?keyword='+keyword;
	} else {
		location.href='boardForm.do?categorycode='+categorycode+'&keyword='+keyword;	
	}
})
</script>



