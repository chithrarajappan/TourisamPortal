  <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
%>
<jsp:include page="header/header.jsp"></jsp:include>
 

    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement st=con.createStatement();	
	%>
   
    
	
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-8 heading-section text-center ftco-animate">
            <h2 class="mb-4">Place Details</h2>
          </div>
        </div>
    		<div class="container-fluid">
    		 <%
String tp=request.getParameter("id");
    		 
	ResultSet resultset;
	String sql="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_touristplace.district=tbl_district.did and tbl_touristplace.touristplace='"+tp+"'";
	
	resultset=st.executeQuery(sql);
	while(resultset.next()){
	%>
	  		
	  		<div class="row">
    		
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="placedetails">
    					<a href="#" class="img img-6 d-flex justify-content-center align-items-center" ><img src="../uploads/<%=resultset.getString("image") %>" width="500px" >
    						</a><div class="icon d-flex justify-content-center align-items-center">
    							<!-- <span class="icon-link"></span>
    					 -->	</div></div></div>
    	
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    					 <div class="text p-3">
    					 <div class="d-flex">
    					 <div class="one">
    					 <font size="5px">
    					 <u><b>Place:</b></u>    <u><%=resultset.getString("touristplace") %></u><br/><b>Description:</b>    <%=resultset.getString("description") %><br/><b>Address:</b>    <%=resultset.getString("address") %>
    					 </font></div>
    					 </div>
    					 </div>
    					 </div>
    				
    </div> 
    <br/>
    <br/><div class="row">
        					
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    					 <div class="text p-3">
    					 <div class="d-flex">
    					 <div class="one">
    					 <font size="5px">
    					 <b>State:</b>  <%=resultset.getString("sname") %></u><br/>
    					 <b>District:</b>    <%=resultset.getString("districtname") %><br/>
    					 <b>Nearest railway Station:</b>    <%=resultset.getString("nearest_railway") %><br/>
    					 <b>Nearest Bus Station:</b>    <%=resultset.getString("nearest_bus") %><br/>
    					 <b>Point of Interest:</b>    <%=resultset.getString("pointof_interest") %>
    					 
    					 </font></div>
    					 </div>
    					 </div>
    					 </div>
    					 </div>
    					 <div class="row">
    					  <div class="col-sm col-md-12 col-lg ftco-animate">
    				<div class="placedetails">
    					<div class="img img-12 d-flex justify-content-center align-items-center"><%=resultset.getString("map_link") %>
    						</div><div class="icon d-flex justify-content-center align-items-center">
    							<!-- <span class="icon-link"></span>
    					 -->	</div></div></div>
    	
    </div>
   	<%
	}
	%>
   
   </div>
    
	</div>
	</div>
	<!-- </div>
 -->

</section>
	
	<!-- <a href="placelist.jsp"><button class="btn btn-info">Back</button></a> -->


<jsp:include page="footer/footer.jsp"></jsp:include>
<% }%>