<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
</head>
<body>

<div id="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="sidebar" />
			<tiles:insertAttribute name="content" />
		</div>
	</div>

</body>
</html>