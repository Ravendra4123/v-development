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
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.model.Person;

@WebServlet("/addPersonServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class addPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Person pr=new Person();
	UserDao ud = new UserDao();

    public addPersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String name = request.getParameter("name");
		String education = request.getParameter("education");
		String address = request.getParameter("address");
		Part part = request.getPart("file");
		String dob = request.getParameter("dob");
		String type = request.getParameter("type");
		Date date = new Date();

		pr.setName(name);
		pr.setEducation(education);
		pr.setAddress(address);
		pr.setImages(part.getSubmittedFileName());
		pr.setDob(dob);
		pr.setWork(type);
		pr.setDate(date);

		ud.savePerson(pr);

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
		 pw.println("location='addperson.jsp';");
		 pw.println("</script>");

		
	}

}
