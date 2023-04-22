<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%


String path = "D:\\workspace3\\IndustrailTrainingFinal\\src\\main\\webapp\\Demo\\" ; 
out.print(request);
MultipartRequest m = new MultipartRequest(request, path);  
out.print("successfully uploaded");  

       

%>