<%@page import="com.dao.UserDao"%>
<%@page import="com.model.School"%>
<%@page import="com.model.Medical"%>
<%@page import="com.model.Temple"%>
<%@page import="com.model.Post"%>
<%@page import="com.model.Shop"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Village</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@media screen and (min-width: 992px) {
	.fa {
		padding: 20px;
		border-radius: 20px;
		font-size: 30px;
		width: 150px;
		text-align: center;
		text-decoration: none;
		margin: 5px 2px;
	}
	.fa:hover {
		opacity: 0.7;
	}
	.fa-facebook {
		background: #3B5998;
		color: white;
	}
	.fa-twitter {
		background: #55ACEE;
		color: white;
	}
	.fa-whatsapp {
		background: #0fa10f;
		color: white;
	}
	.fa-linkedin {
		background: #007bb5;
		color: white;
	}
	.fa-youtube {
		background: #bb0000;
		color: white;
	}
	.fa-instagram {
		background: #125688;
		color: white;
	}
	#slider {
		height: 550px;
	}
	.Row {
		display: table;
		width: 100%; /*Optional*/
		table-layout: fixed; /*Optional*/
		border-spacing: 10px; /*Optional*/
	}
	.Column {
		display: table-cell;
		text-align: center;
		border: 1px solid green;
		height: 300px;
		border-radius: 20px;
		text-transform: uppercase; /*Optional*/
	}
	.Column1 {
		display: table-cell;
		text-align: center;
		border: 1px solid green;
		height: 500px;
		border-radius: 20px;
		text-transform: uppercase; /*Optional*/
	}
	.Column2 {
		display: table-cell;
		padding: 70px;
		font-size: 25px;
		border: 1px solid green;
		height: 400px;
		border-radius: 10px;
		/*Optional*/
	}
	.Column2 a {
		text-decoration: none;
		color: white;
	}
	.Column22 {
		display: table-cell;
		padding: 70px;
		font-size: 20px;
		text-align: center;
		border: 1px solid green;
		height: 400px;
		border-radius: 10px;
		/*Optional*/
	}
}

@media screen and (max-width: 600px) {
	.fa {
		padding: 20px;
		border-radius: 20px;
		font-size: 30px;
		width: 150px;
		text-align: center;
		text-decoration: none;
		margin: 5px 2px;
	}
	.fa:hover {
		opacity: 0.7;
	}
	.fa-facebook {
		background: #3B5998;
		color: white;
	}
	.fa-twitter {
		background: #55ACEE;
		color: white;
	}
	.fa-whatsapp {
		background: #0fa10f;
		color: white;
	}
	.fa-linkedin {
		background: #007bb5;
		color: white;
	}
	.fa-youtube {
		background: #bb0000;
		color: white;
	}
	.fa-instagram {
		background: #125688;
		color: white;
	}
	#slider {
		height: 350px;
	}
	.Row {
		display: table;
		width: 100%; /*Optional*/
		table-layout: fixed; /*Optional*/
		border-spacing: 10px; /*Optional*/
	}
	.Column {
		text-align: center;
		border: 1px solid green;
		height: 300px;
		border-radius: 20px;
		text-transform: uppercase; 
		margin-top:10px;
	}
	.Column1 {
		text-align: center;
		border: 1px solid green;
		height: 300px;
		border-radius: 20px;
		text-transform: uppercase; 
		margin-top:-10px;
		margin-bottom: 20px;
		
		
	}
	.Column2 {
		padding: 16px;
		font-size: 25px;
		border: 1px solid green;
		height: 400px;
		border-radius: 10px;
		margin-top:-10px;
		margin-bottom: 20px;
		/*Optional*/
	}
	.Column2 a {
		text-decoration: none;
		color: white;
	}
	.Column22 {
		padding: 10px;
		font-size: 20px;
		text-align: center;
		border: 1px solid green;
		height: 400px;
		border-radius: 10px;
		margin-top:-10px;
		margin-bottom: 20px;
		/*Optional*/
	}
}
</style>
</head>
<body>
	<%
			UserDao dao = new UserDao();
			List<School> list = dao.viewallschool();
			List<Medical> list2 = dao.viewMedical();
			List<Temple> list3 = dao.viewTemple();
			session.setAttribute("list", list);
			session.setAttribute("list2", list2);
			session.setAttribute("list3", list3);
			int number=1;
			int number2=1;
			int number3=1;
			int number6=1;
	%>
	<%
			UserDao dao1 = new UserDao();
			List<Post> list5 = dao1.viewPost();
			session.setAttribute("list5", list5);
			int number5=1;
	%>
	<%
		UserDao dao2 = new UserDao();
		List<Shop> list4 = dao2.viewShop();
		session.setAttribute("list4", list4);
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-secondary ">
	<a class="navbar-brand" href="#"><img src="images/logo.jpg"
		width="50px" height="50px"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active mx-5"><a class="nav-link text-white"
				href="#">Home</a></li>
			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="viewAllSchool.jsp">School</a></li>
			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="ViewAllMedical.jsp">Medical</a></li>
			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="viewAllTemple.jsp">Temple</a></li>
			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="contactus.jsp">Contact</a></li>
			<li class="nav-item mx-5"><a class="nav-link text-white"
				href="index.jsp">Login</a></li>
		</ul>
	</div>
	</nav>
	<div>
		<img alt="" src="images/c.jpg" width="100%" id="slider">
	</div>

	<div class="Row">
		<div class="Column">
			<h2>Institute</h2>
			<c:forEach items="${sessionScope.list}" var="l" begin="0" end="3">

				<h6 align="left" class="bg-primary p-2 text-white"><%=number++%>.
					<c:out value="${l.name}" />
				</h6>
				<h6 align="left" style="margin-left: 35px;">
					<c:out value="${l.type}" />

				</h6>
				<h6 align="left" style="margin-left: 35px;">
					<c:out value="${l.diwas}" />

				</h6>

			</c:forEach>
<h6 style="float:right;margin-right:8px;position: relative;bottom:-130px;"><a href="viewAllSchool.jsp">View All</a></h6>

		</div>
		<div class="Column">
			<h2>Temple</h2>
			<c:forEach items="${sessionScope.list3}" var="l" begin="0" end="3">

				<h6 align="left" class="bg-primary p-2 text-white"><%=number2++%>.
					<c:out value="${l.name}" />
				</h6>
				<h6 align="left" style="margin-left: 35px">
					<c:out value="${l.type}" />
				</h6>

			</c:forEach>
<h6 style="float:right;margin-right:8px;position: relative;bottom:-155px;"><a href="viewAllTemple.jsp">View All</a></h6>
			
		</div>
		<div class="Column">
			<h2>Medical</h2>
			<c:forEach items="${sessionScope.list2}" var="l" begin="0" end="3">

				<h6 align="left" class="bg-primary p-2 text-white"><%=number3++%>.
					<c:out value="${l.name}" />
				</h6>
				<h6 align="left" style="margin-left: 35px">
					<c:out value="${l.type}" />
				</h6>
				<h6 align="left" style="margin-left: 35px">
					<c:out value="${l.sthapana}" />
				</h6>
			</c:forEach>
			<h6 style="float:right;margin-right:8px;position: relative;bottom:-130px;"><a href="ViewAllMedical.jsp">View All</a></h6>
		</div>
	</div>

	<div class="Row">
		<div class="Column1">
			<h2>Shops Name</h2>

			<c:forEach items="${sessionScope.list4}" var="l" begin="0" end="5">
				<h6 align="left" class="bg-warning p-2"><%=number5++%>.
					<c:out value="${l.name}" />
				</h6>
				<h6 align="left" style="margin-left: 35px">
					<c:out value="${l.mobile}" />
				</h6>
			</c:forEach>
		</div>
		<div class="Column1">
			<h2>User Post</h2>
			<c:forEach items="${sessionScope.list5}" var="l" begin="0" end="5">
				<h6 align="left" class="bg-secondary text-white p-2"><%=number6++%>.
					<c:out value="${l.title}" />
				</h6>
				<h6 align="left" class="" style="font-size:15px;">
					<c:out value="${l.message}" />
				</h6>
				
			</c:forEach>
		</div>
	</div>
	<footer>
	<div class="Row">
		<div class="Column2 bg-warning">
			<h2 align="center">Contacts</h2>

			<table>
				<tr>
					<td>Police</td>
					<td>- 100</td>
				</tr>
				<tr>
					<td>Ambulance</td>
					<td>- 102</td>
				</tr>
				<tr>
					<td>Women Helpline</td>
					<td>- 181</td>
				</tr>

				<tr>
					<td>Fire brigade</td>
					<td>- 101</td>
				</tr>
				<tr>
					<td>Gas leakage</td>
					<td>- 1906</td>
				</tr>
				<tr>
					<td>Tourist Helpline</td>
					<td>- 1368</td>
				</tr>
				<tr>
					<td>Child Helpline</td>
					<td>- 1098</td>
				</tr>
				<tr>
					<td>Disaster management</td>
					<td>- 104</td>
				</tr>

			</table>

		</div>
		<div class="Column2 bg-secondary">
			<h2 align="center">Important Website</h2>
			<table class="text-center mx-5">
				<tr>
					<td><a href="https://uidai.gov.in" target="_blank">Aadhaar
							Card WebSite</a></td>
				</tr>
				<tr>
					<td><a href="https://register.eshram.gov.in/" target="_blank">e-Shram
							Card WebSite</a></td>
				</tr>

				<tr>
					<td><a href="https://nfsa.up.gov.in/Food/citizen/Default.aspx"
						target="_blank">Ration Card WebSite</a></td>
				</tr>
				<tr>
					<td><a href="https://pmkisan.gov.in/" target="_blank">PM-KISAN
							WebSite</a></td>
				</tr>
				<tr>
					<td><a href="https://enquiry.caneup.in/" target="_blank">Cane
							UP WebSite</a></td>
				</tr>
			</table>
		</div>
		<div class="Column22 bg-muted">
			<h2 align="center">
				Admin
				<hr>
			</h2>
			<a>Ravendra Kumar ||</a> <a>8052988047</a>
			<hr>
			<a href="https://www.facebook.com/kumar.ravendraa/" target="_blank"
				class="fa fa-facebook"></a> <a
				href="https://twitter.com/Ravendra4069796" target="_blank"
				class="fa fa-twitter"></a> <a href="https://wa.me/8052988047"
				target="_blank" class="fa fa-whatsapp"></a> <a
				href="https://www.linkedin.com/in/ravendra-kumar-077820185/"
				target="_blank" class="fa fa-linkedin"></a> <a
				href="https://www.youtube.com/channel/UCjMKOVfOnZcrINCPRIp-SJQ"
				target="_blank" class="fa fa-youtube"></a> <a
				href="https://www.instagram.com/kumar_ravendra7621/?hl=en"
				target="_blank" class="fa fa-instagram"></a>
		</div>
	</div>
	<marquee class="mb-3">---THIS WEBSITE DEVELOPED BY RAVENDRA---</marquee> </footer>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		var image = [ "images/c.jpg", "images/vill3.jpg" ];

		var num = 0;
		function next() {
			var slider = document.getElementById('slider');
			num++;
			if (num >= image.length) {
				num = 0;
			}
			slider.src = image[num];
		}
		function prev() {
			var slider = document.getElementById('slider');
			num--;
			if (num < 0) {
				num = image.length - 1;
			}
			slider.src = image[num];
		}
		setInterval(next, 2000);
	</script>
</body>
</html>