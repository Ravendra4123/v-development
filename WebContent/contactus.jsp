<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Contact Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
@media screen and (max-width: 600px) {
	input[type=text],input[type=email],textarea {
	width:100%;
	border:1px solid black;
	border-raidus:10px;
		
	}
}
</style>

</head>
<body>
	<div class="container mt-3">
		<div class="text-center">
			<h2>Contact Us Page</h2>
		</div>
		<br>
		<form action="SendEmail" method="post">
			<table class="table ">
				<tr>
					<td>Name</td>
					<td><input type="text" required placeholder="Name" name="name"
						class="form-control"></td>
				</tr>

				<tr>
					<td>Email</td>
					<td><input type="email" required placeholder="Email"
						name="email" class="form-control"></td>
				</tr>
				<tr>
					<td>Subject</td>
					<td><input type="text" placeholder="Subject" name="subject"
						class="form-control"></td>
				</tr>
				<tr>
					<td>Message</td>
					<td><textarea name="message" rows="5" cols="100"
							placeholder="Your Message"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" id="submit" class="btn btn-primary"
						value="Submit"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>