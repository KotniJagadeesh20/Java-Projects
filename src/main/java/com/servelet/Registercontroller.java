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
 * Servlet implementation class Registercontroller
 */
@WebServlet("/Registercontroller")
public class Registercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registercontroller() {
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
		String name = request.getParameter("Name");
		String Email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String Repassword = request.getParameter("Repassword");

		userdetails user = new userdetails();
		user.setName(name);
		user.setEmail(Email);
		user.setPassword(Repassword);
		user.setRePassword(Repassword);
		System.out.println(user);

		UserDao dao = new UserDao();
		HttpSession session;
		if (password.equals(Repassword)) {

			boolean Regstatus = dao.Registeruser(user);
			System.out.println(Regstatus);
			if (Regstatus) {
				session = request.getSession();
				session.setAttribute("Reg-msg", name + " Registered successfully");
				response.sendRedirect("Register.jsp");
			} else {
				session = request.getSession();
				session.setAttribute("Failed-msg", "some error in the server");
				response.sendRedirect("Register.jsp");
			}

		} else {
			session = request.getSession();
			session.setAttribute("Failed2msg", "Password and Confirm-password are not same...!");
			response.sendRedirect("Register.jsp");

		}

	}

}
