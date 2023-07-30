<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Welcome To NoteTaker</title>
<%@ include file="css_files/allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container my-3">
	<c:if test="${not empty errorMsg }">
			<p class="text-center fw-blod fs-3 text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<div class="card py-3 paint-card">

			<img alt="" src="img/content-writing.png" class="img-fluid mx-auto"
				style="max-width: 400px">
			<h1 class="text-center text-primary text-uppercase">Start Taking Your Notes
			</h1>
			<div class="container text-center">
				<a href="addNotes.jsp" class="btn-outline-primary btn btn-md">Start Here</a>
			</div>
		</div>
	</div>

</body>
</html>

