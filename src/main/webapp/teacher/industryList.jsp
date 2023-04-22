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
						<strong>Industry List</strong>
					</h1>
					<br>
					<div class="row">
						<div class="col-12 col-lg-12 col-xxl-12 d-flex">
							<div class="card flex-fill">
								<!-- <div class="card-header">

									<h5 class="card-title mb-0">Industry List</h5>
								</div> -->
								<table class="table table-hover my-0">
									<thead>
										<tr><th>ID</th>
											<th>Indusrty Name</th>
											<th class="d-none d-md-table-cell">Director Name</th>
											<th>Email</th>
											<th>Contact No.</th>
											<th class="d-none d-xl-table-cell">Address</th>
											<th class="d-none d-sm-table-cell">Status</th>
											<th class="d-none d-md-table-cell">Edit</th>
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select * from industry;";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr><td><%=rs.getString(1) %></td>
											<td><%=rs.getString(2) %></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(3) %></td>
											<td><%=rs.getString(4) %></td>
											<td><%=rs.getString(5) %></td>
											<td class="d-none d-xl-table-cell"><%=rs.getString(6) %></td>
											<td class="d-none d-sm-table-cell">
											<%
												if(!rs.getString(8).equals("activated")){
											%>
												<form action="../DAO/activateIndustry.jsp" method="post">
												<input class="d-none" name="id" value="<%=rs.getString(1)%>"/>
												<input class="d-none" name="status" value="activated"/>
												<button type="submit" id="btn-activated"
													 class="btn btn-danger">Not
													Activated</button>
													
												</form>
											<%
												}else{
											%>
											<form action="../DAO/activateIndustry.jsp" method="post">
											<input class="d-none" name="id" value="<%=rs.getString(1)%>"/>
											<input class="d-none" name="status" value="Deactivated"/>
											<button type="submit" id="btn-activated"
													 class="btn btn-success">
													Activated</button>
											</form>
											<%
												}	
											%>
											</td>
											<td class="d-none d-md-table-cell"><a><i
													class="align-middle me-2" data-feather="external-link"></i></a></td>
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