<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="index.html"> <span
			class="align-middle"><h1
					class="h3 mb-0 text-light text-center">
					<strong>Industrial</strong> Training
				</h1></span>
		</a>

		<ul class="sidebar-nav">
			<li class="sidebar-header">Pages</li>

			<%
			int id = 0;
			/* String email = request.getParameter("email"); */
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch (Exception e) {
				id = 1;
			}
			%>
			<%
			if (id == 1) {
			%>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="industry.jsp?id=1"> <i class="align-middle"
					data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
			</a></li>

			<%
			} else {
			%>
			<li class="sidebar-item "><a class="sidebar-link"
				href="industry.jsp?id=1"> <i class="align-middle"
					data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
			</a></li>
			<%
			}
			%>
			<!-- <li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
            </a>
					</li> -->
			<!-- <li class="sidebar-item"><a class="sidebar-link"
				href="studentList.jsp"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						List</span>
			</a></li>
 -->

			<%
			if (id == 2) {
			%>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="studentList.jsp?id=2"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						List</span>
			</a></li>

			<%
			} else {
			%>
			<li class="sidebar-item"><a class="sidebar-link"
				href="studentList.jsp?id=2"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						List</span>
			</a></li>
			<%
			}
			%>


			<%
			if (id == 3) {
			%>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="attendence.jsp?id=3"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						Attendence</span>
			</a></li>

			<%
			} else {
			%>
			<li class="sidebar-item"><a class="sidebar-link"
				href="attendence.jsp?id=3"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						Attendence</span>
			</a></li>
			<%
			}
			%>
			
			<%
			if (id == 4) {
			%>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="attendanceList.jsp?id=4&&isList=No"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						Attendence List</span>
			</a></li>

			<%
			} else {
			%>
			<li class="sidebar-item"><a class="sidebar-link"
				href="attendanceList.jsp?id=4&&isList=No"> <i class="align-middle"
					data-feather="book"></i> <span class="align-middle">Student
						Attendence List</span>
			</a></li>
			<%
			}
			%>
			


			<li class="sidebar-item "><a class="sidebar-link"
				href="logout.jsp"> <i class="align-middle"
					data-feather="log-out"></i> <span class="align-middle">Log
						Out</span>
			</a></li> 


		</ul>


	</div>
</nav>