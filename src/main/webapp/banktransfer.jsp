<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
 <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sdf.format(new Date()); %>
<% 
String id=request.getParameter("id"); 
String bal=request.getParameter("bal");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="" method="post">
<input type="hidden" name="taccount" value="223344556">
<input type="hidden" name="balance" value="<%=bal%>">
<input type="hidden" name="id" value="<%=id%>">
<br>
<div class="form-group">
<label>Your Account No</label>
<input type="text" name="faccount">

</div>
<br/>
<div class="form-group">
<label>Amount</label>
<input type="text" name="amount">
</div>
<br/>
<div class="form-group">
<label>Date</label>
<input type="text" name="date" value="<%=date%>">
</div>
<br/>
<div class="form-group">
<input type="submit" name="sub" value="Submit">
<input type="reset" name="cancel" value="Cancel">
</div>
</form>
</center>
</body>
</html>
<%
if(request.getParameter("sub")!=null)
{
   String taccount=request.getParameter("taccount");
   String bid=request.getParameter("id");
   String faccount=request.getParameter("faccount");
   String balance=request.getParameter("balance");
   String amount=request.getParameter("amount");
   String cdate=request.getParameter("date");
   
   float bln=Float.parseFloat(balance);
   float amt=Float.parseFloat(amount);
   
	PreparedStatement ps=con.prepareStatement("select * from tbl_bank where cardno=? and id=?");
	ps.setString(1,faccount);
	ps.setString(2,bid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		if(bln > amt)
		{
			float sub=0;
			sub=bln-amt;
			PreparedStatement ps1=con.prepareStatement("INSERT INTO `tbl_transcation`(`fromaccount`, `toaccount`, `amount`, `currentdate`) VALUES (?,?,?,?)");
			ps1.setString(1,faccount);
			ps1.setString(2,taccount);
			ps1.setFloat(3,amt);
			ps1.setString(4,cdate);
		    int ok=ps1.executeUpdate();
		    if(ok>0){
		    	PreparedStatement ps2=con.prepareStatement("UPDATE tbl_bank set balance=? where cardno=?");
				ps2.setFloat(1,sub);
				ps2.setString(2,faccount);
			    ps2.executeUpdate();
			    out.println("<script type=\"text/javascript\">");
				   out.println("alert('Transcation success..thank you');");
				   out.println("location='viewbill.jsp?facc='"+faccount+"'");
				   out.println("</script>"); 
		    }	
		}
		else
		{
  		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('You have not enough balance..Transcation failed');");
		   out.println("location='banckconfirm.jsp';");
		   out.println("</script>");          	
   	     }
		//response.sendRedirect("banktransfer.jsp");
	}
	else{
		response.sendRedirect("bankconfirm.jsp");
	}
}
%>
