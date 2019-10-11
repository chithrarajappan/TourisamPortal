 <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
%>
<jsp:include page="header/nativeheader.jsp"></jsp:include>
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	%>
	
 <section class="ftco-section" id="hotels">
    	<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Hotels</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    	<%
    	String sql21="SELECT * FROM tbl_hoteldetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_hoteldetails.hotelid";
		ResultSet rs21=stmt.executeQuery(sql21);
		while(rs21.next())
		{
			String abt=rs21.getString("about");
			int start = 0; 
			int end = 75; 
			char abut[] = new char[end - start]; 
			abt.getChars(start, end, abut, 0);
        %>
    
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../uploads/<%=rs21.getString("image")%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-link"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#"><%=rs21.getString("hotelname") %>, <%=rs21.getString("nearbyattractions") %></a></h3>
		    						<p class="rate">
		    						<% 
		    						int star=rs21.getInt("starrate"); %> 
		    						<%for(int i=0;i<star;i++) 
    								{	%>
    									<i class="icon-star"></i>
    							<%	} %> 
    							<font size="5px"><span><%=rs21.getString("starrate")%></span></font>&nbsp;Star Hotel
    						</p>
	    						</div>
	    						<div class="two">
<!-- 	    							<span class="price per-price"><br><small></small></span>
     -->							</div>
    						</div>
    						<p><span class="claimedRight" maxlength="15"><%=abut %>...</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=rs21.getString("address") %>,<%=rs21.getString("street") %></span> 
    							<span class="ml-auto"><a href="viewhoteldetails.jsp?id=<%=rs21.getString("logid")%>">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>  
    			<%} %>
    			</div>
    	  	</div>
    </section>

<section class="ftco-section" id="hotels">
    	<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4"><strong>Popular</strong> Homestays</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    	<%
    	String sql22="SELECT * FROM tbl_homestaydetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_homestaydetails.hotelid";
		ResultSet rs22=stmt.executeQuery(sql22);
		while(rs22.next())
		{
			String abt=rs22.getString("about");
			int start = 0; 
			int end = 75; 
			char abut[] = new char[end - start]; 
			abt.getChars(start, end, abut, 0);
        %>
    
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(uploads/<%=rs22.getString("image")%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-link"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#"><%=rs22.getString("hotelname") %>, <%=rs22.getString("nearby") %></a></h3>
		    						 
    							
	    						</div>
	    						<div class="two">
<!-- 	    							<span class="price per-price"><br><small></small></span>
     -->							</div>
    						</div>
    						<p><span class="claimedRight" maxlength="15"><%=abut %>...</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=rs22.getString("address") %>,<%=rs22.getString("street") %></span> 
    							<span class="ml-auto"><a href="viewhomestaydetails.jsp?id=<%=rs22.getString("id")%>">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>  
    			<%} %>
    			</div>
    	  	</div>
    </section>
    
<jsp:include page="footer/footer.jsp"></jsp:include>
<%}%>