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
 * Servlet implementation class DeleteServelet
 */
@WebServlet("/DeleteServelet")
public class DeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteServelet() {
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
		int id = Integer.parseInt(request.getParameter("Notes_id"));
		System.out.println(id);

		NotesDao dao = new NotesDao();
		boolean DeleteStatus = dao.DeleteNotes(id);
		HttpSession session;
		if (DeleteStatus) {
			System.out.println("Notes Deleted successfully");
			session = request.getSession();
			session.setAttribute("Delete_msg", "Notes Deleted Successfully ");
			response.sendRedirect("ShowNotes.jsp");

		} else {
			session = request.getSession();
			session.setAttribute("Delete_msg2", "Some Error in the Server");
			response.sendRedirect("ShowNotes.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
