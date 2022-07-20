<%@ include file="ProjectHeader.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"><svg class="glyph stroked home">
						<use xlink:href="#stroked-home"></use></svg></a></li>
			<li class="active">Home</li>
		</ol>
	</div>
	<!--/.row-->

	<div class="row" style="padding-top: 20px;">
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
					<b>Update Institute Here...</b>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" action="updateSchool" method="post" enctype="multipart/form-data">
						<fieldset>
							<!-- Name input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Institute Name</label>
								<div class="col-md-6">
									<input id="name" name="name" type="text" value="${list.name }"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Institute
									Address </label>
								<div class="col-md-6">
									<input id="name" name="address" type="text" value="${list.address}" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Admission
									Process</label>
								<div class="col-md-6">
									<input id="name" name="process" type="text" value="${list.process}" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Institute
									Images</label>
								<div class="col-md-6">
									<input id="name" name="file" type="file" required accept="image/png, image/gif, image/jpeg" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">
									Sthapana Diwas</label>
								<div class="col-md-6">
									<input id="name" name="diwas" type="date" value="${list.diwas }"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="name">Institute
									Type</label>
								<div class="col-md-4">
									<select name="type" class="form-control">
										<option>School</option>
										<option>College</option>
										<option>Coaching</option>
										<option>Home tutor</option>
									</select>
								</div>
							</div>
							<div class="col-sm-04"></div>
							<div class="col-sm-04">
								<div class="form-group">
									<div class="col-md-6 widget-right">
										<input type="submit" value="Update Details"class="btn btn-default btn-md pull-right">
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