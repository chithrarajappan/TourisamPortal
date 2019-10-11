<jsp:include page="header/header.jsp"></jsp:include>
 
 <%@ page import="java.sql.*"%>
<%
	    if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
	   {
	     response.sendRedirect("../index.jsp"); 
	   } 
	String user=(String)session.getAttribute("user"); 
	String uid=(String)session.getAttribute("uid");
	String category=(String)session.getAttribute("category");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();

%>
<%
	String sql="select * from tbl_hoteldetails where hotelid='"+uid+"'";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		%>

				<section class="ftco-about d-md-flex">
		    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 " style="background-color: #fbfbfb;">
		  <div class="card-body p-0">
		    <!- Nested Row within Card Body -->
		    <div class="row">
		    		<img src="../uploads/<%=rs.getString(24)%>">
		      <div class="col-lg-12">
		        <div class="p-5">
		          <div class="text-center">
		           <h2 class="mb-4"><b><i><u><button data-toggle="modal" data-target="#exampleModal1"><font color="green">Hotel Id:</font></button></u></i></b><br/><%=rs.getString(2)%></h2>
		           
		          </div>
		        <h2><p><%=rs.getString(3)%></p></h2>
		        <h2>Account No:<p><%=rs.getString(4)%></p></h2>	
		        	
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		
    </section>
		


<%	}
	else
	{
		%>
		<center>
		    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 " style="background-color: silver;">
		  <div class="card-body p-0">
		    <!- Nested Row within Card Body -->
		    <div class="row">
		      <div class="col-lg-12">
		        <div class="p-5">
		          <div class="text-center">
		            <h1 class="h4 text-gray-900 mb-4">Update Your Profile!</h1>
		          </div>
		          <a href="hoteldetails.jsp"><h2>UPDATE</h2></a>
		
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		</center>
		
<%

	}
%>




 </div>
<jsp:include page="footer/footer.jsp"></jsp:include>  