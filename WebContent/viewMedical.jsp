<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Medical"%>
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
		List<Medical> list1 = dao.viewMedical();
		session.setAttribute("list1", list1);		
	%>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><b>Medical Services are Here...</b></div>
				<div class="panel-body">
					<table data-toggle="table" data-url="tables/data1.json"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-search="true"
						data-select-item-name="toolbar1" data-pagination="true"
						data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true">Sr.No</th>

								<th data-field="id1" data-sortable="true">Medical Name</th>
								<th data-field="id2" data-sortable="true">Address</th>
								<th data-field="id3" data-sortable="true">Process</th>
								<th data-field="id4" data-sortable="true">Distance</th>
								<th data-field="id5" data-sortable="true">Images</th>
								<th data-field="id6" data-sortable="true">Contact Number</th>
								<th data-field="id7" data-sortable="true">Institute Type</th>
								<th data-field="id8" data-sortable="true">Added Date</th>
								<th data-field="id9" data-sortable="true">Update</th>
								<th data-field="id10" data-sortable="true">Delete</th>

							</tr>
						</thead>
						<c:forEach items="${sessionScope.list1}" var="l">
							<tr>
								<td data-field="id" data-sortable="true"><c:out value="${l.mid} " /></td>
								<td data-field="id1" data-sortable="true"><c:out value="${l.name}" /></td>
								<td data-field="id2" data-sortable="true"><c:out value="${l.address} " /></td>
								<td data-field="id3" data-sortable="true"><c:out value="${l.process} " /></td>
								<td data-field="id4" data-sortable="true"><c:out value="${l.distance} " /></td>
								<td data-field="id5" data-sortable="true"><img src="images/Simage/${l.images}" width="70px" height="70px"></td>
								<td data-field="id6" data-sortable="true"><c:out value="${l.sthapana}" /></td>
								<td data-field="id7" data-sortable="true"><c:out value="${l.type}" /></td>
								<td data-field="id8" data-sortable="true"><c:out value="${l.date} " /></td>
								<td><a href="updateMedical?mid=${l.mid}" style="color: blue;">Update</a></td>
								<td><a href="deleteMedical?mid=${l.mid}" style="color: blue;">Delete</a></td>

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
