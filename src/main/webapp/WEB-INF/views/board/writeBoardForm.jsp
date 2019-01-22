<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
date : 19-01-14
작성자 : 고은아
내용 : 글쓰기 폼 작성
일부 스크립트 소스가 하단에 있습니다(네이버 스마트 에디터기가 textarea 밑에 있어야 한다는 트러블 슈팅이 있길래)
-->
<script type="text/javascript" src="/editor/js/HuskyEZCreator.js"></script>
<div>
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">글쓰기</h4>
			</div>

		<!-- 	<div class="rightOutDiv">
				<div class="rightInDiv">
					<form class="form-inline">
					</form>
				</div>
			</div> -->

			<div class="modal-body">
				<form class="form-horizontal" enctype="multipart/form-data"
					action="writeBoard.do" id="form" method="post">
						<div class="form-group">
							<select class="form-control" id="categoryCode" name="categoryCode">
								<option>전체</option>
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
							</select>
						</div>
					<div class="form-group">
						<label for="id">제목</label>
						<div>
							<input id="title" name="title" type="text" class="form-control"
								placeholder="제목을 입력해주세요" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="validityCheck">내용</label>
						<div>
							<textarea name="bContent" rows="15" cols="90" id="bContent"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="profile">썸네일</label> <input type="file" name="uFile">
					</div>
					<!-- 					<div class="modal-footer"> -->
					<div class="form-group">
						<input type="submit" class="btn btn-primary" id="btn" value="등록">
					</div>
					<!--           </div> -->
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
	var eEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : eEditors,
		elPlaceHolder : "bContent",
		sSkinURI : "/editor/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});

	//전송버튼 클릭이벤트
	$("#btn").click(function() {
		//id가 content인 textarea의 에디터에서 대입
		eEditors.getById["bContent"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit
		var categoryCode = $("#categoryCode").val();
		$("#form").submit();
	})
</script>