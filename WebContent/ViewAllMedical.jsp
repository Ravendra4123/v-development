<%@page import="com.model.Medical,com.dao.UserDao,java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>All Medical</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.css"
	rel="stylesheet" />
<style>
@media screen and (min-width: 992px) {
	h1 {
		display: none;
	}
}

@media screen and (max-width: 600px) {
	table {
		display: none;
	}
	h1 {
		text-align: center;
		margin: 15px;
	}
}

@media ( min-width :601px) and (max-width:992px) {
	table {
		display: none;
	}
	h1 {
		text-align: center;
		margin: 15px;
	}
}
</style>
</head>
<body class="container">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%
		UserDao dao = new UserDao();
		List<Medical> list = dao.viewMedical();
		session.setAttribute("list", list);
		int number = 1;
	%>
	<h1>Open Only Desktop/Laptop</h1>
	<table class="table table-bordered mt-3">
		<thead class="bg-dark text-white text-center">
			<tr>
				<th scope="col">S No.</th>
				<th scope="col">Name</th>
				<th scope="col">Address</th>
				<th scope="col">Process</th>
				<th scope="col">Distance</th>
				<th scope="col">Image</th>
				<th scope="col">Contact Number</th>
				<th scope="col">Type</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<c:forEach items="${list}" var="u">
				<tr>
					<th scope="row"><%=number++%></th>
					<td>${u.name }</td>
					<td>${u.address }</td>
					<td>${u.process}</td>
					<td>${u.distance}</td>
					<td><img src="images/Simage/${u.images }" width="120px" height="70px"></td>
					<td>${u.sthapana}</td>					
					<td>${u.type }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>