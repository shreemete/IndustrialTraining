<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%
/* int id = Integer.parseInt(request.getParameter("stud_id")); */

response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

	if(session.getAttribute("email")==null){
		response.sendRedirect("../../Sign-in-Student.jsp");
	}

String email = String.valueOf(session.getAttribute("email"));
String pass = request.getParameter("pass");

try {

	Connection con = Connector.getCon();
	String sql = "select * from student where email='" + email + "';";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
		String q = "update student set pass=" + "'" + pass + "'" + " where email='" + email + "';";
		PreparedStatement pstmt = con.prepareStatement(q);
		/* pstmt.setInt(1,id); */
		/* pstmt.setString(1,name); */

		pstmt.executeUpdate();
		
		
%>
<script>
	alert("Password updated Successfully..");
	location.href = "../../Sign-in-Student.jsp";
</script>
<%
} else {
%>

<script>
	alert("Password is not created yet.");
	location.href = "../../Sign-in-Student.jsp";
</script>

<%
}
	request.getSession().invalidate();
	response.sendRedirect("../../Sign-in-Student.jsp");

} catch (Exception e) {
e.printStackTrace();

}
%>