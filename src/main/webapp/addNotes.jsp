<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@ include file="css_files/allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
	<c:if test="${not empty errorMsg }">
			<p class="text-center fw-blod fs-3 text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<br>
		<h2>Please fill your Notes details:-</h2>
		<br>
		<form action="SaveNote" method="post">
			<div class="form-group">
				<label for="title">Note title</label> <input required type="text" name="title"
					class="form-control" id="title" placeholder="Enter here">
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required class="form-control" id="content" name="content"
					style="height: 250px" placeholder="Enter your content here"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn purpale btn-sm text-light">Add Your Note</button>
			</div>
		</form>
	</div>
</body>
</html>