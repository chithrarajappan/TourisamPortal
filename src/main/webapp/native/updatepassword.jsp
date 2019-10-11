<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <%@page import="java.sql.*" %>
	   <%
	  	if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
	  	{
	    response.sendRedirect("index.jsp"); 
	  	}
		String user=(String)session.getAttribute("user");
		String id=(String)session.getAttribute("uid");
		
		%>
<%
	String password1=request.getParameter("password1");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		int j=stmt.executeUpdate("update tbl_login set password='"+password1+"' where id='"+id+"'");
		if(j>0)
		{
			%>
			<script type="text/javascript">alert("Password changed succesfully")</script>
			<%
			response.sendRedirect("updateprofile.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>