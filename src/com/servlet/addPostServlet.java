package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.model.Categories;
import com.model.Post;
import com.model.Users;

/**
 * Servlet implementation class addPostServlet
 */
@WebServlet("/addPostServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class addPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    Post po=new Post();
    UserDao ud=new UserDao();
    Categories ct=new Categories();
    
    public addPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		int catId=Integer.parseInt(request.getParameter("catId"));
		String ptitle=request.getParameter("ptitle");
		String pmessage=request.getParameter("pmessage");
		Part part=request.getPart("file");
		
		HttpSession session=request.getSession();
		Users users=(Users) session.getAttribute("email");
		
	
		Date date=new Date();
		
		po.setTitle(ptitle);
		po.setMessage(pmessage);
		po.setImage(part.getSubmittedFileName());
		ct=ud.getCategoryById(catId);
		po.setCategories(ct);
		po.setUserId(users.getId());
		po.setPdate(date);
		
		ud.savePost(po);
		try {
			String path = request.getRealPath("images") + File.separator + "Simage" + File.separator + part.getSubmittedFileName();
			System.out.println(path);

			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = part.getInputStream();

			byte[] data = new byte[is.available()];

			is.read(data);

			fos.write(data);

			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		 pw.println("<script type=\"text/javascript\">");
		 pw.println("alert('Added...');");
		 pw.println("location='userProfile.jsp';");
		 pw.println("</script>");
	}

}
