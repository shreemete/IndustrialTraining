<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
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
											<th class="d-none d-xl-table-cell">Email and Mobile No.</th>
											
											
											<th class=" d-sm-table-cell">Attendance</th>
											<th class="d-none d-sm-table-cell">Description</th>
											<th class="d-none d-sm-table-cell">Action</th>
											<!-- <th class="d-none d-sm-table-cell">Address</th> -->
											<!-- <th class="d-none d-md-table-cell">Assign Industry</th> -->
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select * from student where industry="+industry_id+"";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr>


											<td><%=rs.getString(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td class="d-none d-xl-table-cell"><%=rs.getString(3)%> <br> <%=rs.getString(4)%> </td>
											
											<%
											LocalDate date = LocalDate.now();
											String q1 = "select * from attendance where studentId="+rs.getString(1)+" and dates='"+date+"' ;";
											Statement st1 = con.createStatement();
											ResultSet rs1 = st1.executeQuery(q1);
											if(rs1.next()){
												
											%>
											
												<td class=" d-sm-table-cell"><%=rs1.getString("status") %>
												</td>
												<td class="d-none d-sm-table-cell"><%=rs1.getString("description") %>

												</td>
												<td class="d-none d-sm-table-cell">
													<button type="submit" style="width: 100px;"
													class="btn btn-success" disabled="disabled">Submited</button>
												</td>
											
											
											<%}else{ %>
											<form action="DB/addAttendance.jsp" method="post">
												
												<td class=" d-sm-table-cell">
												<input class="d-none form-control" type="text"name="student_id" value="<%=rs.getString(1)%>" />
												<select name="status"
													class="form-select mb-3">
														<option value="" selected="">Select</option>
														<option value="Present">Present</option>
														<option value="Absent">Absent</option>
														<option value="Holiday">Holiday</option>
												</select>
												
												</td>
												<td class="d-none d-sm-table-cell">
												
												<input class="form-control" type="text"name="desc" placeholder="Enter"/>

												</td>
												<td class="d-none d-sm-table-cell">
													<button type="submit" style="width: 100px;"
													class="btn btn-success">Submit</button>
												</td>
												
											</form>
											<%} %>

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