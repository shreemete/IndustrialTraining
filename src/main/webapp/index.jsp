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
						<strong>Industrial</strong> Training
					</h1>
					<br>
					<div class="container text-center">
						<a  href="Sign-in-Industry.jsp" class="btn btn-primary">Industry
						
							Login</a>
						<a href="Sign-in-Teacher.jsp" class="btn btn-success">Teacher
							Login</a>
						<a href="Sign-in-Student.jsp" class="btn btn-info">Student Login</a>
					</div>
					<div class="container text-center p-2">
						<p>If you are unregistered student, then register <a href="form.jsp">here</a></p>						
					</div>

				</div>
			</main>

			<%@include file="pages/footer.jsp"%>
		</div>
	</div>

	<%@include file="pages/script.jsp"%>

</body>

</html>