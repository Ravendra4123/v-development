package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Person;
import com.model.Shop;

/**
 * Servlet implementation class deleteShop
 */
@WebServlet("/deleteShop")
public class deleteShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    Shop md = new Shop();
	UserDao ud = new UserDao();
 
    public deleteShop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("sid"));
		md=ud.getShopById(id);
		ud.deleteShop(md);
		response.sendRedirect("viewShop.jsp");
	}

}
