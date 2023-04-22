<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%
/* int id = Integer.parseInt(request.getParameter("stud_id")); */

String email = request.getParameter("email");

try {

	Connection con = Connector.getCon();
	String sql = "select * from student where email='" + email + "'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
		session.setAttribute("email", email);
		response.sendRedirect("../forgotPassword.jsp");
} else {
%>

<script>
	alert("Invalid Email");
	location.href = "../checkEmail.jsp";
</script>

<%
}
} catch (Exception e) {
e.printStackTrace();

}
%>