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
<jsp:include page="header/foreignheader.jsp"></jsp:include>
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
					String sql="SELECT * FROM tbl_homestaydetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_homestaydetails.hotelid and tbl_homestaydetails.hotelid='"+aid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						String carpark=rs.getString("carpark");
                        String wifi=rs.getString("wifi");
                        String laundery=rs.getString("laundry");
                        String ac=rs.getString("ac");
                       
					%>
		    		
          
          
          
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          				<h2><i><%=rs.getString("hotelname")%></i>&nbsp;&nbsp;Homestay<a href="bookhomestay.jsp?id=<%=aid%>"><button style="float:right"; type="button" class="btn btn-warning py-2 px-7"><i>Book Now</i></button></a></h2>
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
		    	    
          		
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"> <%=rs.getString("address") %>,<%=rs.getString("street") %>,<%=rs.getString("city") %></i></a></span>
          						
 					</p>
    				<p><%=rs.getString("about") %></p>
    					<div class="d-md-flex mt-5 mb-5">
    					<p><h5><b>Attractions : &nbsp;&nbsp;</b></h5><%=rs.getString("nearby") %></p>
    						</div>
    					<div class="d-md-flex mt-5 mb-5">
    						<ul>
 	  							<li><h2>Features</h2></li>
    					   <% if(carpark.equals("yes"))%>
    					   <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("car parking is available at resort");%>
    					   </li>  
    						 <% if(wifi.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("WiFi is made available at resort and its sorroundings");%>
    						 </li>
    						 <% if(laundery.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Laundery services are available");%>
    						 </li>
    						 <% if(ac.equals("yes")) %>
			                 <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println("Air conditioned rooms ar available");%>
    						 </li>
		                    </ul>
		                    <ul class="ml-md-5">
							<li><h2>Room Rates</h2></li>
		                   <li><b>Single Room &nbsp;&nbsp;   :&nbsp; </b><i class="fa fa-rupee" style="font-size:24px"><%=rs.getString("single") %></i></li>
		                   <li><b>Double Room &nbsp;:&nbsp; </b><i class="fa fa-rupee" style="font-size:24px"><%=rs.getString("doubl") %></i></li>
		                  
		                    </ul>
		                    </div>
		       
		                    <h2>Fixed Service Charges &nbsp;&nbsp;</h2><i class="fa fa-rupee" style="font-size:24px"> <%=rs.getString("amountcharges") %></i> /per Room<a href="bookhomestay.jsp?id=<%=aid%>"><button style="float:right"; type="button" class="btn btn-warning py-2 px-7"><i>Book Now</i></button></a>
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
   <%--  <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Related Place</h2>
          		
    	</div>
    	<div class="container-fluid">
    	<div class="row">
		              <%
    	String sql1="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_touristplace.district=tbl_district.did ORDER BY tbl_touristplace.id DESC limit 3";
		ResultSet rs1=stmt.executeQuery(sql1);
		while(rs1.next())
		{
			String des=rs1.getString("description");
			int start = 0; 
			int end = 99; 
			char description[] = new char[end - start]; 
			des.getChars(start, end, description, 0);
        %>
    
    		
    			<div class="col-sm col-md-3 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(uploads/<%=rs1.getString("image")%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-link"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#"><%=rs1.getString("touristplace") %>, <%=rs1.getString("sname") %></a></h3>
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
    						<p><span class="claimedRight" maxlength="15"><%=description%>... </span></p>
    						<p class="days"><span></span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=rs1.getString("address") %></span> 
    							<span class="ml-auto"><a href="viewplacedetails.jsp?id=<%=rs1.getString("id")%>">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<%
		        }
    			%>
		              
		              
		</div>
		</div>                
		       </div>
          		</div>
          		</section>
 --%>
         
           		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
          			<h4 class="mb-4">Related Hotels</h4>
          			<div class="row">
          				<div class="col-md-4">
				    	<div class="destination">
				    				
		<%
		String sql21="SELECT * FROM tbl_hoteldetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_hoteldetails.hotelid";
		ResultSet rs21=stmt.executeQuery(sql21);
		while(rs21.next())
		{
			String about=rs21.getString("about");
			int start = 0; 
			int end = 99; 
			
			char abt[] = new char[end - start]; 
			about.getChars(start, end, abt, 0);
		%>
		
 				
				    <a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(uploads/<%=rs21.getString("image")%>);">
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
		    						int star=rs21.getInt("starrate");
		    						for(int i=0;i<star;i++) 
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
    						<p><span class="claimedRight" maxlength="15"><%=abt%>...</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=rs21.getString("address")%>,<%=rs21.getString("street")%></span> 
    							<span class="ml-auto"><a href="viewhoteldetails.jsp?id=<%=rs21.getString("logid")%> ">Discover</a></span>
    						</p>
    					</div>
		<%
		}
        %>
				  
				   	</div>
  				</div>
  		
  				
  				
          	</div>
          </div> <!-- .col-md-8 -->
          
                   
           		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
          			<h4 class="mb-4">Related Homestays</h4>
          			<div class="row">
          				<div class="col-md-4">
				    	<div class="destination">
				    				
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
    							<span class="ml-auto"><a href="viewhomestaydetails.jsp?id=<%=rs22.getString("logid")%>">Discover</a></span>
    						</p>
    					</div>
		       <%
		        }
                %>
				  
				   	</div>
  				</div>
  		
  				
  				
          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

<!-- 	<section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </section> -->

<jsp:include page="footer/footer.jsp"></jsp:include>
<% } %>		    					
		    					
		    					
		    					
		    					
		 
		       