<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
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

		if(session.getAttribute("email")==null){
			response.sendRedirect("../Sign-in-Industry.jsp");
		}

	
	
	String email = String.valueOf(session.getAttribute("email"));
	String industry_id = String.valueOf(session.getAttribute("industry_id"));
	%>
	<%
	try {
		Connection con = Connector.getCon();
		String q = "select * from industry where email='" + email + "' and  status='activated';";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(q);

		if (rs.next()) {
	%>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">


				<div class="container-fluid p-0">

					<h1 class="h3 mb-3 text-center">
						<strong>Industrial Training</strong>
					</h1>
					<br>

				</div>
			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>
<%@include file="../pages/script.jsp"%>

	<%
	} else {
	%>

	<div class="wrapper">
		<%@include file="../sidebar.jsp"%>

		<div class="main">
			<%@include file="../navbar.jsp"%>

			<main class="content">

				<div class="d-flex w-100">
					<div class="container d-flex flex-column">
						<div class="row " style="height: 70vh">
							<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
								<div class="d-table-cell align-middle">

									<!-- <div class="text-center mt-4">
													<h1 class="h2">Student Login</h1>
													<p class="lead">Sign in to your account to continue</p>
												</div> -->

									<div class="card">
										<div class="card-body text-center">
											<p class="lead" style="font-weight: 500">Industry is not
												activated yet..</p>
											<p>to activate industry check with college teacher</p>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>



			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>

	<%@include file="../pages/script.jsp"%>
	<%
	}

	} catch (Exception e) {

	e.printStackTrace();

	}
	%>

</body>

</html>