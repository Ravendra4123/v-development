<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Categories"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Post</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
@media screen and (min-width: 900px) {
	input[type=file] {
		border: 1px solid gray;
		padding: 5px;
		border-radius: 5px;
	}
	.container{
		width: 50%;
	}
}

@media screen and (max-width: 600px) {
	
	h3{
		text-transform: uppercase;
	}
	
	input[type=file] {
		border: 1px solid gray;
		padding: 5px;
		width:100%;
		border-radius: 5px;
	}
	input[type=text] {
		width: 100%;
		padding: 12px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		margin-top: 6px;
		margin-bottom: 16px;
		resize: vertical;
	}
	input[type=submit] {
		background-color: #04AA6D;
		color: white;
		padding: 12px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
}
</style>

</head>
<body>
	<%
		if (session.getAttribute("email") == null) {
			response.sendRedirect("index.jsp");
		}
	%>

	<%
		UserDao dao = new UserDao();
		List<Categories> list = dao.viewCategory();
		session.setAttribute("list", list);
	%>
	<div class="container">
		<h3 class="text-center m-3">Create Post</h3>
		<form action="addPostServlet" method="post"
			enctype="multipart/form-data">
			<div>
				<select class="custom-select my-3" name="catId">
					<option selected disabled>--Select Categories--</option>
					<c:forEach items="${list}" var="u">
						<option value="${u.getCid() }">${u.getCategory() }</option>
					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Title" required
					name="ptitle">
			</div>
			<div class="form-group">
				<textarea class="form-control" required placeholder="Message" name="pmessage"></textarea>
			</div>
			<div class="form-group">
				<label>Select Image</label> <input type="file" required
					class="form-control-file" name="file">
			</div>
			<button type="submit" class="btn btn-outline-success w-25">Post</button>
		</form>
	</div>


</body>
</html>