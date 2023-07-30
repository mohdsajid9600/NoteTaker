<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
<%@ include file="css_files/allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<br>
		<h2>Edit Your Note:-</h2>
		<br>
		
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id"));
		Session s=FactoryProvider.buildFactory().openSession();
		Note note=(Note)s.get(Note.class, noteId);
		
		%>
		<form action="EditNote" method="post">
		<input name="note_id" value="<%= note.getId()%>" type="hidden">
			<div class="form-group">
				<label for="title">Note title</label> <input required type="text" name="title"
					class="form-control" id="title" placeholder="Enter here" value="<%=note.getTitle() %>">
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required class="form-control" id="content" name="content" 
					style="height: 250px" placeholder="Enter your content here"><%=note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success btn-sm text-light">Save Your Note</button>
			</div>
		</form>
	</div>
</body>
</html>