<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<table>
<form action="" method="post">
<tr>
<th colspan="4" style="background-color:">Payment Details</th>
</tr>
<tr>
</tr><tr>
</tr>
<tr>
<div class="from-group row">
<td colspan="2"> <label>Accepted Cards</label></td>
<td> <input type="radio" name="r1" value="v"><img src="asset/images/visa.png" width="60px">
     <input type="radio" name="r1" value="m"><img src="asset/images/mastercard.png" width="60px">
</td></div></tr>

<tr>
<div class="form-group">
<td colspan="2"><label>Card Holder's Name</label></td>
<td><input type="text" name="cardname"></td>
</div></tr>
<tr>
<div class="form-group">
<td colspan="2"><label>Card No/Account No</label></td>
<td><input type="text" name="cardno"></td>
</div></tr>

<tr>
<div class="form-group">
<td colspan="2"><label>Expire Date</label></td>
<td><input type="date" name="exdate"></td></div>
</tr>
<tr>
<div class="form-group">
<td colspan="2"><label>CVV</label></td>
<td><input type="text" name="cvv"></td>
</div></tr>
<br/>
<tr>
<div class="form-group">
<td colspan="2"><input type="reset" name="cancel" value="cancel"></td>
<td colspan="2"><input type="submit" name="sub" value="continue"></td>

</div></tr>
</form>
</table>

</center>
</body>
</html>
<%
if(request.getParameter("sub")!=null)
{
   String cardno=request.getParameter("cardno");
   String cvv=request.getParameter("cvv");
   Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	PreparedStatement ps=con.prepareStatement("select * from tbl_bank where cardno=? and cvv=?");
	ps.setString(1,cardno);
	ps.setString(2,cvv);
	ResultSet re=ps.executeQuery();
	if(re.next())
	{
		String username=re.getString("username");
		String balance=re.getString("balance");
		String id=re.getString("id");
		session.setAttribute("uid", id);
		response.sendRedirect("banktransfer.jsp?id="+id+"&&bal="+balance+"");
	}
	else{
		response.sendRedirect("bankconfirm.jsp");
	}
}
%>
