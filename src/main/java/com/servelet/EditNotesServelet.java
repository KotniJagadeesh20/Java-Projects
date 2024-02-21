package com.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.NotesDao;

/**
 * Servlet implementation class EditNotesServelet
 */
@WebServlet("/EditNotesServelet")
public class EditNotesServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditNotesServelet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("Notesid"));
			String Title = request.getParameter("title");
			String Content = request.getParameter("content");
			System.out.println(id);
			System.out.println(Title);
			System.out.println(Content);
			NotesDao dao = new NotesDao();
			boolean Updatestatus = dao.UpdateNotes(id, Title, Content);
			HttpSession session;
			if (Updatestatus) {
				System.out.println("Data Inserted successfully");
				session = request.getSession();
				session.setAttribute("Update_msg", "Notes Updated successfully");
				response.sendRedirect("ShowNotes.jsp");

			} else {
				System.out.println("Data not Inserted ");
				session = request.getSession();
				session.setAttribute("Update_msg2", "Some Error in the Server");
				response.sendRedirect("ShowNotes.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
