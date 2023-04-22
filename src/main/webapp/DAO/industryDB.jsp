<%@	page import="com.connection.Connector" %>
<%@	page import="java.sql.*" %>
<%
	/* int id = Integer.parseInt(request.getParameter("stud_id")); */

String name = request.getParameter("industry_name");
String director = request.getParameter("director_name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String address = request.getParameter("address");
String status = "Deactivated";
try{
	Connection con = Connector.getCon();
	String q="insert into industry (name,director,email,mobile,address,status) values (?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(q);
	/* pstmt.setInt(1,id); */
	pstmt.setString(1,name);
	pstmt.setString(2,director);
	pstmt.setString(3,email);
	pstmt.setString(4,mobile);
	pstmt.setString(5,address);
	pstmt.setString(6,status);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("../teacher/teacher.jsp");
	
}catch(Exception e){
	e.printStackTrace();
	%> 
	
	<script>
		alert("Regisration Failed");
		
	</script>
	<%
	
}

%>