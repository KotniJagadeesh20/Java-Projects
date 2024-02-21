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
<title>Add Notes</title>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="Allcomponent/Navbar.jsp"%>
		<h1 class="text-center">Add Notes Here</h1>
		
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="AddNotesController" method="POST">
				
					<div class="form-group" >
				    <%userdetails usr=(userdetails) session.getAttribute("UserDetails");
				    if(usr!=null){%>
				    	<input type= "hidden" value="<%=usr.getUserId() %>" name="Uid">
				    <% }
				     %>
					
					
						<label for="Full name">Enter Title</label> <input type="text"
							class="form-control" name="title" requried="requried" placeholder="Enter Your Title here">
					</div>
					<div class="form-group">
						<label for="Full name">Enter Content</label>
						<textarea rows="9" cols="" class="form-control" name="content" requried="requried"  placeholder="Enter Your Content here"></textarea>

					</div>
					<div class="text-center">
							<button type="submit" class="btn btn-primary ">Add Notes</button>
						</div>	
				</form>

			</div>
		</div>
	</div>
	<%@ include file="Allcomponent/footer.jsp"%>
		
		
		
		
	</div>
	

</body>
</html>