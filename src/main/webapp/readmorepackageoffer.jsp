<jsp:include page="header/header.jsp"></jsp:include>
    
    
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	%>


<section class="ftco-section">
      <div class="container">
        <div class="row">
        	<div class="col-md-3 sidebar order-md-last ftco-animate">
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
		                <input type="text" id="checkin_date" class="form-control checkin_date" placeholder="Date from">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkout_date" class="form-control checkout_date" placeholder="Date to">
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
<!--         		<div class="sidebar-wrap ftco-animate">
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
 --> 
 
          </div><!-- END-->
          
		    		
          <div class="col-lg-9">
          	<div class="row">
          	
          			 <%
                    String aid=request.getParameter("id");
                    int count=1;
					String sql="SELECT * FROM tbl_agentpackages INNER JOIN tbl_package on tbl_package.id=tbl_agentpackages.packageid where tbl_agentpackages.packageid='"+aid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						//String st=rs.getString(2);		
					%>
		    			<div class="col-sm col-md-6 col-lg-6 ftco-animate">
		    				<div class="destination">
		    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(uploads/<%=rs.getString("packimage")%>);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-link"></span>
		    						</div>
		    					</a>
		    					
		    					
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h2><%=rs.getString("packname")%></h2>
				    						<h3><%=rs.getString("package_name")%></h3>
				    						<p class="rate">
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>  
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star-o"></i>
				    							<span>4 Rating</span>
				    						</p>
			    						</div>
			    						<div class="two">
			    							<span class="price per-price"><%=rs.getString("no_of_days") %><br><small>Days</small></span>
		    							</div>
		    						</div>
		    						<p><%=rs.getString("description") %></p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"> <%=rs.getString("placestovisit")%></i></span> 
		    							<span class="ml-auto">
		    		
		    							<a href="viewmorepackoffer.jsp?id=<%=rs.getString("id")%>"><button class="btn btn-info">View More</button></a></p>
		    		
		    					</div>
		    				</div>
		    			</div>
		    		
		    							<% }
		    					%>
		    			</div>
		    		</div>
          	<!-- div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		              </ul>
		            </div>
		          </div>
		        </div> -->
		        
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

		<section class="ftco-section-parallax">
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
    </section>
 --%>





<jsp:include page="footer/footer.jsp"></jsp:include> 