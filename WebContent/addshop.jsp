
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
					<b>Add Shop Here...</b>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" action="addShopServlet" method="post" enctype="multipart/form-data">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Name</label>
								<div class="col-md-6">
									<input id="name" name="name" type="text"
										placeholder="Shop Name"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Mobile
									</label>
								<div class="col-md-6">
									<input id="name" name="contact" type="text"
										placeholder="Contact Number" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Image
									</label>
								<div class="col-md-6">
									<input id="name" name="file" type="file" accept="image/png, image/gif, image/jpeg" class="form-control">
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
	<!--/.row-->
</div>
<!--/.main-->