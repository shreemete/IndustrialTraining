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
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3 text-center">
						<strong>Student List</strong>
					</h1>
					<br>
					<div class="row">
						<div class="col-12 col-lg-12 col-xxl-12 d-flex">
							<div class="card flex-fill">
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Sr.No.</th>
											<th>Student Name</th>
											<th class="d-none d-sm-table-cell">Email</th>
											<th>Mobile No.</th>
											<th class="d-none d-md-table-cell">Branch</th>
											<th class="d-none d-md-table-cell">Current Year</th>
											<th class="d-none d-md-table-cell">Academic Year</th>
											<th class="d-none d-xl-table-cell">Address</th>
											<th class="d-none d-xl-table-cell">Action</th>
											<!-- <th class="d-none d-md-table-cell">Assign Industry</th> -->
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select student.* from student inner join industry on student.industry=industry.id where student.industry='"+industry_id+"'";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr>


											<td><%=rs.getString(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td class="d-none d-sm-table-cell"><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(7)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(8)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(9)%></td>
											<td class="d-none d-xl-table-cell"><%=rs.getString(5)%></td>
											<td class="d-none d-xl-table-cell">
												<a class="btn btn-info" href="document.jsp?id=3&&std_id=<%=rs.getString(1)%>" style="width:100px;">Daily Work</a>
											</td>

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