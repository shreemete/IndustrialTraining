<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="link.jsp"%>
<title>Industrial Training PLGPL</title>
</head>

<body>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="navbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3 text-center">
						<strong>Registration</strong> Form
					</h1>
					<br>
					<div class="container ">
						<!-- <h3 >Student Registration Form</h3> -->

						<!-- <div class="mb-3">
							<h1 class="h3 d-inline align-middle">Form</h1>
						</div> -->
						<form action="DAO/formDb.jsp" name="myform" method="post"
							onsubmit="return validateform()">

							<div class="card">
								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Full Name*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="stud_name" class="form-control"
												style="height: 50px;" placeholder="Eneter Name">
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Email*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="stud_email" class="form-control"
												style="height: 50px;" placeholder="Enter Email">
										</div>
									</div>
								</div>

								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Mobile No.*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="stud_mob" class="form-control"
												style="height: 50px;" placeholder="Enter Mobile No.">
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Address*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="address" class="form-control"
												style="height: 50px;" placeholder="Enter Address">
										</div>
									</div>
								</div>

								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header ">
											<h5 class="card-title text-dark mb-0">Date Of Birth*</h5>
										</div>
										<div class="card-body">
											<input type="date" name="stud_dob" class="form-control"
												style="height: 50px;" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header ">
											<h5 class="card-title text-dark mb-0">Branch*</h5>
										</div>
										<div class="card-body">
											<select class="form-select mb-3" name="stud_branch"
												style="height: 50px;">
												<option selected>Select</option>
												<option>Computer Science</option>
												<option>Information Technology</option>
												<option>Other</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header ">
											<h5 class="card-title text-dark mb-0">Current Year*</h5>
										</div>
										<div class="card-body">
											<select class="form-select mb-3" name="stud_curr_year"
												style="height: 50px;">
												<option>Select</option>
												<option>First</option>
												<option>Second</option>
												<option>Third</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header ">
											<h5 class="card-title text-dark mb-0">Academic Year*</h5>
										</div>
										<div class="card-body">
											<select class="form-select mb-3" name="stud_academic_year"
												style="height: 50px;">
												<option>Select</option>
												<option>2023</option>
												<option>2024</option>
												<option>2025</option>
											</select>
										</div>
									</div>
								</div>

								<div class="row m-2">
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Password*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="stud_pass" class="form-control"
												style="height: 50px;" placeholder="Enter Password">
										</div>
									</div>
									<div class="col-md-6">
										<div class="card-header">
											<h3 class="card-title text-dark mb-0">Confirm Password*</h3>
										</div>
										<div class="card-body">
											<input type="text" name="conf_pass" class="form-control"
												style="height: 50px;" placeholder="Confirm Password">
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

			<%@include file="pages/footer.jsp"%>
		</div>
	</div>

	<%@include file="pages/script.jsp"%>
	<script>
		function validateform() {
			var stud_name = document.myform.stud_name.value;
			var stud_email = document.myform.stud_email.value;

			var stud_mob = document.myform.stud_mob.value;
			var address = document.myform.address.value;

			var stud_dob = document.myform.stud_dob.value;
			var stud_branch = document.myform.stud_branch.value;

			var stud_curr_year = document.myform.stud_curr_year.value;
			var stud_academic_year = document.myform.stud_academic_year.value;

			var stud_pass = document.myform.stud_pass.value;
			var conf_pass = document.myform.conf_pass.value;

			if ((stud_name == null || stud_name == "")) {
				alert("Name can't be blank");
				return false;
			} else if ((stud_email == null || stud_email == "")) {
				alert("Email can't be blank");
				return false;
			} else if ((stud_mob == null || stud_mob == "")) {
				alert("Mobile Number can't be blank");
				return false;
			} else if ((address == null || address == "")) {
				alert("Address can't be blank");
				return false;
			} else if ((stud_dob == null || stud_dob == "")) {
				alert("Date of birth can't be blank");
				return false;
			} else if ((stud_branch == null || stud_branch == "")) {
				alert("Branch can't be blank");
				return false;
			} else if ((stud_curr_year == null || stud_curr_year == "")) {
				alert("Current Year can't be blank");
				return false;
			} else if ((stud_academic_year == null || stud_academic_year == "")) {
				alert("Academic year can't be blank");
				return false;
			} else if ((stud_pass == null || stud_pass == "")) {
				alert("Password can't be blank");
				return false;
			} else if ((conf_pass == null || conf_pass == "")) {
				alert("Confirm password can't be blank");
				return false;
			}

			if (stud_pass == conf_pass) {
				return true;
			} else {
				alert("Password and Confirm password must be same!");
				return false;
			}
		}
	</script>

</body>

</html>