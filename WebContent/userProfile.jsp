<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.Categories"%>
<%@page import="com.model.Post"%>
<%@page import="java.util.*"%>
<%@page errorPage="errorPage.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
h4 {
	text-transform: capitalize;
}
</style>
</head>
<body>
	<%
	
		if (session.getAttribute("email") == null) {
		response.sendRedirect("index.jsp");
			}
			HttpSession s = request.getSession();
			Users users = (Users) s.getAttribute("email");
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-primary "> <a
		class="navbar-brand" href="#"><img src="images/logo.jpg"
		width="50px" height="50px"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active mx-5"><a class="nav-link text-white"
				href="welcome.jsp">Home</a></li>

			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="userPost.jsp">Post</a></li>

			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="LogoutServlet">Logout</a></li>
		</ul>
	</div>

	<h4 class="text-white">
		Name:
		<%=users.getName()%></h4>
	</nav>
	<%
			UserDao dao = new UserDao();
			List<Post> list = dao.viewPost();
			session.setAttribute("list5", list);
	%>
	<main>
	<div class="container">
		<div class="row m-3">
			<!--first col-->
			<div class="col-md-4">
				<!--categories-->
				<div class="list-group">
					<a href="#" onclick="getPosts(0, this)"
						class=" c-link list-group-item list-group-item-action active">
						All Posts </a>
					<!--categories-->

					<%
						UserDao dao1 = new UserDao();
						List<Categories> list1 = dao1.viewCategory();
						for (Categories cc : list1) {
					%>
					<a href="#" onclick="getPosts(<%=cc.getCid()%>, this)"
						class=" c-link list-group-item list-group-item-action"><%=cc.getCategory()%></a>
					<%
						}
					%>
				</div>

			</div>

			<!--second col-->
			<div class="col-md-8">
				<!--posts-->
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-4x fa-spin"></i>
					<h3 class="mt-2">Loading...</h3>
				</div>
				<div class="container-fluid" id="post-container"></div>
			</div>

		</div>

	</div>

	</main>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()

                $(".c-link").removeClass('active')


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                       // console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active')

                    }
                })

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)


            })
        </script>
</body>
</html>