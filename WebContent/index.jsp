<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
@media screen and (min-width: 992px) {
	body {
		margin-top: 130px;
		padding: 0;
		background-color: lightblue;
	}
	img {
		width: 100%;
		height: 500px;
		border-radius: 20px;
	}
	.login {
		float: right;
		width: 50%;
		padding: 100px;
	}
	.image {
		float: left;
		width: 50%;
	}
	* {
		box-sizing: border-box;
	}
	input[type=text] {
		width: 100%;
		padding: 12px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		margin-top: 6px;
		margin-bottom: 16px;
		margin-left: 30px;
		resize: vertical;
	}
	input[type=submit] {
		background-color: #04AA6D;
		color: white;
		padding: 12px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		margin-left: 30px;
	}
	input[type=submit]:hover {
		background-color: #45a049;
	}
	input[type=radio] {
		margin-left: 100px;
	}
	h2 {
		margin-left: 30px;
		font-weight: 700;
		font-family: Arial, Helvetica, sans-serif;
	}
	h5 {
		margin-left: 30px;
	}
}

@media screen and (max-width: 600px) {
	body {
		background-color: lightblue;
	}
	h2 {
		font-weight: 700;
		font-family: Arial, Helvetica, sans-serif;
	}
	.image {
		width: 100%;
		margin-top: 15px;
	}
	input[type=radio] {
		margin-left: 80px;
	}
	img {
		width: 100%;
		height: 300px;
		border-radius: 20px;
	}
	.login {
		width: 100%;
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
<body class="container">
	<div class="image">
		<img src="images/vill1.jpg" id="slider" />
	</div>

	<div class="login">
		<h2 align="center">Login Page</h2>
		<form action="loginServlet" method="post">
			<input type="radio" value="Admin" name="type">Admin <input
				type="radio" value="User" name="type">User <input
				type="text" id="fname" name="email" required placeholder="Email"> <input
				type="text" id="lname" name="password" required placeholder="Password">
			<input type="submit" value="Submit">
		</form>
		<h5>
			New Users <a href="registration">Sign Up</a>
		</h5>


	</div>
	<script type="text/javascript">
		var image = [ "images/vill1.jpg", "images/vill2.jpg" ];

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