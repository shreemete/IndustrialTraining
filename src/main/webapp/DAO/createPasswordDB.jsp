<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%
/* int id = Integer.parseInt(request.getParameter("stud_id")); */

String email = request.getParameter("email");
String pass = request.getParameter("password");

try {

	Connection con = Connector.getCon();
	String sql = "select * from industry where email='" + email + "' and pass is null";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
		String q = "update industry set pass=" + "'" + pass + "'" + " where email='" + email + "';";
		PreparedStatement pstmt = con.prepareStatement(q);
		/* pstmt.setInt(1,id); */
		/* pstmt.setString(1,name); */

		pstmt.executeUpdate();
%>
<script>
	alert("Password created Successfully..");
	location.href="../Sign-in-Industry.jsp";
</script>
<%
} else {
%>
	
	<script>
	alert("Cannot create password , You have already created Password.");
	location.href="../Sign-in-Industry.jsp";
</script>

<%
}
} catch (Exception e) {
e.printStackTrace();
%>

<script>
	alert("Regisration Failed");
</script>
<%
}
%>