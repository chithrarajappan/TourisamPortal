<jsp:include page="header/header.jsp"></jsp:include>
	
 <%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();	
%>
</div>

<div class="container-fluid">

	<section class="ftco-section">
    	<div class="container">
    	    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">See our latest packages</h2>
          </div>
        </div>
        <div class="row">
        <%
        String sql="SELECT * FROM tbl_package ";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
        %>
       
        	<div class="col-md-6 ftco-animate">
        		<a href="readmorepackageoffer.jsp?id=<%=rs.getString(1)%>" class="destination-entry img" style="background-image: url(uploads/<%=rs.getString(3)%>);">
        			<div class="text text-center">
        				<h3><%=rs.getString(2)%></h3>
        			</div>
        		</a><br/>
        	</div>  
        <%
        } %>
        
        </div>
      </div>
    </section>
	 		
</div>



<jsp:include page="footer/footer.jsp"></jsp:include>
