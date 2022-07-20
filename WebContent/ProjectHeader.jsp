<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event - Dashboard</title>
<link href="css2/bootstrap-table.css" rel="stylesheet">
<link href="css2/bootstrap.min.css" rel="stylesheet">
<link href="css2/datepicker3.css" rel="stylesheet">
<link href="css2/styles.css" rel="stylesheet">
<style type="text/css">
body{
background-image:url("images/vill3.jpg");
}
</style>
<!--Icons-->
<script src="js2/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
<body>
	<%
		if (session.getAttribute("admin") == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="ProjectHeader.jsp"> <img
					alt="Logo" src="images/logo.jpg" width="70px" height="65px"></a>
				<center>
					<strong style="font-size: 22px; color: white;"><b>Village
							Development System</b></strong>
				</center>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><svg
								class="glyph stroked male-user">
								<use xlink:href="#stroked-male-user"></use></svg> Admin <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">

							<!-- <li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li> -->
							<li><a href="LogoutServlet"><svg
										class="glyph stroked cancel">
										<use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<table class="Responsive">
			<form role="search">
				<div id="search_manage"></div>
			</form>
		</table>
		<ul class="nav menu">
			<li><a href="addschool.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Add School</a></li>
			<li><a href="viewSchool.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View All School</a></li>

			<li><a href="addmedicalservice.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Add Medical Service</a></li>
			<li><a href="viewMedical.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View All Medical</a></li>
						
			<li><a href="addtemple.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Add Temple</a></li>
			<li><a href="viewTemple.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View All Temple</a></li>
						
			<li><a href="addshop.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Add Shop</a></li>
			<li><a href="viewShop.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View All Shop</a></li>
						
			<li><a href="addperson.jsp"><svg class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Add Persons</a></li>
			<li><a href="viewPerson.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View Persons</a></li>

			<li><a href="viewQuery.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>View Messages</a></li>
			
			<li><a href="welcome.jsp"><svg
						class="glyph stroked table">
						<use xlink:href="#stroked-table"></use></svg>Home Page</a></li>	
					
						
		</ul>
		<div class="row">
			<div class="attribution">
				Developed by <a href="http://ravirk.ultimatefreehost.in/Resume/"
					target="_blank">Ravendra Kumar</a><br />
			</div>
		</div>
	</div>
	<!--/.sidebar-->

	<!--/.sidebar-->

	<script src="js2/jquery-1.11.1.min.js"></script>
	<script src="js2/bootstrap.min.js"></script>
	<script src="js2/chart.min.js"></script>
	<script src="js2/chart-data.js"></script>
	<script src="js2/easypiechart.js"></script>
	<script src="js2/easypiechart-data.js"></script>
	<script src="js2/bootstrap-datepicker.js"></script>
	<script src="js2/bootstrap-table.js"></script>
	<script>
		$('#calendar').datepicker({});

		!function($) {
			$(document)
					.on(
							"click",
							"ul.nav li.parent > a > span.icon",
							function() {
								$(this).find('em:first').toggleClass(
										"glyphicon-minus");
							});
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function() {
			if ($(window).width() > 768)
				$('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function() {
			if ($(window).width() <= 767)
				$('#sidebar-collapse').collapse('hide')
		})
	</script>
</body>

</html>
