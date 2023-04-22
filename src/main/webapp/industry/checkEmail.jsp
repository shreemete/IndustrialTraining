<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="../pages/link.jsp"%>
<title>Industrial Training PLGPL</title>
</head>

<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Verify Email</h1>
							<!-- <p class="lead">Sign in to your account to continue</p> -->
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form action="../DAO/checkEmailDB.jsp" method="post"  name="myform" onsubmit="return validateform()">
										<div class="mb-3">
											<label class="form-label">Email</label> <input
												class="form-control form-control-lg" type="email"
												name="email" placeholder="Enter your email" />
										</div>
										<!-- <div class="mb-3">
											<label class="form-label">New Password</label> <input
												class="form-control form-control-lg" type="password"
												name="password" placeholder="Enter your password" /> <small>
												<a href="#">Forgot password?</a>
												
											</small>
										</div> -->
										<div class="text-center mt-3">
											<!-- <a href="" class="btn btn-lg btn-primary">Sign
												in</a> -->
												
											<button type="submit" class="btn btn-lg btn-primary">Verify</button> 
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="js/app.js"></script>
	
	<script>
		function validateform() {

			var email = document.myform.email.value;

			/* var password = document.myform.password.value; */
			

			if ((email == null || email == "")) {
				alert("Email  can't be blank");
				return false;
			} /* else if ((password == null || password == "")) {
				alert("Mobile Number can't be blank");
				return false;
			} */ 
		}
	</script>

</body>

</html>