<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%
String p = request.getParameter("p");

String email = request.getParameter("email");
String pass = request.getParameter("password");

try {

	Connection con = Connector.getCon();
	if (p.equals("teacher")) {
		if (email.equals("teacher") && pass.equals("teacher@123")) {
			session.setAttribute("email", email);
	response.sendRedirect("../teacher/teacher.jsp");
		} else {
%>

		<script>
				alert("Invalid Email or Password..");
				location.href = "../Sign-in-Teacher.jsp";
		</script>

<%
		}
	}else if(p.equals("student")){
		
		String sql = "select * from student where email='" + email + "' and pass='"+pass+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			session.setAttribute("email", email);
			session.setAttribute("student_id", rs.getString(1));
			session.setAttribute("student_industry_id", rs.getString("industry"));
			response.sendRedirect("../student/student.jsp");
		} else {
	%>

		<script>
		alert("Invalid Email or Password..");
		location.href = "../Sign-in-Student.jsp";
		</script>

	<%
		}
		
	}else{
		String sql = "select * from industry where email='" + email + "' and pass='"+pass+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			session.setAttribute("email", email);
			session.setAttribute("industry_id", rs.getString(1));
			response.sendRedirect("../industry/industry.jsp");
		} else {
	%>

		<script>
		alert("Invalid Email or Password..");
		location.href = "../Sign-in-Industry.jsp";
		</script>

	<%
		}
	}

} catch (Exception e) {
e.printStackTrace();

}
%>