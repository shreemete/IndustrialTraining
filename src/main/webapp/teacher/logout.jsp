<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
request.getSession().invalidate();
response.sendRedirect("../Sign-in-Teacher.jsp");


%>