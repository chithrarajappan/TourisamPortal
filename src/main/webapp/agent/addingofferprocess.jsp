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
String newsid=request.getParameter("id");
	String offername=request.getParameter("offername");
	String places=request.getParameter("placevisiting");
	String days=request.getParameter("days");
	String amount=request.getParameter("amount");
	String foodaccomodation=request.getParameter("fd");
	String transportation=request.getParameter("transportation");
	String description=request.getParameter("description");
	String agentid=request.getParameter("agent_id");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
			String sql1="insert into tbl_agentoffers(newsletterid,offername,places,days,amount,foodaccomodation,transportation,description,agentid,status)values('"+newsid+"','"+offername+"','"+places+"','"+days+"','"+amount+"','"+foodaccomodation+"','"+transportation+"','"+description+"','"+agentid+"','0')";
			stmt.executeUpdate(sql1);
			%>
			<script type="text/javascript">alert("Added Succesfully")</script>
			<%
			response.sendRedirect("agenthome.jsp");
	
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
</body>
</html>



