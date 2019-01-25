<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.newdeal.dto.Report" %>
<!-- datatable css -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
 
 <%List<Report> reportList = new ArrayList<Report>();  %>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
        <table class="table table-striped table-bordered table-hover" id="dt">
          <thead>
            <tr>
              <th class="text-center">신고 번호</th>
              <th class="text-center">신고당한 아이디</th>
              <th class="text-center">신고한 아이디</th>              
              <th class="text-center">게시글/댓글</th>              
<<<<<<< HEAD
              <th class="text-center">게시글 번호</th>              
              <th class="text-center">신고 사유</th>              
              <th class="text-center">상세내용</th>              
=======
              <th class="text-center">게시글 제목</th>              
              <th class="text-center">신고 사유</th>
>>>>>>> cho
              <th class="text-center">처리 상태</th>              
              <th class="text-center">신고 처리</th>              
            </tr>
          </thead>
          <tbody>     
<%--           <c:set var="report" value="${reportList }"></c:set> --%>
            <c:forEach var="report" items="${reportList }">
            <tr class="table-primary">
              <td id="no">${report.rno }</td>
              <td id="id">${report.isTo }</td>
              <td>${report.isFrom }</td>
              <td>${report.targetTypeCode }</td>
              <td><a href="selectOneBoard.do?bno=${report.targetCode}
                          &type=${report.targetTypeCode}">${report.title }</a></td>
              <c:if test="${report.reasonCode == 'RC01' }">
              <td>욕설</td>
              </c:if>
              <c:if test="${report.reasonCode == 'RC02' }">
              <td>광고성</td>
              </c:if>
              <c:if test="${report.reasonCode == 'RC03' }">
              <td>음란성</td>
              </c:if>
              <c:if test="${report.reasonCode == 'RC04' }">
              <td>명예훼손</td>
              </c:if>
              <c:if test="${report.reasonCode == 'RC00' }">
              <td>기타</td>
              </c:if>
              <td>${report.rContent }</td>
              <c:if test="${report.processCode == 'R00' }">
              <td>대기</td>
              <td><button class="btn btn-primary"><label class="approve">승인</label></button>
              <button class="btn btn-primary"><label class="refuse">거절</label></button></td>
              </c:if>
              <c:if test="${report.processCode == 'R01' }">
              <td>반려</td><td><input type="hidden"></td>
              </c:if>
              <c:if test="${report.processCode == 'R02' }">
              <td>처리</td><td><input type="hidden"></td>
              </c:if>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- datatable js -->
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
    
    <script type="text/javascript">
     $(document).ready(function() { 
    	 var lang_kor = {
    		      "decimal" : "",
    		      "emptyTable" : "데이터가 없습니다.",
    		      "info" : "_START_ - _END_ (총 _TOTAL_ 글)",
    		      "infoEmpty" : "0명",
    		      "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
    		      "infoPostFix" : "",
    		      "thousands" : ",",
    		      "lengthMenu" : "_MENU_ 개씩 보기",
    		      "loadingRecords" : "로딩중...",
    		      "processing" : "처리중...",
    		      "search" : "검색 : ",
    		      "zeroRecords" : "검색된 데이터가 없습니다.",
    		      "paginate" : {
    		          "first" : "첫 페이지",
    		          "last" : "마지막 페이지",
    		          "next" : "다음",
    		          "previous" : "이전"
    		      },
    		      "aria" : {
    		          "sortAscending" : " :  오름차순 정렬",
    		          "sortDescending" : " :  내림차순 정렬"
    		      }
    		  };
    	 
      $('#dt').DataTable({
        responsive: true,
        searching: true,
        bAutoWidth: true,
        bPaginate: true,
        language : lang_kor
//      pageLength:3
      }); 
      
      $(document).on('click', '.approve', function() {
//     	  var parameter = JSON.stringify({'id' : $('#id').text()});
		var id = $(this).parents('tr').children().eq(1).text();
		var no = $(this).parents('tr').children().eq(0).text();
		var me = this;

    	  $.ajax({
    		  url : 'blackList.do/' + id + '/' + no + '/' + 2,
    		  type : 'PUT',
    		  contentType : 'application/json;charset=UTF-8',
//     		  data : parameter,
    		  success : function(data) {
    			  alert("승인되었습니다.");
    			  $(me).parents('tr').children().eq(7).text('처리');
    			  $(me).parents('tr').children().eq(8).children().hide();
    		  }, error :  function(xhr, status, error) {
    			  alert(error);
    		  }
    	  });
      });
      
      $(document).on('click', '.refuse', function() {
//     	  var parameter = JSON.stringify({'id' : $('#id').text()});
		var id = $(this).parents('tr').children().eq(1).text();
		var no = $(this).parents('tr').children().eq(0).text();
		var me = this;
	
    	  $.ajax({
    		  url : 'blackList.do/' + id + '/' + no + '/' + 1,
    		  type : 'PUT',
    		  contentType : 'application/json;charset=UTF-8',
//     		  data : parameter,
    		  success : function(data) {
    			  alert("거절되었습니다.");
    			  $(me).parents('tr').children().eq(7).text('반려');
    			  $(me).parents('tr').children().eq(8).children().hide();
    		  }, error :  function(xhr, status, error) {
    			  alert(error);
    		  }
    	  });
      });
     }); 
    </script>
  </body>
</html>