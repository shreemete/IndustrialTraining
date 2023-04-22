<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../pages/link.jsp"%>
<title>Industrial Training PLGPL</title>


<style type="text/css">
#lblimg {
	position: relative;
	z-index: 1;
}

#file {
	position: absolute;
	left: 28%;
	z-index: 2;
	opacity: 0;
	width: 46%;
}
</style>

</head>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

if (session.getAttribute("email") == null) {
	response.sendRedirect("../Sign-in-Student.jsp");
}

String email = String.valueOf(session.getAttribute("email"));
String student_id = String.valueOf(session.getAttribute("student_id"));
%>
<body>
	<%
	try {
		Connection con = Connector.getCon();
		String q = "select * from student where email='" + email + "' and industry is not null;";
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

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Profile</h1>

					</div>
					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Details</h5>
								</div>
								<div class="card-body text-center">
								
								<%
										/* int id = Integer.parseInt(request.getParameter("stud_id")); */

										/* String email = request.getParameter("email"); */

										try {

											String sq = "select * from student where profile is not null";
											Statement stm = con.createStatement();
											ResultSet r1 = stm.executeQuery(sq);
											if (r1.next()) {
												/* out.print(r1.getString("profile")); */
										%>
										<img src="../assets/profile/<%=student_id %>/<%=r1.getString("profile") %>" alt="Christina Mason"
										class="img-fluid rounded-circle mb-2" width="128" height="128" />
										<%
										

										} else {
										%>

										<img src="../assets/img/avatars/user.png" alt="Christina Mason"
										class="img-fluid rounded-circle mb-2" width="128" height="128" />

										<%
										}
										} catch (Exception e) {
										e.printStackTrace();

										}
										%>

								
								
									

									<div class="mb-2">

										<!-- Button trigger modal -->
										<a type="button" data-bs-toggle="modal"
											data-bs-target="#exampleModal"> <i
											class="align-middle me-2" data-feather="camera"></i><span
											class="align-middle">Choose Photo</span></a>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Choose Profile</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form action="DB/updateProfile.jsp" method="post"
														enctype="multipart/form-data">
														<div class="modal-body">
															<input class="form-control form-control-lg" type="file"
																name="profile" />
														</div>
														<div class="modal-footer">

															<button type="submit" class="btn btn-primary">Save
																changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>


									</div>
									<h5 class="card-title mb-0"><%=rs.getString(2)%></h5>
									<div class="text-muted mb-2"><%=rs.getString(3)%></div>

									<div class="container mb-0">

										<h5 class="card-title mb-0 "><%=rs.getString(7)%></h5>
										<h5 class=" mb-0" style="color: #777"><%=rs.getString(8)%>
											Year
										</h5>

									</div>

								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Skills</h5>
									<div class="container">





										<%
										/* int id = Integer.parseInt(request.getParameter("stud_id")); */

										/* String email = request.getParameter("email"); */

										try {

											String sql = "select * from studentSkills where email='" + email + "'";
											Statement stmt = con.createStatement();
											ResultSet rs1 = stmt.executeQuery(sql);
											if (rs1.next()) {
												String skills = rs1.getString(2);

												String[] arrOfStr = skills.split(",");

												for (int i = 0; i < arrOfStr.length; i++) {
										%>
										<p class=" badge bg-primary me-1 my-1"><%=arrOfStr[i]%></p>
										<%
										}

										} else {
										%>

										<h5>No Skills Added</h5>

										<%
										}
										} catch (Exception e) {
										e.printStackTrace();

										}
										%>







										<!-- <p  class=" badge bg-primary me-1 my-1">HTML</p>  -->
									</div>
									<div class="container text-end">



										<!-- Button trigger modal -->
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#staticBackdrop">
											<span data-feather="plus"></span>
										</button>

										<!-- Modal -->
										<div class="modal fade" id="staticBackdrop"
											data-bs-backdrop="static" data-bs-keyboard="false"
											tabindex="-1" aria-labelledby="staticBackdropLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="staticBackdropLabel">Modal
															title</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<form action="DB/skillsDocDB.jsp?email=<%=email%>&&id=1"
														method="post">
														<div class="modal-body">

															<div class="mb-3">

																<label class="form-label">Add Skills</label> <input
																	class="form-control form-control-lg" type="text"
																	name="skills"
																	placeholder="Add Skills (like C,C++,HTML,Java)" />
															</div>

														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">ADD</button>
														</div>
													</form>
												</div>
											</div>
										</div>








									</div>
								</div>
								<hr class="my-0" />

								<%
								try {

									String ql = "select * from industry where id='" + rs.getString(11) + "'";
									Statement s = con.createStatement();
									ResultSet r = s.executeQuery(ql);
									if (r.next()) {
										String industry_name = r.getString(2);
								%>

								<div class="card-body">
									<h5 class="h6 card-title">About</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="home"
											class="feather-sm me-1"></span> Lives in <a href="#"><%=rs.getString(5)%></a>
										</li>

										<li class="mb-1"><span data-feather="briefcase"
											class="feather-sm me-1"></span> Works at <a href="#"> <%=industry_name%>
										</a></li>
										<!-- <li class="mb-1"><span data-feather="map-pin"
											class="feather-sm me-1"></span> From <a href="#">Boston</a></li> -->
									</ul>
								</div>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
								<hr class="my-0" />

							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">

									<h5 class="card-title mb-0">Daily work</h5>
									<hr />
								</div>

								<div class="card-body mt-0" style="min-height: 400px">

									<div class="container mb-0">

										<form action="DB/updateDoc.jsp" method="post"
											enctype="multipart/form-data" name="myform" onsubmit="return validateform()">


											<div class="row mb-0">
												<div class="col-md-7 col-lg-9">

													<input class="form-control form-control-lg" type="file"
														name="work" />
												</div>
												<div class="col-md-7 col-lg-9">
													<br>
													<textarea class="form-control form-control-lg" name="desc"
														placeholder="Description"></textarea>
												</div>
												<div class="col-md-5 col-lg-3">
													<button type="submit" class="btn btn-primary">Add
														Daily Work</button>
												</div>
											</div>
										</form>
									</div>

									<div class="container text-end">

										<br>
										<hr />
										<h4 class="text-start" style="color: #555;">
											<strong> Daily Work</strong>
										</h4>

										<%
										try {

											String sql1 = "select * from dailywork where studentId='" + student_id + "' order by workId asc, date desc";
											Statement stmt1 = con.createStatement();
											ResultSet rs2 = stmt1.executeQuery(sql1);
											while (rs2.next()) {

												String fileName = rs2.getString("docFile");

												String arr[] = fileName.split("/");
												/* out.println(arr[0]); */
										%>

										<div class="card " style="border: 2px solid #ddd;">
											<div class="card-body">
												<h5 class="card-title mb-0">
													Date :
													<%=rs2.getString("date")%></h5>
												<h5 class="card-title text-start mb-0">
													Documents : <span> <a
														href="../assets/dailywork/<%=rs2.getString("docFile")%>"
														target="_blank"> <%=arr[1]%></a>
													</span>
												</h5>
												<h6 class="card-title text-start mb-0">
													Description :<%=rs2.getString("description")%>
												</h6>
											</div>
										</div>

										<%
										}
										} catch (Exception e) {
										e.printStackTrace();

										}
										%>
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
												assigned yet..</p>
											<p>to assign industry check with your college teacher</p>
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
	<%
	}

	} catch (Exception e) {

	e.printStackTrace();

	}
	%>

	<%@include file="../pages/script.jsp"%>

	<script type="text/javascript">
	function validateform() {
		var work = document.myform.work.value;
		var desc = document.myform.desc.value;

		
		if ((work == null || work == "")) {
			alert("Choose file");
			return false;
		} else if ((desc == null || desc == "")) {
			alert("Description can't be blank");
			return false;
		} 
	}
	</script>
</body>

</html>