<%@page import="com.dao.UserDao"%>
<%@page import="com.model.School"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="ProjectHeader.jsp"%>


<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

	<div class="row" style="padding-top: 40px;">
		<div class="col-lg-12">
			<!-- <h1 class="page-header">Widgets</h1> -->
		</div>
	</div>
	<%
		UserDao dao = new UserDao();
		List<School> list = dao.viewallschool();
		session.setAttribute("list", list);		
	%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><b>Institute are Here...</b></div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Sr.No</th>

								<th data-field="id1" data-sortable="true">Institute Name</th>
								<th data-field="id2" data-sortable="true">Institute Address</th>
								<th data-field="id3" data-sortable="true">Website</th>
								<th data-field="id4" data-sortable="true">Images</th>
								<th data-field="id5" data-sortable="true">Contact Number</th>
								<th data-field="id6" data-sortable="true">Institute Type</th>
								<th data-field="id7" data-sortable="true">Added Date</th>
								<th data-field="id8" data-sortable="true">Update</th>
								<th data-field="id9" data-sortable="true">Delete</th>

							</tr>
						</thead>
						<c:forEach items="${sessionScope.list}" var="l">
							<tr>
								<center><td data-field="id" data-sortable="true"><c:out
										value="${l.sid} " /></td></center>
								<center><td data-field="id1" data-sortable="true"><center><c:out
										value="${l.name}" /></center></td></center>
								<td data-field="id2" data-sortable="true"><center><c:out
										value="${l.address} " /></center></td>
								<td data-field="id3" data-sortable="true"><center><c:out
										value="${l.process} " /></center></td>
								<td data-field="id4" data-sortable="true">
								<img src="images/Simage/${l.images}" width="70px" height="70px"></center></td>
								<td data-field="id5" data-sortable="true"><center><c:out
										value="${l.diwas} " /></center></td>
								<td data-field="id6" data-sortable="true"><center><c:out
										value="${l.type}" /></center></td>
								<td data-field="id7" data-sortable="true"><center><c:out
										value="${l.date} " /></center></td>
								<td><center><a href="updateSchool?sid=${l.sid}" style="color: blue;">Update</a></center></td>
								<td><center><a href="deleteSchool?sid=${l.sid}" style="color: blue;">Delete</a></center></td>

							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--/.row-->
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default"></div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">



				<script>
					$(function() {
						$('#hover, #striped, #condensed')
								.click(
										function() {
											var classes = 'table';

											if ($('#hover').prop('checked')) {
												classes += ' table-hover';
											}
											if ($('#condensed').prop('checked')) {
												classes += ' table-condensed';
											}
											$('#table-style')
													.bootstrapTable('destroy')
													.bootstrapTable(
															{
																classes : classes,
																striped : $(
																		'#striped')
																		.prop(
																				'checked')
															});
										});
					});

					function rowStyle(row, index) {
						var classes = [ 'active', 'success', 'info', 'warning',
								'danger' ];

						if (index % 2 === 0 && index / 2 < classes.length) {
							return {
								classes : classes[index / 2]
							};
						}
						return {};
					}
				</script>
			</div>
		</div>
	</div>
	<!--/.row-->


</div>
<!--/.main-->
</body>
</html>
