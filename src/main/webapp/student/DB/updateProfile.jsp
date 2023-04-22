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


String student_id = session.getAttribute("student_id").toString();

/* sql = "select workId from dailywork order by workId desc limit 1";
ps = con.prepareStatement(sql);
rs = ps.executeQuery();
if(rs.next()){
	createfolder = rs.getInt("workId") + 1;
}else{
	createfolder = 1;
} */

  	       
String path = "D:\\workspace3\\IndustrailTrainingFinal\\src\\main\\webapp\\assets\\profile\\"+student_id ; 

File f = new File(path);
if(!f.exists()){
    if(f.mkdirs()){
       MultipartRequest m =  new MultipartRequest(request,path,1024*1024*10);
       sql = "update student set profile=? where id="+student_id+"; ";
       ps = con.prepareStatement(sql);
       
       ps.setString(1, m.getFilesystemName("profile"));
       
       
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
}else{
	String q = "select * from student where id="+student_id+" ;";
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery(q);

	if (rs1.next()) {
	File f1 = new File(path,rs1.getString("profile"));
	f1.delete();
	
	MultipartRequest m =  new MultipartRequest(request,path,1024*1024*10);
    sql = "update student set profile=? where id="+student_id+";";
    ps = con.prepareStatement(sql);
    
    ps.setString(1, m.getFilesystemName("profile"));
    
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


%>

