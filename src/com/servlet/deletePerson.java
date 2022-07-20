package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Person;
import com.model.Temple;

/**
 * Servlet implementation class deletePerson
 */
@WebServlet("/deletePerson")
public class deletePerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Person md = new Person();
	UserDao ud = new UserDao();
    public deletePerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("pid"));
		md=ud.getPersonById(id);
		ud.deletePerson(md);
		response.sendRedirect("viewPerson.jsp");
	}

}
