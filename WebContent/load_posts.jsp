<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Post"%>
<%@page import="java.util.*"%>
<div class="row">

	<%
		UserDao dao = new UserDao();
		int cid=Integer.parseInt(request.getParameter("cid"));
		List<Post> posts=null;
		if(cid==0){
			posts=dao.viewPost();
		}else{
			posts=dao.getPostByCatId(cid);
		}
		for (Post p : posts) {
	%>
	
	<div class="col-md-6">
		<div class="card">
		<img class="card-img-top" src="images/Simage/<%=p.getImage() %>" alt="image" height="250px">
			<div class="card-body">
			<b><%=p.getTitle() %></b>
			<p><%=p.getMessage() %></p>
			<p><%=p.getPdate() %></p>
			</div>
		
		</div>
	</div>
	
	<%
		}
	%>
</div>
