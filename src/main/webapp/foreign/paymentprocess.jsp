 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
 <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sdf.format(new Date()); %>

<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
	   
		String user=(String)session.getAttribute("user");
		String id=(String)session.getAttribute("uid");
		String  bid=(String)session.getAttribute("bookid");

   %>
<%@page import="java.sql.*" %>   
   <%
		String hid=request.getParameter("hid");
		String account=request.getParameter("acc");		 
		String cardno=request.getParameter("cardno");
		String cvv=request.getParameter("cvv");
		String amount=request.getParameter("sum");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();

		
		if (request.getParameter("sub")!=null)
		{
			String sql="select * from tbl_bank where cardno='"+cardno+"' and cvv='"+cvv+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				String username=rs.getString("username");
				String balance=rs.getString("balance");

					float bln=Float.parseFloat(balance);
				   	float amt=Float.parseFloat(amount);


				if(bln > amt)
						{
							float sub=0;
							sub=bln-amt;
							
							
							PreparedStatement ps1=con.prepareStatement("INSERT INTO `tbl_transaction`(`fromid`,`fromaccount`, `toid`,`toaccount`, `amount`, `bookingdate`,`bookingid`) VALUES (?,?,?,?,?,?,?)");
							ps1.setString(1,id);
							ps1.setString(2,cardno);
							ps1.setString(3,hid);
							ps1.setString(4,account);
							ps1.setFloat(5,amt);
							ps1.setString(6,date);
							ps1.setString(7,bid);
							
							
							session.setAttribute("fromid",id);
							session.setAttribute("toid", hid);
									
						
							int ok=ps1.executeUpdate();
						    if(ok>0){
						    	PreparedStatement ps2=con.prepareStatement("UPDATE tbl_bank set balance=? where cardno=?");
								ps2.setFloat(1,sub);
								ps2.setString(2,cardno);
							    ps2.executeUpdate();
							    
						    
						}
						    out.println("<script type=\"text/javascript\">");
							   out.println("alert('Transcation success..thank you');");
							   out.println("window.open('viewbill.jsp','_blank')");
							   out.println("location='foreignhome.jsp';");
							  
							    out.println("</script>");  
						}
				else
				{
		  		   out.println("<script type=\"text/javascript\">");
				   out.println("alert('You have not enough balance..Transcation failed. Go back to Home');");
				   out.println("location='nativehome.jsp';");
				   out.println("</script>");          	
		   	     }
				
			}

			else
			{
				response.sendRedirect("bookstay.jsp");
			}
			
		
		}
		if (request.getParameter("cancel")!=null)
		{

			String sql1="delete from tbl_booking where id='"+bid+"'";
			stmt.executeUpdate(sql1);
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Transcation cancelled.. Go back to Home');");
			   out.println("location='nativehome.jsp';");
			   out.println("</script>");
		
		}
		

%>



<%}%>