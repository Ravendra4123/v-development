<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Users"%>
<%@page import="java.util.*"%>

<jsp:setProperty property="*" name="obj" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
</head>
<body>
	<%
		if (session.getAttribute("admin") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<%
		List<Users> list = UserDao.getAllRecords();
		request.setAttribute("list", list);
	%>
	<div class="container">
		<table class="table table-bordered " border="1">
			<h1 class="text-center m-2">Admin Panel</h1>
			<thead class="thead bg-dark text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Date</th>
					<th scope="col">Status</th>
					<th scope="col">Conform</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getId()}</td>
					<td>${u.getName()}</td>
					<td>${u.getEmail()}</td>
					<td>${u.getPassword()}</td>
					<td>${u.date}</td>
					<td style="color: green; font-weight: 700;">${u.status}</td>
					<td><a href="AproveServlet?id=${u.getId() }"><c:if
								test="${u.status=='Null'}">
								<button class="bg-success p-1 text-white"
									onclick="return confirm('Are you sure to Approverd');">Approved</button>
							</c:if></a>&nbsp;<a href="rejectServlet?id=${u.getId() }"><c:if
								test="${u.status=='Null'}">
								<button class="bg-danger p-1 text-white"
									onclick="return confirm('Are you sure you want to rejected this item?');">Rejected</button>
							</c:if></a></td>
				</tr>
			</c:forEach>
		</table>
		<center>
			<a href="ProjectHeader.jsp"><button
					class="bg-primary p-2 btn-sm text-white">DashBoard</button></a>
		</center>

	</div>
</body>
</html>