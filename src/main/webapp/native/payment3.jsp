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
String aid=request.getParameter("aid");
String pid=request.getParameter("pid");
String account=request.getParameter("acc");
String amount=request.getParameter("sum");


out.print(aid);out.print(pid);out.print(bid);out.print(id);
%>
	<style>
		table
		{
  border: 2px solid black;
  
  width: 40%
		}
		td
		{
			padding: 6px;
		}
	</style>

<%@page import="java.util.Date" %>
  <jsp:include page="header/nativeheader.jsp"></jsp:include>
  
<section class="ftco-section">
	<div class="container">
	
	<form action="paymentprocess3.jsp" class="menu-profile" method="post">
	
		<div style="background-color: #ede8ef;">
<input type="hidden" name="aid" value="<%=aid%>">
<input type="hidden" name="pid" value="<%=pid%>">
<input type="hidden" name="acc" value="<%=account%>">
<input type="hidden" name="sum" value="<%=amount%>">

<center>			<p>PAYMENT DETAILS</p>
				<font color="black" size="2px"><b>
<table class="t1" style="border-collapse: separate">
	<tr>
<th colspan="5" style="background-color:#8c8e91; align:center;" height="50px">Payment Details</th>
</tr>
<tr>
	<td colspan="5"></td>
</tr>
	<br><br>

<td colspan="2"> <label>Accepted Cards</label></td>

<td> <input type="radio" name="r1" value="v"><img src="asset/images/visa.png" width="60px">
     <input type="radio" name="r1" value="m"><img src="asset/images/mastercard.png" width="60px">
</td></tr>

<tr>
<td colspan="2"><label>Card Holder's Name</label></td>
<td><input type="text" name="cardname"></td>
</tr>

<tr>
<td colspan="2"><label>Card No:</label></td>

<td><input type="text" name="cardno"></td>
</tr>

<tr>
<td colspan="2"><label>Expire Date</label></td>

<td><input type="date" name="exdate"></td></tr>

<tr>
<td colspan="2"><label>CVV</label></td>
<td><input type="text" name="cvv"></td>
</tr>

<tr>
<td colspan="2"><input type="submit" name="cancel" value="Cancel"></td>
<td colspan="2"><input type="submit" name="sub" value="Continue"></td>

</tr>

</table>
</center>

					</b></font>

			</div>	</div>
				</form>
				</div></section>


				<jsp:include page="footer/footer.jsp"></jsp:include>
				 
		<%}%> 