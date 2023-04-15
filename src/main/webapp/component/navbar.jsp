<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-phone-volume mr-1"></i>PB</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
			<a class="nav-link" href="index.jsp">
					<i class="fa-solid fa-house mr-1"></i>Home
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="addContact.jsp"> <i class="fa-solid fa-plus mr-1"></i>Add
					Phone Number
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="viewContact.jsp"> <i class="fa-regular fa-eye mr-1"></i>View
					Contact
			</a></li>
		</ul>
		<%
		User user = (User) session.getAttribute("user");

		if (user == null) {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-user mr-1"></i>Login</a> <a href="register.jsp"
				class="btn btn-danger ml-2">Register</a>
		</form>
		<%
		} else {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="#" class="btn btn-success"><i
				class="fa-solid fa-user mr-1"></i><%=user.getName()%></a> <a
				data-toggle="modal" data-target="#exampleModalCenter"
				class="btn btn-danger ml-2 text-white">Logout</a>
		</form>
		<%
		}
		%>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <h5 class="modal-title" id="exampleModalLongTitle">Are you sure?</h5> -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>Are you sure?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<a type="button" href="logout" class="btn btn-primary">Yes,
						logout</a>
				</div>
			</div>
		</div>
	</div>
</nav>