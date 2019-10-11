<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
	String agentname=request.getParameter("agentname");
	String agencyname=request.getParameter("agencyname");
	String emailid=request.getParameter("agentsmail");
	String agencyid=request.getParameter("agencyid");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
			String sql1="insert into registeragency(agent_name,agency_name,emailid,agencyregid)values('"+agentname+"','"+agencyname+"','"+emailid+"','"+agencyid+"')";
			stmt.executeUpdate(sql1);
			%>
			<script type="text/javascript">alert("Registrton succesfull")</script>
			<%
			response.sendRedirect("registeredagencies.jsp");
	
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
</body>
</html>