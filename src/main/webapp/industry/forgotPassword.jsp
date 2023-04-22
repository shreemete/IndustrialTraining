<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript">
		alert(Email Verified..);
	</script>
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
							<h1 class="h2">Create Password</h1>
							<!-- <p class="lead">Sign in to your account to continue</p> -->
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
								<%
									String email= String.valueOf(session.getAttribute("email"));
								%>
									<form action="../DAO/forgotPasswordDB.jsp" method="post"  name="myform" onsubmit="return validateform()">
										<input class="form-control d-none form-control-lg" type="email"
												name="email" value="<%=email%>" />
										<div class="mb-3">
										
											<label class="form-label">New Password</label> <input
												class="form-control form-control-lg" type="password"
												name="pass" placeholder="Enter your password" />
										</div>
										<div class="mb-3">
											<label class="form-label">Confirm Password</label> <input
												class="form-control form-control-lg" type="text"
												name="password" placeholder="Confirm password" />
										</div>
										<div class="text-center mt-3">
											<!-- <a href="" class="btn btn-lg btn-primary">Sign
												in</a> -->
												
											<button type="submit" class="btn btn-lg btn-primary">Submit</button> 
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

			var pass = document.myform.pass.value;

			var password = document.myform.password.value;
			

			if ((pass == null || pass == "")) {
				alert("Password Number can't be blank");
				return false;
			} else if ((password == null || password == "")) {
				alert("Confirm Password can't be blank");
				return false;
			}
			
			if (pass == password) {
				return true;
			} else {
				alert("Password and Confirm password must be same!");
				return false;
			}
		}
	</script>

</body>

</html>