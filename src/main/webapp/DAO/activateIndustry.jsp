<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%

String id = request.getParameter("id");
String status = request.getParameter("status");

try{
	Connection con = Connector.getCon();
	String q="update industry set status=? where id='"+id+"'";
	PreparedStatement pstmt = con.prepareStatement(q);
	/* pstmt.setInt(1,id); */
	pstmt.setString(1,status);
	
	
	pstmt.executeUpdate();
	
	%>
	<script>
		alert("Status Updated");
		location.href="../teacher/industryList.jsp?id=3";
	</script>
	<%
	
	
}catch(Exception e){
	e.printStackTrace();
	%> 
	
	<script>
		alert("Regisration Failed");
		location.href="../teacher/industryList.jsp?id=3";
		
	</script>
	<%
	
}


%>