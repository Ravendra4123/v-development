package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Medical;
import com.model.School;

/**
 * Servlet implementation class deleteMedical
 */
@WebServlet("/deleteMedical")
public class deleteMedical extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Medical md = new Medical();
	UserDao ud = new UserDao();
    
    public deleteMedical() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("mid"));
		md=ud.getMedicalById(id);
		ud.deleteMedical(md);
		response.sendRedirect("viewMedical.jsp");
	}

}
