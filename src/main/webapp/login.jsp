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
			<div class="card" style="width: 30rem;">
				<div class="card-body p-5">
				<h3 class="text-center">Log in</h3>
				<%
					String error = (String)session.getAttribute("errorMsg");
				
					if(error != null) {
					%>
					<p class="text-center text-danger"><%= error %> </p>
					<%
					session.removeAttribute("errorMsg");
					}
				%>
				<%
					String log = (String)session.getAttribute("logMsg");
				
					if(log != null) {
					%>
					<p class="text-center text-success"><%= log %> </p>
					<%
					session.removeAttribute("logMsg");
					}
				%>
					<form action="login" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail2"
								aria-describedby="emailHelp" placeholder="Enter email" name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" name="password">
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp" %>
</body>
</html>