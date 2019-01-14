<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
        <!-- Content Column -->
        <table class="col-lg-3 mb-4">
          <thead>
            <tr>
              <th>ID</th>
              <th>nickname</th>
            </tr>
          </thead>
          <tbody>     
            <c:forEach var="member" items="${memberList }">
            <tr class="table-primary">
              <td>${member.id }</td>
              <td>${member.nickname }</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>