<%@page import="com.connection.Connector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%
Connection con = Connector.getCon();
String sql = "";
PreparedStatement ps = null; ResultSet rs = null; int done = 0;


int createfolder;

sql = "select workId from dailywork order by workId desc limit 1";
ps = con.prepareStatement(sql);
rs = ps.executeQuery();
if(rs.next()){
	createfolder = rs.getInt("workId") + 1;
	
}else{
	createfolder = 1;
	
}

  	       
String path = "D:\\workspace3\\IndustrailTrainingFinal\\src\\main\\webapp\\assets\\dailywork\\"+createfolder ; 

File f = new File(path);
if(!f.exists()){
    if(f.mkdirs()){
       MultipartRequest m =  new MultipartRequest(request,path,1024*1024*10);
       sql = "insert into dailywork(studentId, industryId,docFile,description,date)values(?,?,?,?,CURDATE())";
       ps = con.prepareStatement(sql);
       ps.setString(1, session.getAttribute("student_id").toString());
       ps.setString(2, session.getAttribute("student_industry_id").toString());
       ps.setString(3, createfolder+"/"+m.getFilesystemName("work"));
       ps.setString(4, m.getParameter("desc"));
       
       done = ps.executeUpdate();
       if(done>0){
    	   response.sendRedirect("../student.jsp");
   	} else {
   		%>
   		<script>
   			alert("Try Again");
   			location.href="../student.jsp";
   		</script>
   		<%
   	}

   	 
       
  }
}

out.print("successfully uploaded");



%>

