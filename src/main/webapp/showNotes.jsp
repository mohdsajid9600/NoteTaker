<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@ include file="css_files/allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	<div class="container my-3">
		<c:if test="${not empty successMsg }">
			<p class="text-center fw-blod fs-3 text-success">${successMsg}</p>
			<c:remove var="successMsg" scope="session" />
		</c:if>
		<h2>All Notes Here:-</h2>
		<div class="row">
			<div class="col col-12">

				<%
				try {
				%>
				<%
				Session s = FactoryProvider.buildFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>
				<div class="card mt-3 paint-card">
					<img class="card-img-top mt-3 ml-3" src="img/content-writing.png"
						style="max-width: 60px" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p class="text-primary">
							<b>Update on : <%=note.getAddedDate()%></b>
						</p>
						<div class="container text-right">
							<a href="editNote.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary btn-sm">Update</a> <a
								href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger btn-sm">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				s.close();
				%>

				<%
				} catch (Exception e) {
				e.printStackTrace();

				HttpSession session1 = request.getSession();
				session1.setAttribute("errorMsg", "Please Redploy your project on server have no table inside database");
				response.sendRedirect("index.jsp");

				}
				%>

			</div>
		</div>
	</div>
</body>
</html>