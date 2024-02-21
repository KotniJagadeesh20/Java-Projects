<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%userdetails usr1=(userdetails)session.getAttribute("UserDetails");
	if(usr1==null){
		session.setAttribute("Login-error","Please Login....!");
		response.sendRedirect("Login.jsp");
	}
	%>
		
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">
<%@ include file="Allcomponent/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<body>
	<%@ include file="Allcomponent/Navbar.jsp"%>
	<div class="container-fluid ">

		<div class="card py-5">

			<div class="card-body text-center">
				<img alt="" src="Images/Notesadd.jpg" class="img-fluid mx-auto"
					style="max-width: 300px">
				<h1>Start Taking Notes Here</h1>
				<a href="AddNotes.jsp" class="btn-btn-outline-primary">Start here</a>
			</div>
		</div>
	</div>
	<%@include file="Allcomponent/footer.jsp"%>


</body>
</html>