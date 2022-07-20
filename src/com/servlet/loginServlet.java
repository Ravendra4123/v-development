package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.model.Users;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		Users u = UserDao.validate(email, password);

		if (email.equals("ravi") && password.equals("1234") && type.equals("Admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", email);
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('login Success...');");
			pw.println("location='AdminProfile.jsp';");
			pw.println("</script>");

		}
		if (u == null) {
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Something went wrong...');");
			pw.println("location='index.jsp';");
			pw.println("</script>");

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("email", u);
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('login Success User...');");
			pw.println("location='userProfile.jsp';");
			pw.println("</script>");
		}
	}

}