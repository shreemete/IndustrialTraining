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
											<th class="d-none d-md-table-cell">Assign Industry</th>
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select * from student;";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr>


											<td><%=rs.getString(1)%></td>
											<td><%=rs.getString(2)%></td>
											<%
												String xyz = rs.getString(2);
											%>
											<td class="d-none d-sm-table-cell"><%=rs.getString(3)%></td>
											<td><%=rs.getString(4)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(7)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(8)%></td>
											<td class="d-none d-md-table-cell"><%=rs.getString(9)%></td>
											<td class="d-none d-xl-table-cell"><%=rs.getString(5)%></td>
											<td class="d-none d-md-table-cell">
												<!-- Button trigger modal -->
												<%
													if(rs.getString("industry")==null){
												%>
												
												<button type="button" data-id="ISBN564541" class="btn btn-primary"
													data-bs-toggle="modal" data-bs-target="#exampleModal<%=rs.getString(1)%>" onclick="getStudentId(<%=rs.getString(1)%>)">
													Assign</button>
													
													<%}
													else{
														
														String q2 = "select * from industry where id="+rs.getString("industry")+";";
														Statement st2 = con.createStatement();
														ResultSet rs2 = st2.executeQuery(q2);
														if(rs2.next()){
												%>
												
													<%=rs2.getString("name")%>
													
													<%} 
													}
												
												%>
													
													
												<div class="modal fade" id="exampleModal<%=rs.getString(1)%>" tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Assign
																	Industry</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<form action="../DAO/addIndustryToStudent.jsp?" method="post">
																<div class="modal-body">
																	<div class="card-header">
																		<h5 class="card-title mb-0">Industry List</h5>
																	</div>
																	<div class="card-body">
																	        <input type="hidden" class="" name="id" id="studentId<%=rs.getString(1)%>" value=""/>
																	
																	<%=xyz %>
																		<select  name="industry_name"class="form-select mb-3">
																			<option value="" selected>Selects</option>
																			<%
																			try {
																				String q1 = "select * from industry where status='activated';";
																				Statement st1 = con.createStatement();
																				ResultSet rs1 = st1.executeQuery(q1);
																				int ind =0;
																				while (rs1.next()) {
																					ind++;
																			%>

																			<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
																			<%
																			}

																			} catch (Exception e) {

																			e.printStackTrace();

																			}
																			%>
																		</select>

																	</div>
																</div>
																<div class="modal-footer">
																	<button type="submit" class="btn btn-primary">Submit</button>
																</div>
															</form>
														</div>
													</div>
												</div>

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
<script>
 function getStudentId(studentId){
	 document.getElementById("studentId"+studentId).value=studentId;
 }
</script>
</body>

</html>