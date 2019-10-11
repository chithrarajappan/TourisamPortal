<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");
%>
<%@ page import="java.sql.*" %>
<%
	String packagetype=request.getParameter("packagetype");
	String packagename=request.getParameter("packagename");
	String placevisting=request.getParameter("placevisting");
	String description=request.getParameter("description");
	String num_cat=request.getParameter("num_cat");
	String c1=request.getParameter("category-1");
	String c2=request.getParameter("category-2");
	String c3=request.getParameter("category-3"); 
	String c4=request.getParameter("category-4"); 
	String c5=request.getParameter("category-5");
	String c6=request.getParameter("category-6");
	String c7=request.getParameter("category-7"); 
	String namount=request.getParameter("nativeamount");
	String famount=request.getParameter("foreignamount");
	String inclusions="";
	String lang[]=request.getParameterValues("inclusions");
	
	for(int i=0;i<lang.length;i++){
		inclusions+=lang[i]+" ";
	}
	String exclusions="";
	String lang1[]=request.getParameterValues("exclusions");
	for(int i=0;i<lang1.length;i++){
		exclusions+=lang1[i]+" ";
	}
	String transportation=request.getParameter("transport");
	
out.print(packagetype);out.print(packagename);out.print(placevisting);
out.print(description);out.print(num_cat);out.print(c1);
out.print(c2);out.print(c3);out.print(c4);
out.print(c5);out.print(c6);out.print(c7);
out.print(namount);out.print(famount);out.print(inclusions);out.print(exclusions	);out.print(transportation);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();
	try
	{
		PreparedStatement ps=con.prepareStatement("INSERT INTO tbl_agentpackages(packageid,package_name,placestovisit,description,no_of_days,day1,day2,day3,day4,day5,day6,day7,nativeamount,foreignamount,inclusions,exclusions,transportation,logid) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,packagetype);
        ps.setString(2,packagename);
        ps.setString(3,placevisting);
        ps.setString(4,description);
        ps.setString(5,num_cat);
        if(c1!=null)
        {
        	ps.setString(6,c1);
        }
        else
        {
        	ps.setString(6,"null");
        } 
        if(c2!=null)
        {
        	ps.setString(7,c2);
        }
        else
        {
        	ps.setString(7,"null");
        } 
        if(c3!=null)
        {
        	ps.setString(8,c3);
        }
        else
        {
        	ps.setString(8,"null");
        } 
        if(c4!=null)
        {
        	ps.setString(9,c4);
        }
        else
        {
        	ps.setString(9,"null");
        } 
        if(c5!=null)
        {
        	ps.setString(10,c5);
        }
        else
        {
        	ps.setString(10,"null");
        } 
        if(c6!=null)
        {
        	ps.setString(11,c6);
        }
        else
        {
        	ps.setString(11,"null");
        }
        if(c7!=null)
        {
        	ps.setString(12,c7);
        }
        else
        {
        	ps.setString(12,"null");
        } 
        ps.setString(13,namount);
        ps.setString(14,famount);
        ps.setString(15,inclusions);
        ps.setString(16,exclusions);
        ps.setString(17,transportation);
        ps.setString(18,id);
        int i=ps.executeUpdate();	
        if(i>0)
        {
        	 out.println("alert('Succsess');");
         	response.sendRedirect("addingpackageagent.jsp");
        }
	}
	catch(Exception e)
	{
		out.println(e);
		 out.println("alert('error');");
 		response.sendRedirect("addingpackageagent.jsp");
		  

	}

%>