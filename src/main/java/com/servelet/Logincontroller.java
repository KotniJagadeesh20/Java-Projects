package com.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.User.userdetails;

/**
 * Servlet implementation class Logincontroller
 */
@WebServlet("/Logincontroller")
public class Logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Logincontroller() {
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
		String mail = request.getParameter("Email");
		String password = request.getParameter("Password");
		userdetails details = new userdetails();
		details.setEmail(mail);
		details.setPassword(password);

		UserDao dao = new UserDao();
		HttpSession session;
		userdetails loginuser = dao.loginuser(details);
		if (loginuser != null) {
			session = request.getSession();
			session.setAttribute("UserDetails", loginuser);
			response.sendRedirect("Homepage.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("Failedmsg", "Mail and Password are not valid...!");
			response.sendRedirect("Login.jsp");
		}

		doGet(request, response);
	}

}
