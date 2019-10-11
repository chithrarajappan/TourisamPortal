<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.security.*" %>


<%
	String username = request.getParameter("username");
	String password=request.getParameter("pass");
	//out.print(password);
  try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	PreparedStatement ps=con.prepareStatement("select * from tbl_login where username=? and password=?");
	ps.setString(1,username);
	ps.setString(2,password);
	ResultSet re=ps.executeQuery();
	if(re.next())
	{
		session.setAttribute("user",username);
		String category=re.getString("category");
		String id=re.getString("id");
		session.setAttribute("uid", id);
		if(category.equals("admin"))
		{
			response.sendRedirect("admin/index.jsp");
		}
		else if(category.equals("agency"))
		{
			response.sendRedirect("agent/agenthome.jsp");
		}
		else if(category.equals("hotel"))
		{
			response.sendRedirect("hotel/hotelhome.jsp");
		}
		else if(category.equals("foreigner"))
			{
				response.sendRedirect("foreign/foreignhome.jsp");
			}
		else if(category.equals("native"))
		{
			response.sendRedirect("native/nativehome.jsp");	
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
}
catch(Exception e)
 {
	out.print(e);
 }
%>
