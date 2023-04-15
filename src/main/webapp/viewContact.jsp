<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.doa.ContactDAO"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
<style>
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("errorMsg", "Please login first..");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container">
		<div class="row p-4">
			<%
			if (user != null) {
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				List<Contact> contacts = dao.getAllContact(user.getId());

				for (Contact c : contacts) {
			%>
			<div class="col-md-3 pt-2">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							Name:
							<%=c.getName()%>
						</h5>
						<p>
							Ph no.:
							<%=c.getPhno()%>
						</p>
						<p>
							Email:
							<%=c.getEmail()%>
						</p>
						<p>
							About:
							<%=c.getAbout()%>
						</p>
						<div class="text-center">
							<a class="btn btn-success btn-sm text-white">Edit</a> <a
								class="btn btn-danger btn-sm text-white">delete</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>
		</div>
	</div>


	<%@include file="component/footer.jsp"%>
</body>
</html>