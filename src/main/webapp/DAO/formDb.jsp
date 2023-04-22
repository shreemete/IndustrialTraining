<%@	page import="com.connection.Connector" %>
<%@	page import="java.sql.*" %>
<%
	/* int id = Integer.parseInt(request.getParameter("stud_id")); */

String name = request.getParameter("stud_name");
String email = request.getParameter("stud_email");
String mobile = request.getParameter("stud_mob");
String branch = request.getParameter("stud_branch");
String currentYear = request.getParameter("stud_curr_year");
int academicYear = Integer.parseInt(request.getParameter("stud_academic_year"));
String address = request.getParameter("address");
String pass = request.getParameter("stud_pass");
String date = request.getParameter("stud_dob");

/* System.out.println(date); */
try{
	Connection con = Connector.getCon();
	String q="insert into student (name,email,mobile,address,dob,branch,currentYr,academicYr,pass) values (?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(q);
	/* pstmt.setInt(1,id); */
	pstmt.setString(1,name);
	pstmt.setString(2,email);
	pstmt.setString(3,mobile);
	pstmt.setString(4,address);
	pstmt.setString(5,date);
	pstmt.setString(6,branch);
	pstmt.setString(7,currentYear);
	pstmt.setInt(8,academicYear);
	pstmt.setString(9,pass);
	
	pstmt.executeUpdate();
	%>
	<script>
		alert("Regisration completed");
		location.href="../Sign-in-Student.jsp";
	</script>
	<%
	
	
}catch(Exception e){
	e.printStackTrace();
	%> 
	
	<script>
		alert("Regisration Failed");
		
	</script>
	<%
	
}

%>