	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
	   
		String user=(String)session.getAttribute("user");
		String id=(String)session.getAttribute("uid");
		String  bid=(String)session.getAttribute("bookid");
		String  fromid=(String)session.getAttribute("fromid");
		String  toid=(String)session.getAttribute("toid");
		String  pid=(String)session.getAttribute("pid");
		
		
   %>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Payment Invoice</title>
	
	<link rel='stylesheet' type='text/css' href='asset/bill/css/style.css' />
	<link rel='stylesheet' type='text/css' href='asset/bill/css/print.css' media="print" />
	<script type='text/javascript' src='asset/bill/js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='asset/bill/js/example.js'></script>

</head>

<body>

<button><i class="fa fa-print" aria-hidden="true">
<script>window.print();</script>
</i></button>



	<div id="page-wrap">
<%
String sql1="SELECT * FROM `tbl_agencyregister` INNER JOIN tbl_registeragent ON tbl_agencyregister.agencyid= tbl_registeragent.id WHERE tbl_agencyregister.logid='"+toid+"'";
ResultSet rs1 =stmt.executeQuery(sql1);

if (rs1.next())
{ 

%>


		<textarea id="header" readonly="">PAYMENT INVOICE</textarea>
	
			
		
		<div id="identity">
            <textarea id="customer-title" readonly=""><%=rs1.getString("agency_name") %></textarea>
		
            <textarea id="address" readonly="" style="height:115px;"><%=rs1.getString("address") %>
<%=rs1.getString("street") %>
<%=rs1.getString("city") %>

Phone: <%=rs1.getString("contact_number") %></textarea>

     		<%} %>
		<div style="clear:both">   
		<div id="customer">
<%
String sql="SELECT * FROM tbl_nativeregister where logid='"+fromid+"'";
ResultSet rs =stmt.executeQuery(sql);

if (rs.next())
{ 

%>
	<textarea id="header" readonly="">Customer Details</textarea>
		<div id="identity">
		
            <textarea id="address"  style="height:115px;"><%=rs.getString("address") %>
<%=rs.getString("city") %>
<%=rs.getString("state") %>

Phone: <%=rs.getString("contact_number") %></textarea>

		
		<div style="clear:both"></div>
		
		<div id="customer">

      <textarea id="customer-title" readonly=""><%=rs.getString("name") %></textarea>	
</div>
     <hr/>     		
		</div>
	<% } %>
	</div>
	</div>
		<div id="customer">
				
<%
String sql2="SELECT * FROM tbl_transaction1 INNER JOIN tbl_packagebook ON tbl_packagebook.id=tbl_transaction1.bookingid where tbl_transaction1.bookingid='"+bid+"'";
ResultSet rs2 =stmt.executeQuery(sql2);

if (rs2.next())
{ 

%>
  <table id="meta" style="margin-top: 0px;">
                <tr>
                    <td class="meta-head">Invoice</td>
                    <td><textarea>000123</textarea></td>
                </tr>
                <tr>

                    <td class="meta-head">proof given</td>
                    <td><%=rs2.getString("idproof")%></td>
                </tr>
                <tr>
                    <td class="meta-head">date of booking</td>
                    <td><div class="due"><%=rs2.getString("bookingdate")%></div></td>
                </tr>

            </table>
<%} %>
	

<%
String sql3="SELECT * FROM tbl_agencyregister INNER JOIN tbl_agentpackages ON tbl_agentpackages.logid=tbl_agencyregister.logid where tbl_agencyregister.logid='"+toid+"' and tbl_agentpackages.id='"+pid+"'";
ResultSet rs3 =stmt.executeQuery(sql3);

if (rs3.next())
{ 

%>

	<table id="items">
		
		  <tr>
		      <th>Description</th>
		      <th>Details</th>
		      <th>Amount</th>
		  </tr>
		  
		  <tr class="item-row">
		      <td>Package Name</td>
		     <td><textarea class="qty"><%=rs3.getString("package_name") %></textarea></td>
		     
		      <td><textarea class="qty"></textarea></td>
		      
		  </tr>
		  
		  <tr class="item-row">
		      <td>Places Visiting</td>
		      <td><textarea class="qty"><%=rs3.getString("placestovisit") %></textarea></td>
		      <td><span class="price"></span></td>
		  </tr>
		  
		  <tr class="item-row">
		      <td>Days of Tour</td>
		      <td><textarea class="qty"><%=rs3.getString("no_of_days") %>&nbsp;Days</textarea></td>
		      <td><span class="price"></span></td>
		  </tr>
		 		  <tr class="item-row">
		      <td>Package Amount</td>
		      <td><span class="price"><%=rs3.getString("nativeamount") %>/ per head</span></td>
		      
		      <td><textarea class="qty"></textarea></td>
		  </tr>
		   <%} %>
		  
		  
				
<%
String sql4="SELECT * FROM tbl_transaction1 INNER JOIN tbl_packagebook ON tbl_packagebook.id=tbl_transaction1.bookingid where tbl_transaction1.bookingid='"+bid+"'";
ResultSet rs4 =stmt.executeQuery(sql4);

if (rs4.next())
{ 

%>
		  
		   
		  <tr class="item-row">
		      <td>Date of Journey</td>
		      <td><textarea class="qty"><%=rs4.getString("date") %> </textarea></td>
		      <td><span class="price"></span></td>
		  </tr>
			
		  <tr class="item-row">
		      <td>Number of Travelers</td>
		      <td><textarea class="qty"><%=rs4.getString("number") %> </textarea></td>
		      <td><span class="price"></span></td>
		  </tr>
			 		  <tr class="item-row">
		      <td>Amount Payable</td>
		      <td><textarea class="qty"></textarea></td>
		      <td><span class="price"><%=rs4.getString("amount") %></span></td>
		  </tr>
		   <tr id="item-row">
		  		      <td>Sub Total
		  		    payed through Traveller.com</td>
		      <td><textarea class="qty">paid</textarea></td>
		      <td><span class="price"><%=rs4.getString("amount") %>/-</span></td>
		  </tr>
		
		</table>
			 <%} %>

</div>
		<div id="terms">
		  <h5>Terms</h5>
		  <textarea>NET 30 Days. Finance Charge of 1.5% will be made on unpaid balances after 30 days.</textarea>
		  		  <textarea>Customer Must bring the Identification Detail provided at time of booking</textarea>
		  		  		  <textarea>This invoice have the power of Booking slip. Keep this until completion of your Need</textarea>
		</div>
	
	</div>
	
</body>
</html>
<%}%>