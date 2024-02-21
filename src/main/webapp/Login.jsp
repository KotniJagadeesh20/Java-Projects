<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">
<%@ include file="Allcomponent/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<%@ include file="Allcomponent/Navbar.jsp"%>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
			<div class="card-mt-4"></div>
			<div class="card-header text-center text-white bg-dark mt-4 ">
			<i class="fa fa-sign-in fa-3x" aria-hidden="true"></i>
			<h2>Login</h2>
			</div>
			
			<div class="card-body bg-white ">
			
			<%
						String 	Loginfailed = (String) session.getAttribute("Failedmsg");
						if (Loginfailed != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=Loginfailed%></div>
						<%
						session.removeAttribute("Failedmsg");
						}
						%>
						
						
						<%
						String 	WithoutLogin = (String) session.getAttribute("Login-error");
						if (WithoutLogin != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=WithoutLogin%></div>
						<%
						session.removeAttribute("Login-error");
						}
						%>
						
						<%
						String 	LogoutMsg = (String) session.getAttribute("Logout-msg");
						if (LogoutMsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=LogoutMsg%></div>
						<%
						session.removeAttribute("Logout-msg");
						}
						%>
			
				<form action="Logincontroller" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email" name="Email">
							
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" name="Password">
					</div>
					
					<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
				</form>
			
			</div>
				
			</div>
		</div>
    
	</div>
    <%@include file="Allcomponent/footer.jsp"%>

</body>
</html>