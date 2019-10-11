 <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
%>
<style type="text/css">
    .bs-example{
    	margin: 20px;
    }
</style>
<jsp:include page="header/nativeheader.jsp"></jsp:include>
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	
	%>

	<section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Find City</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Destination, City">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="" id="" class="form-control" placeholder="Keyword search">
	                      <option value="">Select Location</option>
	                      <option value="">San Francisco USA</option>
	                      <option value="">Berlin Germany</option>
	                      <option value="">Lodon United Kingdom</option>
	                      <option value="">Paris Italy</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
		              </div>
		              <div class="form-group">
		              	<div class="range-slider">
		              		<span>
										    <input type="number" value="25000" min="0" max="120000"/>	-
										    <input type="number" value="50000" min="0" max="120000"/>
										  </span>
										  <input value="1000" min="0" max="120000" step="500" type="range"/>
										  <input value="50000" min="0" max="120000" step="500" type="range"/>
										  </svg>
										</div>
		              </div>
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap ftco-animate">
        			<h3 class="heading mb-4">Star Rating</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>
          
          
          			 <%
                    String aid=request.getParameter("id");
                    int count=1;
					String sql="SELECT * FROM tbl_hoteldetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_hoteldetails.hotelid and tbl_hoteldetails.hotelid='"+aid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						String carpark=rs.getString("carpark");
                        String gym=rs.getString("gym");
                        String wifi=rs.getString("wifi");
                        String restaurent=rs.getString("restaurent");
                        String laundery=rs.getString("laundery");
                        String bar=rs.getString("bar");
                        String ac=rs.getString("ac");
                        String spa=rs.getString("spa");
                        String pool=rs.getString("pool");
						String playground=rs.getString("playground");
						String conference=rs.getString("conference");
						String wheelchair=rs.getString("wheelchair");
					%>
		    		
          
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">	
          			<div class="single-slider owl-carousel">
          				<div class="item">
          				<h2><i><%=rs.getString("hotelname")%></i>&nbsp;&nbsp;Hotel<a href="bookhotel.jsp?id=<%=aid%>"><button style="float:right"; type="button" class="btn btn-warning py-2 px-7"><i>Book Now</i></button></a></h2>
          					<div class="hotel-img" style="background-image: url(../uploads/<%=rs.getString("image")%>);"></div>
          				</div>
          				
          				
          			<!-- 	<div class="item">
          					<div class="hotel-img" style="background-image: url(images/hotel-3.jpg);"></div>
          				</div>
          				<div class="item">
          					<div class="hotel-img" style="background-image: url(images/hotel-4.jpg);"></div>
          				</div> -->
          			
          			</div>
          		</div>
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<span></span>
          			<h2><%=rs.getString("hotelname")%></h2>
		    	    <span><%=rs.getString("starrate")%>&nbsp; Star Rate</span>
          		
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"> <%=rs.getString("address") %>,<%=rs.getString("street") %>,<%=rs.getString("city") %></i></a></span>
          						
 					</p>
    				<p><%=rs.getString("about") %></p>
    					<div class="d-md-flex mt-5 mb-5">
    					<p><h5><b>Attractions : </b></h5>&nbsp;<%=rs.getString("nearbyattractions") %></p>
    						</div>
    					<div class="d-md-flex mt-5 mb-5">
    						<ul>
 	  					
    					<li><h2>Features</h2></li>
    					   <% if(carpark.equals("yes"))%>
    					   <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("car park");%>
    					   </li> 
			                <% if(gym.equals("yes")) %>
			                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Gym");%>
    						 </li> 
    						 <% if(wifi.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("WiFi");%>
    						 </li>
    						 <% if(restaurent.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Restaurent");%>
    						 </li>
    						 <% if(laundery.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Laundery");%>
    						 </li>
    						 <% if(bar.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Bar");%>
    						 </li>
    						 <% if(ac.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Ac");%>
    						 </li>
    						 <% if(spa.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Spa");%>
    						 </li>
    						 <% if(pool.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Pool");%>
    						 </li>
    						 <% if(playground.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Playground");%>
    						 </li>
    						 <% if(conference.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Conference");%>
    						 </li>
    						 <% if(wheelchair.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Wheelchair");%>
    						 </li>
		                    </ul>
		                    <ul class="ml-md-5">
							<li><h2>Room Rates</h2></li>
		                   <li><b>Single Room &nbsp;&nbsp;   :&nbsp; </b><%=rs.getString("single") %></li>
		                   <li><b>Double Room &nbsp;:&nbsp; </b><%=rs.getString("doubl") %></li>
		                   <li><b>Family Room &nbsp; :&nbsp; </b><%=rs.getString("family") %></li>
		                   <li><b>Dormitory &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  :&nbsp; </b><%=rs.getString("dormitory") %></li>
		                    </ul>
		                    </div>
		       
		                    <h2>Fixed Service Charge &nbsp;&nbsp;</h2><i class="fa fa-rupee" style="font-size:24px"> <%=rs.getString("amountcharges") %></i>/per Room<a href="bookhotel.jsp?id=<%=aid%>"><button style="float:right"; type="button" class="btn btn-warning py-2 px-7"><i>Book Now</i></button></a>
		                    	 	<br/><br/>
    				<div class="placedetails">
    					<div class="img img-12 d-flex justify-content-center align-items-center"><%=rs.getString("maplink") %>
    						</div><div class="icon d-flex justify-content-center align-items-center">
    							<!-- <span class="icon-link"></span>
    					 -->	</div></div>
		                    	
		                    	<%} %>
		                    	</div>
		    					</div>
		    					</div>
		    					
		    							
    			
    <!--<p>Related places/similar places</p>-->      		
    		</div>
    	       
          	<section class="ftco-about d-md-flex" style="height:200px">   	
		</section>

        </div>
      </div>
    </section> <!-- .section -->
<jsp:include page="footer/footer.jsp"></jsp:include>
<% } %>		    						    					
		    					
		    					
		    					
		 
		       