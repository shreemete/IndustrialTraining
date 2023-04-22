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

	if (session.getAttribute("email") == null) {
		response.sendRedirect("../Sign-in-Industry.jsp");
	}

	String email = String.valueOf(session.getAttribute("email"));
	String industry_id = String.valueOf(session.getAttribute("industry_id"));
	String student_id = request.getParameter("std_id");
	%>
	<%
	try {
		Connection con = Connector.getCon();
		String q = "select * from student where id='" + student_id + "';";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(q);

		if (rs.next()) {
	%>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">


				<div class="container p-0">

					<h1 class="h3 mb-3 text-center">
						<strong>Daily Work</strong>
					</h1>
					<h1 class="h3 mb-3 ">
						Student Name : <strong><%=rs.getString(2)%></strong>
					</h1>
					<br>
					<%
					try {

						String q1 = "select * from dailywork where studentId='" + student_id + "' order by date desc;";
						Statement st1 = con.createStatement();
						ResultSet rs1 = st1.executeQuery(q1);

						while (rs1.next()) {
					%>
					<div class="card " style="border: 2px solid #ddd;">
						<div class="card-body">
							<h5 class="card-title text-end mb-0">Date : <%=rs1.getString("date") %></h5>
							<div class="row">
								<div class="col-md-1 ps-3">
									<img alt="doc" src="../assets/img/icons/google-docs.png"
										style="width: 50px">
								</div>
								<div class="col-md-11">
									<h5 class="card-title text-start mb-0">
										Documents : <span> <a
											href="../assets/dailywork/<%=rs1.getString("docFile") %>" download>
												Doc file</a>
										</span>
									</h5>
									<h6 class="card-title text-start mb-0">Description :
										<%=rs1.getString("description") %></h6>
								</div>
							</div>
						</div>
					</div>

					<%
					}
					} catch (Exception e) {

					e.printStackTrace();

					}
					%>
				</div>
			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>
	<%@include file="../pages/script.jsp"%>

	<%
	}
	%>
	<%@include file="../pages/script.jsp"%>
	<%
	} catch (Exception e) {

	e.printStackTrace();

	}
	%>

</body>

</html>