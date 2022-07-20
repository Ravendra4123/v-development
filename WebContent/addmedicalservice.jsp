<%@ include file="ProjectHeader.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
	

	<div class="row" style="padding-top: 40px;">
		<div class="col-lg-12">
			<!-- <h1 class="page-header">Widgets</h1> -->
		</div>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>Add Medical Services Here...</b>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" action="addMedicalServlet"method="post" enctype="multipart/form-data">
						<fieldset>
						
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Name</label>
								<div class="col-md-6">
									<input id="name" name="name" type="text"
										placeholder="Hospital / Medical / Doctor's..." class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Address </label>
								<div class="col-md-6">
									<input id="name" name="address" type="text"
										placeholder="Address..." class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Medical Process</label>
								<div class="col-md-6">
									<input id="name" name="process" type="text"
										placeholder="Direct / Parcha process" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Distance</label>
								<div class="col-md-6">
									<input id="name" name="distance" type="text" placeholder="Village to City Distance..."
										class="form-control">
								</div>
							</div>


							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Images</label>
								<div class="col-md-6">
									<input id="name" name="file" type="file" accept="image/png, image/gif, image/jpeg" placeholder="250.00"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">
									Contact Number</label>
								<div class="col-md-6">
									<input id="name" name="diwas" type="text" placeholder=""
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Type</label>
								<div class="col-md-4">
									<select name="type" class="form-control">
										<option>Doctor</option>
										<option>Hospital</option>
										<option>Clinic</option>
										<option>Medical</option>
									</select>
								</div>
							</div> 
							<!-- Form actions -->
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Add Details"
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
</div>