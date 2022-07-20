package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Users;

/**
 * Servlet implementation class userRegistration
 */
@WebServlet("/userRegistration")
public class userRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Users u = new Users();
		u.setName(name);
		u.setEmail(email);
		u.setPassword(password);

		int status = UserDao.registration(u);
		if (status > 0) {
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Registration Success...');");
			pw.println("location='index.jsp';");
			pw.println("</script>");
		} else {
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Something went wrong...');");
			pw.println("location='registration.jsp';");
			pw.println("</script>");
		}
	}
}
