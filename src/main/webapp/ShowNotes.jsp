<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.Dao.NotesDao"
	import="com.User.NotesDetails" import="java.util.List"
	import="com.User.userdetails"%>
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
		
		<%String Updates= (String)session.getAttribute("Update_msg");
		if( Updates!=null){%>
		<div class="alert alert-success" role="alert"><%=Updates%></div>
			
		<%session.removeAttribute("Update_msg");
		}
		%>
		
		<%String Updates2= (String)session.getAttribute("Update_msg2");
		if( Updates2!=null){%>
		<div class="alert alert-success" role="alert"><%=Updates2%></div>
			
		<%session.removeAttribute("Update_msg2");
		}
		%>
		<%String DeleteMsg= (String)session.getAttribute("Delete_msg");
		if( DeleteMsg!=null){%>
		<div class="alert alert-success" role="alert"><%=DeleteMsg%></div>
			
		<%session.removeAttribute("Delete_msg");
		}
		%>
		<%String DeleteMsg2= (String)session.getAttribute("Delete_msg2");
		if( DeleteMsg2!=null){%>
		<div class="alert alert-success" role="alert"><%=DeleteMsg2%></div>
			
		<%session.removeAttribute("Delete_msg2");
		}
		%>
		
		
		<h2 class="text-center">All notes:</h2>
		<div class="row">
			<div class="col-md-10 offset-md-1 flex">
			<%
				if (usr2 != null) {
					NotesDao Dao = new NotesDao();
					List<NotesDetails> list = Dao.Getdata(usr2.getUserId());
					for (NotesDetails ND : list) {
				%>
			
				
				<div class="card mt-3">
					<img alt="Notesimage" src="Images/notebook image.jpg"
						class="card-img-top mt-2  mx-auto" style="max-width: 100px;">
					<div class="card-body p-4 mr-2">
						<h4 class="card-title"><%=ND.getTitle() %></h4>
						<p><%=ND.getContent() %></p>

						<p>
							<b class="text-success">Published by:<%=usr2.getName() %>
							</b> <br> <b class="text-success">Published date:<%=ND.getAdate() %></b>
						</p>
					
					<div class="text-center mt-2 mb-2">
						<a href="DeleteServelet?Notes_id=<%=ND.getId() %>" method="GET" class="btn btn-danger" name="Notes_id">Delete</a> <a href="Edit.jsp?Notes_id=<%=ND.getId() %>"
							class="btn btn-primary">Edit</a>
					</div>
					</div>
				</div>
				
				<%
				}
				}
				%>


				
			</div>

		</div>

	</div>
	<%@include file="Allcomponent/footer.jsp"%>
		

</body>
</html>