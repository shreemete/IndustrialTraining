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
	String student_id = String.valueOf(session.getAttribute("student_id")); 
	
	
	%>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">


					<h1 class="h3 mb-3 text-center">
						<strong>Student Attendance List</strong>
					</h1>
					<br>
					<div class="row">
						<div class="col-12 col-lg-12 col-xxl-12 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th class=" d-sm-table-cell">Date</th>
											<th class=" d-sm-table-cell">Attendance</th>
											<th class="d-none d-sm-table-cell">Description</th>
											
											<!-- <th class="d-none d-md-table-cell">Assign Industry</th> -->
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select * from attendance where studentId='"+student_id+"'";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr>
											<td class=" d-sm-table-cell"><%=rs.getString("dates")%></td>
											
											<td class=" d-sm-table-cell"><%=rs.getString("status")%></td>
											
											<td class="d-none d-sm-table-cell"><%=rs.getString("description")%></td>
											
											

										</tr>
										<%
										}

										} catch (Exception e) {

										e.printStackTrace();

										}
										%>


									</tbody>
								</table>
							</div>
						</div>

					</div> 
					
					

				</div>
			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>



	<%@include file="../pages/script.jsp"%>

</body>

</html>