<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.Dao.NotesDao" import="com.User.NotesDetails" %>
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
<title>EditPage</title>
</head>
<body>
<% int 	Edit_id=Integer.parseInt(request.getParameter("Notes_id"));
   NotesDao dao= new NotesDao();
   NotesDetails Ndetails= dao.getDataByid(Edit_id);
   
%>

<div class="container-fluid">
		<%@ include file="Allcomponent/Navbar.jsp"%>
		<h1 class="text-center">Edit notes here</h1>
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="EditNotesServelet" method="POST">
				<div class="form-group" >
				    <%userdetails usr=(userdetails) session.getAttribute("UserDetails");%>
				    
				    	<input type="hidden" value="<%=Edit_id %>" name="Notesid">
				    
					
					
						<label for="Full name">Enter Title</label> <input type="text"
							class="form-control" name="title" value="<%=Ndetails.getTitle() %>" >
					</div>
					<div class="form-group">
						<label for="Full name">Enter Content</label>
							<textarea rows="9" cols="" class="form-control" name="content" 
							value="<%=Ndetails.getTitle() %>"></textarea>

					</div>
					<div class="text-center">
							<button type="submit" class="btn btn-primary ">Edit Notes</button>
						</div>	
				</form>

			</div>
		</div>
	</div>
	<%@ include file="Allcomponent/footer.jsp"%>
		
		
		
	</div>
	
		
		
		
	
				
					
</body>
</html>