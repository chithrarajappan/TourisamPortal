<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String message=request.getParameter("message");
String blogid=request.getParameter("blogid");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
try
{
	int j=stmt.executeUpdate("INSERT INTO `tbl_blogcomment`(`name`, `email`, `message`, `blogid`) VALUES ('"+name+"','"+email+"','"+message+"','"+blogid+"')");
	if(j>0)
	{
		response.sendRedirect("blog.jsp");
	}
	
}
catch(Exception e)
{
	out.println(e);
}

%>