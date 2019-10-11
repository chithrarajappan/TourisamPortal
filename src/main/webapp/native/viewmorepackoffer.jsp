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
                    String aid=request.getParameter("aid");
				    String pid=request.getParameter("pid");
                    int count=1;
					String sql="SELECT * FROM tbl_agentpackages INNER JOIN tbl_package on tbl_package.id=tbl_agentpackages.packageid where tbl_agentpackages.id='"+pid+"' and tbl_agentpackages.logid='"+aid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						String in=rs.getString("inclusions");
						String[] inc=in.split(",");
						String ex=rs.getString("exclusions");
						String[] exc=ex.split(",");
					%>
		    		
          
          
          
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 ftco-animate">
          			<div class="single-slider owl-carousel">
          				<div class="item">
          				<h2><i><%=rs.getString("package_name")%></i><a href="bookpackage.jsp?id=<%=aid%>&&pid=<%=pid%>"><button style="float:right"; type="button" class="btn btn-warning py-2 px-7"><i>Book Now</i></button></a></h2>
          					<div class="hotel-img" style="background-image: url(../uploads/<%=rs.getString("packimage")%>);"></div>	
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
          			<span><%=rs.getString("packname")%></span>
          			<h2><%=rs.getString("package_name")%></h2>
		    	
          		
          			<p class="rate mb-5">
          				<span class="loc"><a href="#"><i class="icon-map"> <%=rs.getString("placestovisit") %></i></a></span>
          						
 					</p>
    				<p><%=rs.getString("description") %></p>
    					<div class="d-md-flex mt-5 mb-5">
    						<ul>
 	  					
    					<li><h2>Spending Days</h2></li>
    					<%
    					int n=rs.getInt("no_of_days");
    					%>
 						
    					<%
   						for(int i=1;i<=n;i++)
   						{
   						//out.print("day"+i);
    					String r=rs.getString("day"+i);
    					%>
 	   						<ul>
 	  							<li><b><%out.print("Day "+ i +" :  "); %></b><%=r %></li>
   							</ul>
	                    <%
	    						}
   	 					%> 
   	 						<ul class="ml-md-5">
	    							<li></li>
	    							<li></li>
	    							<li></li>
	    							<li></li>
	    					</ul>
    						</div>
    					<div class="d-md-flex mt-5 mb-5">
    						<ul>
 	  					
    					<li><h2>Inclusions</h2></li>
    					<%
    					 for(int i=0; i < inc.length; i++){
    					    
    						 %><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println(inc[i]+"<br/>");%>
    						 </li> 
			            <%
		                    }%>
		                    </ul>
		                    <ul class="ml-md-5">
							<li><h2>Exclusions</h2></li>
		                    <%
    					 for(int i=0; i < exc.length; i++){

    						 %><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						 <% out.println(exc[i]+"<br/>");%>
    						 </li> 
			         <%
		                    }
		                    %>
		                    </ul>
		                    </div><br/>
		       
		                    <h2>Package Amount &nbsp;&nbsp;</h2><i class="fa fa-rupee" style="font-size:24px"> <%=rs.getString("nativeamount") %></i>/ Head
		                     <h4>View Agency details <a href="viewagencydetails.jsp?id=<%=rs.getString("logid") %>">click here</a></h4>	
		                    	
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

<!--  <section class="ftco-section-parallax">
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
      </div></section>
 -->



<jsp:include page="footer/footer.jsp"></jsp:include>
<% } %>		    					
		    					
		    					
		    					
		    					
		 
		       