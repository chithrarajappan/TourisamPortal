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
	String name=request.getParameter("hotelname");
	String contact=request.getParameter("contact");
	String nationality=request.getParameter("nation");
	String address=request.getParameter("address");
	String street=request.getParameter("street");
	String city=request.getParameter("city");
	String type=request.getParameter("type");
	String category=request.getParameter("category");
	String srooms=request.getParameter("srooms");
	String drooms=request.getParameter("drooms");
	String frooms=request.getParameter("frooms");
	String dorm=request.getParameter("dormitory");
	
	String email=request.getParameter("email_id");
	String password=request.getParameter("password");
	String registration_id=request.getParameter("hotelid");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		int j=stmt.executeUpdate("insert into tbl_login(username,password,category)values('"+email+"','"+password+"','"+type+"')");
		String sql="select max(id)from tbl_login";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			String log_id=rs.getString(1);
			String sql1="INSERT INTO `tbl_hotelregister`(`hotel_name`, `contact_number`, `nationality`, `address`, `street`, `city`, `typestay`, `starrate`, `singlerooms`, `doublerooms`, `familyrooms`, `dormitory`, `email_id`, `hotelid`, `logid`) VALUES('"+name+"','"+contact+"','"+nationality+"','"+address+"','"+street+"','"+city+"','"+type+"','"+category+"','"+srooms+"','"+drooms+"','"+frooms+"','"+dorm+"','"+email+"','"+registration_id+"','"+log_id+"')";
			stmt.executeUpdate(sql1);
			String sql2="UPDATE `tbl_registerhotel` SET `status`='1' WHERE `id`='"+registration_id+"'";
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