package agentmail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailApp
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class MailApp extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
        	String to = request.getParameter("to");
	        String subject = request.getParameter("subject");
	        String msg= request.getParameter("message");  
	        String user = request.getParameter("user");
	        String pass = request.getParameter("pass");
	        Class.forName("com.mysql.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	        if(request.getParameter("agency") != null)
	        {
		        String message="Thank you for registering as an affiliate in @goanywhere.com. your Register Id is"+request.getParameter("message")+".Click the following link to proceed <a href='http://localhost:8080/tourisam/agencyregister2.jsp?msg="+msg+"&to1="+to+"'>click</a>";
	        	PreparedStatement ps=con.prepareStatement("select * from tbl_registeragent where email_id=? and agentregid=? and status=?");
	        	ps.setString(1,to);
	        	ps.setString(2,msg);
	        	ps.setString(3,"0");
	        	ResultSet re=ps.executeQuery();
		        	if(re.next())
		        	{     
				        SendMail.send(to,subject, message, user, pass);
				        //out.println("Mail send successfully");    
				          out.println("<script type=\"text/javascript\">");
						   out.println("alert('A Mail has been send to your mail id. Please refer it to further registration ');");
						   out.println("location='index.jsp';");
						   out.println("</script>");   
		        	}
		        	else{
		        		 out.println("<script type=\"text/javascript\">");
						   out.println("alert('Invalid Details Please try again');");
						   out.println("location='agencyregistration.jsp';");
						   out.println("</script>");          	
		        	}
	           } 
	         if(request.getParameter("hotel")!=null)
	        {
	        	String message="Thank you for registering as an affiliate in @goanywhere.com. your Register Id is"+request.getParameter("message")+".Click the following link to proceed <a href='http://localhost:8080/tourisam/hotelregister2.jsp?msg="+msg+"&to1="+to+"'>click</a>";
	        	PreparedStatement ps=con.prepareStatement("select * from tbl_registerhotel where email_id=? and hotelregid=? and status=?");
	        	ps.setString(1,to);
	        	ps.setString(2,msg);
	        	ps.setString(3,"0");
	        	ResultSet re=ps.executeQuery();
	        	if(re.next())
	        	{     
			        SendMail.send(to,subject, message, user, pass);
			        //out.println("Mail send successfully");
			          out.println("<script type=\"text/javascript\">");
					   out.println("alert('Mail send successfully');");
					   out.println("location='index.jsp';");
					   out.println("</script>");     
	           }
	        	else{
	        		 out.println("<script type=\"text/javascript\">");
					   out.println("alert('Invalid Details Please try again');");
					   out.println("location='hotelregistration.jsp';");
					   out.println("</script>");          	
	        	}   	
	        }
        	else{
        		   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Mail not send successfully');");
				   out.println("location='index.jsp';");
				   out.println("</script>");          	
        	}
        	
        }
        catch(Exception e)
        {
        	out.print(e);
        }
    }
}
