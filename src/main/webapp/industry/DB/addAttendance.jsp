<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="com.connection.Connector"%>
<%@	page import="java.sql.*"%>
<%

String industry_id = String.valueOf(session.getAttribute("industry_id"));

String student_id = request.getParameter("student_id");
String status = request.getParameter("status");
String desc = request.getParameter("desc");
	
try {

	Connection con = Connector.getCon();
	String sql = "insert into attendance (industryId, studentId, status, description, dates) values (?,?,?,?,CURDATE()); ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	/* pstmt.setInt(1,id); */
	pstmt.setString(1,industry_id);
	pstmt.setString(2,student_id);
	pstmt.setString(3,status);
	pstmt.setString(4,desc);
	
	
	pstmt.executeUpdate();
		response.sendRedirect("../attendence.jsp");
} catch (Exception e) {
e.printStackTrace();

}
%>