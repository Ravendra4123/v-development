<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Account</title>
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
		float: left;
		width: 50%;
		padding: 100px;
		margin-left: -70px;
	}
	.image {
		float: right;
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
	input[type=submit]:hover {
		background-color: #45a049;
	}
	h2 {
		font-weight: 700;
		font-family: Arial, Helvetica, sans-serif;
	}
}

@media screen and (max-width: 600px) {
	body {
		background-color: lightblue;
	}
	img {
		width: 100%;
		height: 300px;
		border-radius: 20px;
	}
	.login {
		width: 100%;
	}
	.image {
		width: 100%;
		margin-top: 15px;
	}
	* {
		box-sizing: border-box;
	}
	input[type=text] {
		width: 100%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
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
	input[type=submit]:hover {
		background-color: #45a049;
	}
	h2 {
		font-weight: 700;
		font-family: Arial, Helvetica, sans-serif;
	}
}
</style>
</head>
<body class="container">
	<div class="image">
		<img src="images/vill1.jpg" id="slider" />
	</div>

	<div class="login">
		<h2 align="center">SignUp Page</h2>
		<form action="userRegistration" method="post">
			<input type="text" id="fname" name="name" placeholder="Name" required>
			<input type="text" id="fname" name="email" placeholder="Email" required>
			<input type="text" id="lname" name="password" placeholder="Password" required>

			<input type="submit" value="Submit">
		</form>
		<h5>
			Already User <a href="login">Log In</a>
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