package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Medical;
import com.model.Temple;

/**
 * Servlet implementation class deleteTemple
 */
@WebServlet("/deleteTemple")
public class deleteTemple extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Temple md = new Temple();
	UserDao ud = new UserDao();
    public deleteTemple() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("tid"));
		md=ud.getTempleById(id);
		ud.deleteTemple(md);
		response.sendRedirect("viewTemple.jsp");
	}

}
