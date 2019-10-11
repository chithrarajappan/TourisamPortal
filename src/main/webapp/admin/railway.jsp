<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String railway=request.getParameter("count");
//out.print(state);
%>
 <label>Nearest Railway Station</label>
<select class="form-control" name="railway">
<option value="0"><font color="gray">Select Railway Station</font></option> 
<%
  Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("select * from tbl_railway where sid='"+railway+"'");  
   while(rs.next()){ 
   %>
       <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
  <% 
   } 
   %>
</select>  
 
