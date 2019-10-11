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
	String name=request.getParameter("agencyname");
	String contact=request.getParameter("contact");
	String account=request.getParameter("account");
	String nationality=request.getParameter("nation");
	String address=request.getParameter("address");
	String street=request.getParameter("street");
	String city=request.getParameter("city");
	String email=request.getParameter("email_id");
	String password=request.getParameter("password");
	String registration_id=request.getParameter("agencyid");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		int j=stmt.executeUpdate("insert into tbl_login(username,password,category)values('"+email+"','"+password+"','agency')");
		String sql="select max(id)from tbl_login";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			String log_id=rs.getString(1);
			String sql1="insert into tbl_agencyregister(agency_name,contact_number,account,nationality,address,street,city,email_id,agencyid,logid)values('"+name+"','"+contact+"','"+account+"','"+nationality+"','"+address+"','"+street+"','"+city+"','"+email+"','"+registration_id+"','"+log_id+"')";
			stmt.executeUpdate(sql1);
			String sql2="UPDATE `tbl_registeragent` SET `status`='1' WHERE `id`='"+registration_id+"'";
			stmt.executeUpdate(sql2);
			%>
			<script type="text/javascript">alert("Registration succesfull")</script>
			<%
			response.sendRedirect("index.jsp");
		}
		else
		{
			out.println("Insertion Failed");
			response.sendRedirect("index.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
</body>
</html>