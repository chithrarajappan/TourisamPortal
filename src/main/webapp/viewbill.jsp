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
		
   %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
/* String facct=request.getParameter("facc");*/
 String sql="select * from tbl_transcation where bookingid='"+bid+"'";
ResultSet rs =stmt.executeQuery(sql);
if(rs.next())
{
	String userid=rs.getString("fromid");
	String hid=rs.getString("toid");
	String bookid=rs.getString("bookingid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Invoice</title>
	
	<link rel='stylesheet' type='text/css' href='asset/bill/css/style.css' />
	<link rel='stylesheet' type='text/css' href='asset/bill/css/print.css' media="print" />
	<script type='text/javascript' src='asset/bill/js/jquery-1.3.2.min.js'></script>
	<script type='text/javascript' src='asset/bill/js/example.js'></script>

</head>

<body>


	<div id="page-wrap">
<%
String sql1="SELECT * FROM tbl_homestaydetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_homestaydetails.hotelid and tbl_homestaydetails.hotelid='"+hid+"'";
ResultSet rs1 =stmt.executeQuery(sql1);

while(rs.next())
{ 

%>


		<textarea id="header">INVOICE</textarea>
		
		<div id="identity">
		
            <textarea id="address"><%=rs1.getString("address") %>
<%=rs1.getString("street") %>
<%=rs1.getString("city") %>

Phone: <%=rs1.getString("contact_number") %></textarea>

           <!--  <div id="logo">

              <div id="logoctr">
                <a href="javascript:;" id="change-logo" title="Change logo">Change Logo</a>
                <a href="javascript:;" id="save-logo" title="Save changes">Save</a>
                |
                <a href="javascript:;" id="delete-logo" title="Delete logo">Delete Logo</a>
                <a href="javascript:;" id="cancel-logo" title="Cancel changes">Cancel</a>
              </div>

              <div id="logohelp">
                <input id="imageloc" type="text" size="50" value="" /><br />
                (max width: 540px, max height: 100px)
              </div>
              <img id="image" src="asset/bill/images/logo.png" alt="logo" />
            </div> -->
		
		</div>
		
		<div style="clear:both"></div>
		
		<div id="customer">

            <textarea id="customer-title"><%=rs1.getString("hotelname") %></textarea>

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td><textarea>000123</textarea></td>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td><textarea id="date"><%=rs.getString("bookingdate") %></textarea></td>
                </tr>
                <tr>
                    <td class="meta-head">Amount Due</td>
                    <td><div class="due"><%=rs.getString("amount") %></div></td>
                </tr>

            </table>
		
		</div>
	<% } %>		
		<table id="items">
		
		  <tr>
		      <th>Item</th>
		      <th>Description</th>
		      <th>Unit Cost</th>
		      <th>Quantity</th>
		      <th>Price</th>
		  </tr>
		  
		  <tr class="item-row">
		      <td class="item-name"><div class="delete-wpr"><textarea>Web Updates</textarea><!-- <a class="delete" href="javascript:;" title="Remove row"></a> --></div></td>
		      <td class="description"><textarea>Monthly web updates for http://widgetcorp.com (Nov. 1 - Nov. 30, 2009)</textarea></td>
		      <td><textarea class="cost"><%=rs.getString("amount") %></textarea></td>
		      <td><textarea class="qty">1</textarea></td>
		      <td><span class="price"><%=rs.getString("amount") %></span></td>
		  </tr>
		  
		  <tr class="item-row">
		      <!-- <td class="item-name"><div class="delete-wpr"><textarea>SSL Renewals</textarea><a class="delete" href="javascript:;" title="Remove row">X</a></div></td>

		      <td class="description"><textarea>Yearly renewals of SSL certificates on main domain and several subdomains</textarea></td>
		      <td><textarea class="cost">$75.00</textarea></td>
		      <td><textarea class="qty">3</textarea></td>
		      <td><span class="price">$225.00</span></td> -->
		  </tr>
		  
		  <tr id="hiderow">
		    <!-- <td colspan="5"><a id="addrow" href="javascript:;" title="Add a row">Add a row</a></td> -->
		  </tr>
		  
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Subtotal</td>
		      <td class="total-value"><div id="subtotal"><%=rs.getString("amount") %></div></td>
		  </tr>
		  <tr>

		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Total</td>
		      <td class="total-value"><div id="total"><%=rs.getString("amount") %></div></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Amount Paid</td>

		      <td class="total-value"><textarea id="paid"><%=rs.getString("amount") %></textarea></td>
		  </tr>
		 
		
		</table>
	
		<div id="terms">
		  <h5>Terms</h5>
		  <textarea>NET 30 Days. Finance Charge of 1.5% will be made on unpaid balances after 30 days.</textarea>
		</div>
	
	</div>
	
</body>
<%} %>
</html>
<%}%>