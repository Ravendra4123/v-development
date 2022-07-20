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
import com.model.School;

@WebServlet("/addSchoolServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class addSchoolServlet extends HttpServlet {

	School sc = new School();
	UserDao ud = new UserDao();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String process = request.getParameter("process");
		Part part = request.getPart("file");
		String diwas = request.getParameter("diwas");
		String type = request.getParameter("type");
		Date date = new Date();

		sc.setName(name);
		sc.setAddress(address);
		sc.setProcess(process);
		sc.setImages(part.getSubmittedFileName());
		sc.setDiwas(diwas);
		sc.setType(type);
		sc.setDate(date);

		ud.save(sc);

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
		 pw.println("alert('School Added...');");
		 pw.println("location='addschool.jsp';");
		 pw.println("</script>");

	}

}
