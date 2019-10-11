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
	String name=request.getParameter("fullname1");
	String contact=request.getParameter("number1");
	String nationality=request.getParameter("nationality1");
	String address=request.getParameter("address1");
	String city=request.getParameter("city1");
	String state=request.getParameter("state1");
	String pincode=request.getParameter("pincode1");
	String id=request.getParameter("vid1");
	String iddetail=request.getParameter("id1");
	String email=request.getParameter("email1");
	String password=request.getParameter("password1");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		int j=stmt.executeUpdate("insert into tbl_login(username,password,category)values('"+email+"','"+password+"','native')");
		String sql="select max(id)from tbl_login";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			String log_id=rs.getString(1);
			String sql1="insert into tbl_nativeregister(name,contact_number,nationality,address,city,state,pincode,id_proof,id_details,email_id,logid)values('"+name+"','"+contact+"','"+nationality+"','"+address+"','"+city+"','"+state+"','"+pincode+"','"+id+"','"+iddetail+"','"+email+"','"+log_id+"')";
			stmt.executeUpdate(sql1);
			%>
			<script type="text/javascript">alert("Registration succesfull")</script>
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