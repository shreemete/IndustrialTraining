<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector" %>
<%@	page import="java.sql.*" %>
<%
	/* int id = Integer.parseInt(request.getParameter("stud_id")); */

String name = request.getParameter("industry_name");

int id = Integer.parseInt(request.getParameter("id"));

try{
	
	Connection con = Connector.getCon();
	String q="update student set industry="+"'"+name+"'"+" where id="+id+";";
	PreparedStatement pstmt = con.prepareStatement(q);
	/* pstmt.setInt(1,id); */
	/* pstmt.setString(1,name); */
	
	
	pstmt.executeUpdate();
	
	response.sendRedirect("../teacher/studentList.jsp");
	
	
}catch(Exception e){
	e.printStackTrace();
	%> 
	
	<script>
		alert("Regisration Failed");
		
	</script>
	<%
	
}

%>