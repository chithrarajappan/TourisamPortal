<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%
	String ownername=request.getParameter("ownername");
	String hotelname=request.getParameter("hotelname");
	String emailid=request.getParameter("hotelmail");
	String registrationid=request.getParameter("hotelid");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
			String sql1="insert into tbl_registerhotel(owner_name,hotel_name,email_id,hotelregid,status)values('"+ownername+"','"+hotelname+"','"+emailid+"','"+registrationid+"','0')";
			stmt.executeUpdate(sql1);
			%>
			<script type="text/javascript">alert("Registrton succesfull")</script>
			<%
			response.sendRedirect("registeredhotels.jsp");
	
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
