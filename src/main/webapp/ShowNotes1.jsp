<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Dao.NotesDao"
	import="com.User.NotesDetails" import="java.util.List"%>
<%
userdetails usr2 = (userdetails) session.getAttribute("UserDetails");
if (usr2 == null) {
	session.setAttribute("Login-error", "Please Login....!");
	response.sendRedirect("Login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">
<%@ include file="Allcomponent/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="Allcomponent/Navbar.jsp"%>
		<h2 class="text-center">All notes:</h2>
		
		<div class="row">
		
			<div class="col-md-12">
				<%
				if (usr2 != null) {
					NotesDao Dao = new NotesDao();
					List<NotesDetails> list = Dao.Getdata(usr2.getUserId());
					
					for (NotesDetails ND : list) {
						System.out.println(ND);
				%>
				<div class="card mt-3">
					<img alt="Notesimage" src="Images/notebook image.jpg"
						class="card-img-top mt-2  mx-auto" style="max-width: 100px;">
						
					<div class="card-body p-4 mr-2">
					
						<h2 class="card-title"><%=ND.getTitle()%></h2>
						<p><%=ND.getContent()%></p>

						<p>
							<b class="text-success">Published by:<%=usr2.getName()%>
							</b> <br> <b class="text-success">Published date:<%=ND.getAdate()%></b>
						</p>
					</div>
					<div class="text-center mt-2 mb-2">
						<a href="#" class="btn btn-danger">Delete</a> 
						<a href="Edit.jsp" class="btn btn-primary">Edit</a>
					</div>
				</div>
				

				<%
				}
				}
				%>
			</div>

		</div>

	</div>



</body>
</html>