<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%@	page import="com.oreilly.servlet.MultipartRequest"%>
<%@	page import="com.paths.*"%>
<%
int id = Integer.parseInt(request.getParameter("id"));

String email = request.getParameter("email");

try {

	Connection con = Connector.getCon();
	String sql = "select * from studentSkills where email='" + email + "';";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

		String skills = request.getParameter("skills");
		if (rs.next()) {
	skills = rs.getString(2) + "," + skills;
	String q = "update studentSkills set skills=" + "'" + skills + "'" + " where email='" + email + "';";
	PreparedStatement pstmt = con.prepareStatement(q);
	/* pstmt.setInt(1,id); */
	/* pstmt.setString(1,name); */

	pstmt.executeUpdate();
%>
<!-- <script>
	alert("Password updated Successfully..");
	location.href = "../../Sign-in-Student.jsp";
</script> -->
<%
} else {

String q = "insert into studentSkills (skills,email) values (?,?);";
PreparedStatement pstmt = con.prepareStatement(q);
pstmt.setString(1, skills);
pstmt.setString(2, email);

pstmt.executeUpdate();
%>

<!-- <script>
	alert("Password is not created yet.");
	location.href = "../../Sign-in-Student.jsp";
</script> -->

<%
}

response.sendRedirect("../student.jsp");
} catch (Exception e) {
e.printStackTrace();

}
%>