<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="student.jsp"> <span
			class="align-middle">
			<h1 class="h3 mb-0 text-light text-center">
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
				href="student.jsp?id=1"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">Profile</span>
			</a> <%
 } else {
 %>
			<li class="sidebar-item "><a class="sidebar-link"
				href="student.jsp?id=1"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">Profile</span>
			</a></li>
			<%
			}
			
			%>
			<%
			if (id == 2) {
			%>
			<li class="sidebar-item active"><a class="sidebar-link"
				href="attendance.jsp?id=2"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">Attendance</span>
			</a> <%
 } else {
 %>
			<li class="sidebar-item "><a class="sidebar-link"
				href="attendance.jsp?id=2"> <i class="align-middle"
					data-feather="user"></i> <span class="align-middle">Attendance</span>
			</a></li>
			<%
			}
			
			%>
			
			
			<li class="sidebar-item "><a class="sidebar-link"
				href="logout.jsp"> <i class="align-middle"
					data-feather="log-out"></i> <span class="align-middle">Log Out</span>
			</a> 

			

			


		</ul>


	</div>
</nav>