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
	
	String isList = "No";
	String from = "null";
	String to = "null";
	try{
		isList=request.getParameter("isList");
		from=request.getParameter("from");
		to=request.getParameter("to");
	}catch(Exception e){
		isList = "No";
	}
	
	%>
	<div class="wrapper">
		<%@include file="sidebar.jsp"%>

		<div class="main">
			<%@include file="../pages/navbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="card">
						<div class="card-header">
							<h5 class="card-title mb-0">View Attendance List</h5>
						</div>
						<div class="card-body">
							<!-- <div class="row">
									<h5 class="ms-1">Enter Date</h5>
								</div> -->
							<form action="attendanceList.jsp?id=4" method="post">
								<div class="row">
									<div class="col-sm-2">
									<h5 class="ms-1">From</h5>
									<input type="text" class="d-none form-control" name="isList" value="Yes">
										<input type="date" name="from"class="form-control" placeholder="Input">
									</div>
									
									<div class="col-sm-2">
									<h5 class="ms-1">To</h5>
									<input type="text" class="d-none form-control" name="isList" value="Yes">
										<input type="date" name="to"class="form-control" placeholder="Input">
									</div>
									
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary">Search</button>
									</div>

								</div>
							</form>

						</div>
					</div>



					<%
					
						if(isList.equals("Yes")){
							
							
					
					%>



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
											<th>Sr.No.</th>
											<th>Student Name</th>
											<th class="d-none d-sm-table-cell">Attendance</th>
											<th class="d-none d-sm-table-cell">Description</th>
											<th class="d-none d-sm-table-cell">Date</th>
											<!-- <th class="d-none d-md-table-cell">Assign Industry</th> -->
										</tr>
									</thead>
									<tbody>
										<%
										try {
											Connection con = Connector.getCon();
											String q = "select * from attendance where industryId='"+industry_id+"' and dates>='"+from+"' and dates<='"+to+"'";
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery(q);

											while (rs.next()) {
										%>
										<tr>

											<%
											
											try{
												String q1 = "select * from student where id='"+rs.getString("studentId")+"'";
												Statement st1 = con.createStatement();
												ResultSet rs1 = st1.executeQuery(q1);
												
												while (rs1.next()) {
											%>

											<td><%=rs1.getString(1)%></td>
											<td><%=rs1.getString(2)%></td>
											
											<%
											}
											}catch (Exception e) {

												e.printStackTrace();

												}
											%>
											<td class="d-none d-sm-table-cell"><%=rs.getString("status")%></td>
											
											<td class="d-none d-sm-table-cell"><%=rs.getString("description")%></td>
											<td class="d-none d-sm-table-cell"><%=rs.getString("dates")%></td>
											

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
					
					<%
						}
					%>

				</div>
			</main>

			<%@include file="../pages/footer.jsp"%>
		</div>
	</div>



	<%@include file="../pages/script.jsp"%>

</body>

</html>