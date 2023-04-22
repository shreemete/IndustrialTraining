<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../pages/link.jsp"%>
<title>Industrial Training PLGPL</title>
</head>

<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("../Sign-in-Teacher.jsp");
	}
	%>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3 text-center">
						<strong>Add Industry</strong>
					</h1>
					<br>
					<div class="container ">

						<form action="../DAO/industryDB.jsp" name="myform" method="post"  onsubmit="return validateform()">

							<div class="card">
								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Industry Name</h3>
										</div>
										<div class="card-body">
											<input type="text" name="industry_name" class="form-control"
												 style="height: 50px;"
												placeholder="Industry Name" >
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Director Name</h3>
										</div>
										<div class="card-body">
											<input type="text" name="director_name" class="form-control"
												 style="height: 50px;"
												placeholder="Director Name" >
										</div>
									</div>
								</div>

								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Email</h3>
										</div>
										<div class="card-body">
											<input type="email" name="email" class="form-control"
												 style="height: 50px;"
												placeholder="Enter email" >
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Contact No.</h3>
										</div>
										<div class="card-body">
											<input type="text" name="mobile" class="form-control"
												 style="height: 50px;"
												placeholder="Enter Contact No." >
										</div>
									</div>
								</div>

								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header ">
											<h5 class="card-title text-dark mb-0">Address</h5>
										</div>
										<div class="card-body">
											<input type="text" name="address" class="form-control"
												 style="height: 50px;"
												placeholder="Enter Address"  />
										</div>
									</div>

								</div>

								<div class="row m-5 mt-3 ">
									<div class="container text-end">
										<button type="submit" class="btn btn-primary btn-lg">Submit</button>
									</div>
								</div>

							</div>

						</form>
					</div>


				</div>
			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>

	<%@include file="../pages/script.jsp"%>
	<script>
		function validateform() {

			var industry_name = document.myform.industry_name.value;

			var director_name = document.myform.director_name.value;
			var email = document.myform.email.value;

			var mobile = document.myform.mobile.value;
			var address = document.myform.address.value;

			if ((industry_name == null || industry_name == "")) {
				alert("Industry Name can't be blank");
				return false;
			} else if ((director_name == null || director_name == "")) {
				alert("Director Name can't be blank");
				return false;
			} else if ((email == null || email == "")) {
				alert("Email can't be blank");
				return false;
			} else if ((mobile == null || mobile == "")) {
				alert("Mobile Number can't be blank");
				return false;
			} else if ((address == null || address == "")) {
				alert("Address can't be blank");
				return false;
			}
		}
	</script>

</body>

</html>