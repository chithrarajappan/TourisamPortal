 <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
%>
<jsp:include page="header/foreignheader.jsp"></jsp:include>
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement st=con.createStatement();	
	String dn=request.getParameter("dname");
	  
	%>
   
    
	
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-8 heading-section text-center ftco-animate">
            <h2 class="mb-4">Place Details</h2>
          </div>
        
    		<div class="container-fluid">
    		 <%
String tp=request.getParameter("id");
    		 
	ResultSet resultset;
	String sql="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_touristplace.district=tbl_district.did and tbl_touristplace.id='"+tp+"'";
	
	resultset=st.executeQuery(sql);
	while(resultset.next()){
		String poi=resultset.getString("pointof_interest");
		String[] poiarry=poi.split(",");
		
	%>
	  		
	  		<div class="row">
    		
    			<%-- <div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="placedetails">
    					<a href="#" class="img img-6 d-flex justify-content-center align-items-center" ><img src="uploads/<%=resultset.getString("image") %>" width="500px" >
    						</a><div class="icon d-flex justify-content-center align-items-center">
    							<!-- <span class="icon-link"></span>
    					 -->	</div></div></div>
    	 --%>
    			<div class="col-sm col-md-12 col-lg ftco-animate">
    					 <div class="text p-3">
    					 <div class="d-flex">
    					 <div class="one">
    					 <p><a href="#" class="img img-6 d-flex  justify-content-center align-items-center" ><img src="../uploads/<%=resultset.getString("image") %>" width="500px" height="400px">
    					</a> 
		    			 <font size="4	px" color="black">	
    					 <u><b>Place:</b></u>    <u><%=resultset.getString("touristplace") %></u><br/><b>Description:</b>    <%=resultset.getString("description") %><br/><b>Address:</b>    <%=resultset.getString("address") %>
    					 </p></font></div>
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
    					 <font size="4px" color="black">
    					 <b>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</b>&nbsp;&nbsp;<%=resultset.getString("sname") %></u><br/>
    					 <b>District&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</b>&nbsp;&nbsp;<%=resultset.getString("districtname") %><br/>
    					 <b>By Train&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</b>&nbsp;&nbsp;You can reach by train from any part of India. Nearest railwaystation is&nbsp;<%=resultset.getString("nearest_railway") %><br/>
    					 <b>By Road&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</b>&nbsp;&nbsp;Bus service is available from all the places in Kerala. Nearest Bus stand is&nbsp;<%=resultset.getString("nearest_bus") %><br/>
    					 <b>Attractions&nbsp;:</b>&nbsp;&nbsp;
    					 The Major attractions to &nbsp;<b><u><%=resultset.getString("touristplace") %></u></b>&nbsp;is&nbsp;
    					 
    					 <%
    					 for(int i=0; i < poiarry.length; i++){
    						/*  out.println("<ul><li>"); */
			                
    						out.println(poiarry[i]+"</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
			                
    						/* out.println("</li></ul>"); */
			               
		                    }%>
    					 
    					 
    					 </font></div>
    					 </div>
    					 </div>
    					 </div>
    					 </div>
    					 <div class="row">
    					  <div class="col-sm col-md-12 col-lg ftco-animate">
    				<div class="placedetails">
    					<div class="img img-12 d-flex justify-content-center align-items-center" ><%=resultset.getString("map_link")%>
    						</div><div class="icon d-flex justify-content-center align-items-center">
    							<!-- <span class="icon-link"></span>
    					 -->	</div></div></div>
    	</div>
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


    <section class="ftco-section" id="places">
    	<div class="container">
		 <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Related Places</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    	<div class="row">
    	<%
    	
    	String sql2="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_district.districtname='"+dn+"'and tbl_touristplace.district=tbl_district.did ORDER BY tbl_touristplace.id DESC limit 3";
		ResultSet rs2=st.executeQuery(sql2);
		while(rs2.next())
		{
			String des=rs2.getString("description");
			int start = 0; 
			int end = 99; 
			char description[] = new char[end - start]; 
			des.getChars(start, end, description, 0);
        %>
    
    		
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../uploads/<%=rs2.getString("image")%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-link"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#"><%=rs2.getString("touristplace") %>, <%=rs2.getString("sname") %></a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>

		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price"></span>
    							</div>
    						</div>
    						<p><span class="claimedRight" maxlength="15"><%=description %>...</span></p>
    						<p class="days"><span></span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=rs2.getString("address") %></span> 
    							<span class="ml-auto"><a href="viewplacedetails.jsp?id=<%=rs2.getString("id")%>&&dname=<%=rs2.getString("districtname")%>">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<%
		        }
    			%>
    		</div>
    	</div>
    </section>

	
	<!-- <a href="placelist.jsp"><button class="btn btn-info">Back</button></a> -->


<jsp:include page="footer/footer.jsp"></jsp:include>
<% }%>