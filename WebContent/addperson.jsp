<%@ include file="ProjectHeader.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	

	<div class="row" style="padding-top: 40px;">
		<div class="col-lg-12">
			<!-- <h1 class="page-header">Widgets</h1> -->
		</div>
	</div>
	<!--/.row-->

	<%
		if (session.getAttribute("admin") == null) {
			response.sendRedirect("index.jsp");
		}
		
	%>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Persons Here...</b>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" action="addPersonServlet" method="post" enctype=multipart/form-data>
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Person
									Name</label>
								<div class="col-md-6">
									<input id="name" name="name" type="text"
										placeholder="Name..." class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Education</label>
								<div class="col-md-6">
									<input id="name" name="education" type="text"
										placeholder="Education..." class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Address</label>
								<div class="col-md-6">
									<input id="name" name="address" type="text"
										placeholder="Address..." class="form-control">
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Photo</label>
								<div class="col-md-6">
									<input id="name" name="file" type="file"
										accept="image/png, image/gif, image/jpeg" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name"> DOB</label>
								<div class="col-md-6">
									<input id="name" name="dob" type="date" placeholder=""
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Work
									Type</label>
								<div class="col-md-4">
									<select name="type" class="form-control">
										<option>Student</option>
										<option>Teacher</option>
										<option>Agriculture</option>
										<option>Others</option>
									</select>
								</div>
							</div>

							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Add Persons"
											class="btn btn-default btn-md pull-right">
									</div>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!--/.row-->
</div>
<!--/.main-->