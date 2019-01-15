<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
        <!-- Content Column -->
        <table class="table table-striped table-bordered table-hover" id="dt">
          <thead>
            <tr>
              <th class="text-center">테스트</th>
              <th class="text-center">테스트</th>
              <th class="text-center">테스트</th>              
            </tr>
          </thead>
          <tbody>     
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
          <tr>
          <td>테스트1</td>
          <td>테스트2</td>
          <td>테스트3</td>
          </tr>
<%--             <c:forEach var="suggest" items="${suggestList }"> --%>
<!--             <tr class="table-primary"> -->
<%--               <td>${member.id }</td> --%>
<%--               <td>${member.nickname }</td> --%>
<%--               <td>${member.enabled }</td> --%>
<!--             </tr> -->
<%--             </c:forEach> --%>
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
      $('#dt').DataTable({
//          responsive: true,
//         searching: true,
//         bAutoWidth: true,
//         bPaginate: true
      }); 
     }); 
    </script>
  </body>
</html>