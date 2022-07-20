package com.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.Query;

@WebServlet(name = "SendEmail", urlPatterns = {"/SendEmail"})
public class SendEmail extends HttpServlet {
	UserDao ud=new UserDao();
	Query qu=new Query();

    String name, subject, email, msg;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        name = request.getParameter("name");
        email = request.getParameter("email");
        subject = request.getParameter("subject");
        msg = request.getParameter("message");

        final String username = "msiverma534@gmail.com";//your email id
        final String password = "Msi@8052988047";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");


        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			String[] listofIDS = { username, email };

			for (String cc : listofIDS) {
				message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(cc));
			}
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			MimeBodyPart textPart = new MimeBodyPart();
			Multipart multipart = new MimeMultipart();
			String final_Text = "Thank for query...Name: " + name + " <br>   " + "Email: " + email + "    " + "Subject: "
					+ subject + "    " + "Mesaage: " + msg;
			textPart.setText(final_Text);
			message.setSubject(subject);
			multipart.addBodyPart(textPart);
			message.setContent(multipart);
			message.setSubject("Contact Details");
			out.println("Sending");
			Transport.send(message);
			
			Date date=new Date();
			qu.setName(name);
			qu.setEmail(email);
			qu.setSubject(subject);
			qu.setMessage(msg);
			qu.setQdate(date);
			
			ud.saveQuery(qu);
			
			out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
			out.println("Thank you " + name + ", your message has been submitted to us.</center>");
		} catch (Exception e) {
			out.println(e);
		}
    }

}
