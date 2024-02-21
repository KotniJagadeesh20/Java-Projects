package com.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.NotesDao;

/**
 * Servlet implementation class AddNotesController
 */
@WebServlet("/AddNotesController")
public class AddNotesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNotesController() {
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

		int Uid = Integer.parseInt(request.getParameter("Uid"));
		String Title = request.getParameter("title");
		String Content = request.getParameter("content");

		NotesDao dao = new NotesDao();

		boolean AddStatus = dao.Addnotes(Title, Content, Uid);
		if (AddStatus) {
			response.sendRedirect("ShowNotes.jsp");
			System.out.println("Text entered successfully");

		} else {
			System.out.println("Text not entered");
		}

		doGet(request, response);
	}

}
