
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">
<%@ include file="Allcomponent/allcss.jsp"%>
<meta charset="ISO-8859-1">
<title>Register page</title>
</head>
<body>
<%@include file="Allcomponent/Navbar.jsp"%>
	<div class="container-fluid">
		
		
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card-mt-4">
						<div class="card-header text-center text-white bg-dark mt-4">
							<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
							<h2>Register</h2>
							
						</div>
												
						
						<div class="card-body bg-white ">
						<%
						String Registermsg = (String) session.getAttribute("Reg-msg");
						if (Registermsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=Registermsg%></div>
						<%
						session.removeAttribute("Reg-msg");
						}
						%>
						<%
						String Failedmsg = (String) session.getAttribute("Failed-msg");
						if (Failedmsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=Failedmsg%></div>
						<%
						session.removeAttribute("Failed-msg");
						}
						%>
						<%
						String Failed = (String) session.getAttribute("Failed2msg");
						if (Failed != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=Failed%></div>
						<%
						session.removeAttribute("Failed2msg");
						}
						%>
						
							<form action="Registercontroller" method="POST">
								<div class="form-group" >
									<label for="Full name">Enter Full name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter your name" name="Name" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email" name="Email" required="required">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password" name="Password" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">confirm Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="re-enterPassword" name="Repassword" required="required">
								</div>

								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Register</button>
									<p>Already have an account <a href="Login.jsp">click here</a></p>
							</form>
						</div>
					</div>
				</div>
			</div>


		
	<%@include file="Allcomponent/footer.jsp"%>
	</div>





	


</body>
</html>

