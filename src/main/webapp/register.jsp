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

	<div class="container d-flex justify-content-center">
		<div class="p-4">
			<div class="card" style="width: 40rem;">
				<div class="card-body p-5">
					<h3 class="text-center">Register</h3>
					
					<%
					String success = (String)session.getAttribute("successMsg");
					String error = (String)session.getAttribute("errorMsg");
					
					if (success != null) {
					%>
					<p class="text-success text-center"><%=success%></p>
					<%
					session.removeAttribute("successMsg");
					}
					
					if(error != null) {
						%>
						<p class="text-danger text-center"><%=error%></p>
						<%
						session.removeAttribute("errorMsg");
					}
					%>
					<form action="register" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Name</label> <input type="text"
								class="form-control" name="name" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" name="email"
								id="exampleInputEmail2" aria-describedby="emailHelp"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="password"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-primary">Register</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>