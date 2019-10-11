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
	String name=request.getParameter("fullname");
	String contact=request.getParameter("number");
	String nationality=request.getParameter("nationality");
	String address=request.getParameter("address");
	String street=request.getParameter("street");
	String city=request.getParameter("city");
	String id=request.getParameter("vid");
	String iddetail=request.getParameter("id");
	String email=request.getParameter("email");
	String password=request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		int j=stmt.executeUpdate("insert into tbllogin(username,password,category)values('"+email+"','"+password+"','foreigner')");
		String sql="select max(id)from tbllogin";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			String log_id=rs.getString(1);
			String sql1="insert into tbl_foreignerregister(name,contact_number,nationality,address,street,city,id_proof,id_details,email_id,logid)values('"+name+"','"+contact+"','"+nationality+"','"+address+"','"+street+"','"+city+"','"+id+"','"+iddetail+"','"+email+"','"+log_id+"')";
			stmt.executeUpdate(sql1);
			%>
			<script type="text/javascript">alert("Registrton succesfull")</script>
			<%
			response.sendRedirect("index.jsp");
		}
		else
		{
			out.println("Insertion Failed");
			response.sendRedirect("user_register.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}

%>
</body>
</html>