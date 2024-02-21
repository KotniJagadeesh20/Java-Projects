<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.bg-image {
	background: url("Images/notebook1.jpg");
	width: 100%;
	height: 80vh;
}
</style>
<%@ include file="Allcomponent/allcss.jsp"%>
<link rel="stylesheet" href="Style.css">

<meta charset="ISO-8859-1">
<title>Index page</title>
</head>
<body>
<%@ include file="Allcomponent/Navbar.jsp" %>
	<div class="container-fluid bg-image">
		<div class="text-center">
			<h1 class="text-white">
				<i class="fa fa-book" aria-hidden="true"></i>E Notes-Save your notes 
			</h1>
			<a href="Login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
			 <a href="Register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i
				class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
		</div>

	</div>
	<%@include file="Allcomponent/footer.jsp"%>
</body>
</html>