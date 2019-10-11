<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<%
	String username = request.getParameter("username");
	String password=request.getParameter("pass");
	//out.print(password);
  try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	PreparedStatement ps=con.prepareStatement("select * from tbllogin where username=? and password=?");
	ps.setString(1,username);
	ps.setString(2,password);
	ResultSet re=ps.executeQuery();
	if(re.next())
	{
		session.setAttribute("user",username);
		String category=re.getString("category");
		//System.out.println(category);
		if(category.equals("admin"))
		{
			response.sendRedirect("admin/index.jsp");
		}
		else if(category.equals("agent"))
		{
			response.sendRedirect("agenthome.jsp");
		}
		else if(category.equals("hotels"))
		{
			response.sendRedirect("hotelhome.jsp");
		}
		else if(category.equals("foreigner"))
			{
				response.sendRedirect("foreignhome.jsp");
			}
		else if(category.equals("native"))
		{
			response.sendRedirect("nativehome.jsp");	
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
