<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("errorMsg", "Please login first..");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container d-flex justify-content-center">
		<div class="p-4">
			<div class="card" style="width: 40rem;">
				<div class="card-body p-5">
					<h3 class="text-center">Add Contact</h3>
					<%
					String success = (String) session.getAttribute("successMsg");
					String error = (String) session.getAttribute("errorMsg");

					if (success != null) {
					%>
					<p class="text-success text-center"><%=success%></p>
					<%
					session.removeAttribute("successMsg");
					}

					if (error != null) {
					%>
					<p class="text-danger text-center"><%=error%></p>
					<%
					session.removeAttribute("errorMsg");
					}
					%>
					<form action="addContact" method="post">
						<%
						if (user != null) {
						%>
						<input type="hidden" name="userId" value=<%=user.getId()%>>
						<%
						}
						%>
						<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name"
								name="name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail2"
								aria-describedby="emailHelp" placeholder="Enter email"
								name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Phone Number</label> <input
								type="text" class="form-control" id="exampleInputPassword1"
								placeholder="Enter contact" name="contact">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">About</label>
							<textarea class="form-control" id="exampleInputPassword1"
								placeholder="Tell me more!" name="about"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Add Contact</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>