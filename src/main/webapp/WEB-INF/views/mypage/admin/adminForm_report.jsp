<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- datatable css -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
 
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
        <table class="table table-striped table-bordered table-hover" id="dt">
          <thead>
            <tr>
              <th class="text-center">신고 번호</th>
              <th class="text-center">신고당한 아이디</th>
              <th class="text-center">신고한 아이디</th>              
              <th class="text-center">게시글/댓글</th>              
              <th class="text-center">게시글 번호</th>              
              <th class="text-center">신고 사유</th>              
              <th class="text-center">상세내용</th>              
              <th class="text-center">처리 상태</th>              
            </tr>
          </thead>
          <tbody>     
            <c:forEach var="report" items="${reportList }">
            <tr class="table-primary">
              <td>${report.rno }</td>
              <td>${report.isTo }</td>
              <td>${report.isFrom }</td>
              <td>${report.targetTypeCode }</td>
              <td>${report.targetCode }</td>
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
              </c:if>
              <c:if test="${report.processCode == 'R01' }">
              <td>반려</td>
              </c:if>
              <c:if test="${report.processCode == 'R02' }">
              <td>처리</td>
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
     }); 
    </script>
  </body>
</html>