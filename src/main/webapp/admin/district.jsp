<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String state=request.getParameter("count");
//out.print(state);
%>
 <label>District</label>
<select class="form-control" name="district" onChange="showRailWay(this.value)">
<option value="0"><font color="gray">Select District</font></option> 
<%
  Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("select * from tbl_district where sid='"+state+"'");  
   while(rs.next()){ 
   %>
       <option value="<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
  <% 
   } 
   %>
</select>  
 
