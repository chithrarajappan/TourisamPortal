<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
 <%
      Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	  Statement stmt=con.createStatement();	
	  String id=request.getParameter("id");
	  if(request.getParameter("approve")!=null)
	  {
		  String sql="update tbl_agentoffers set status='1' where id="+id; 
		  stmt.executeUpdate(sql);
		  response.sendRedirect("agentsoffers.jsp");
	  }
	  if(request.getParameter("reject")!=null)
	  {
		  String sql1="update tbl_agentoffers set status='2' where id="+id;
		  stmt.executeUpdate(sql1);
		  response.sendRedirect("agentsoffers.jsp");
	  }
	  
%>
	