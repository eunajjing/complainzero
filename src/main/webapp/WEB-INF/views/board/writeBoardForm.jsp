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
			<div class="modal-body">
				<form class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
							<label for="id">제목</label>
							<div>
								<input id="id" name="id" type="email" class="form-control" placeholder="제목을 입력해주세요" required="required">
							</div>
						</div>
					<div class="form-group">
						<label for="validityCheck">내용</label>
						<div>
						<textarea name="smarteditor" rows="15" cols="90" id="smarteditor"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="profile">썸네일</label>
						<input type="file">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" disabled="disabled">등록</button>
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
        oAppRef: eEditors,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/editor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });
</script>