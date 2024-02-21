<%@page import="com.User.userdetails "%>
<link rel="stylesheet" href="Style.css">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-custom">
	<a class="navbar-brand" href="Index.jsp"><i class="fa fa-book"
		aria-hidden="true"></i>E Notes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="Homepage.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home
					<span class="sr-only">(current)</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="AddNotes.jsp"><i
					class="fa fa-plus-circle" aria-hidden="true"></i>Add Notes</a></li>

			<li class="nav-item active"><a class="nav-link" href="ShowNotes.jsp"><i
					class="fa fa-address-book-o" aria-hidden="true"></i>Shownotes</a></li>
		</ul>
		<%
		userdetails user = (userdetails) session.getAttribute("UserDetails");
		System.out.println(user);
		if (user!=null) {
		%>
		<a href="" class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal"
			data-target="#exampleModal" type="submit"><i
			class="fa fa-sign-in" aria-hidden="true"></i>
			<%=user.getName() %>
			</a> <a href="LogoutServelet"
			class="btn btn-light my-2 my-sm-0" type="submit"><i
			class="fa fa-user-plus" aria-hidden="true"></i>Logout</a>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<div class="container text-center">
					<table class="table">
					<tbody>
					<tr>
					<th>User Id</th>
					<td><%=user.getUserId() %></td>
					</tr>
					<tr>
					<th>Name</th>
					<td><%=user.getName()%></td>
					</tr>
					<tr>
					<th>Email</th>
					<td><%=user.getEmail()%></td>
					</tr>
					<tr>
					<th>Password</th>
					<td><%=user.getPassword() %></td>
					</tr>
					
					</tbody>
					</table>
					</div>
					
					
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>

		<%
		} else {
		%>
		<a href="Login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
		<a href="Register.jsp" class="btn btn-light my-2 my-sm-0"
			type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
		<%
		}
		%>

	</div>


</nav>