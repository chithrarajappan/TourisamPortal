
 <%
 	if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
 	{
   response.sendRedirect("index.jsp"); 
 	}
 	else{
String user=(String)session.getAttribute("user");	 
%>
<jsp:include page="header/foreignheader.jsp"></jsp:include>
 <%@page import="java.sql.*" %>
	 
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();	
		%>
	
	<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 80%;
  }
  </style>
	
	
  <div class="carousel-inner carousel-fade">
    <div class="carousel-item active">
      <img src="asset/images/bag1.jpeg" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
         <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Let's<br>Wander</h1>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat, or visit from local experts</p>
          </div>
        </div>
      </div> 
      </div>   
    </div>
</div>
<br/>
<section class="ftco-section justify-content-end ftco-search">
    	<div class="container-wrap ml-auto">
    		<div class="row no-gutters">
          <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link active show" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Places</a>

              <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Hotels</a>

              <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Packages</a>
            </div>
          </div>
          <div class="col-md-10 tab-wrap">
            
            <div class="tab-content p-4 px-5" id="v-pills-tabContent">

              <div class="tab-pane fade active show" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
              	<form action="destinationsearch.jsp" method="post" name="des" class="search-destination">
              		<div class="row">
              			<div class="col-md align-items-end">
              				<div class="form-group">
              					<label for="#">Destination</label>
              					<div class="form-field">
	              					<div class="icon"><span class="icon-map-marker"></span></div>
					                <input type="text" class="form-control" name="place" id="place" placeholder="place">
					              </div>
				              </div>
              			</div>
              			<div class="col-md align-self-end">
              				<div class="form-group">
              					<div class="form-field">
					                <input type="submit" value="Search"  class="form-control btn btn-primary">
					              </div>
				              </div>
              			</div>
              		</div>
              	</form>
              </div>
              

              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
              	<form action="hotelsearch.jsp" method="post" class="search-destination">
              		<div class="row">
              			
              			<div class="col-md align-items-end">
              				<div class="form-group">
              					<label for="#">Place</label>
              					<div class="form-field">
	              					<div class="select-wrap">
			                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
<input type="text" class="form-control" name="place" id="place" placeholder="place">
			                           </div>
					              </div>
				              </div>
              			</div>
              			<div class="col-md align-items-end">
              				<div class="form-group">
              					<label for="#">Stay Type</label>
              					<div class="form-field">
	              					<div class="select-wrap">
			                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                      <select name="typestay" id="typestay" class="form-control">
			                      <option value="0">Select Stay type</option>
			                      	<option value="hotel">Hotel</option>
			                        <option value="homestay">Homestay</option>
			                        
			                       </select>
			                    </div>
					              </div>
				              </div>
              			</div>
						
						
              			
              			<div class="col-md align-self-end">
              				<div class="form-group">
              					<div class="form-field">
					                <input type="submit" value="Search" class="form-control btn btn-primary">
					              </div>
				              </div>
              			</div>
              		</div>
              	</form>
              </div>


              <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-effect-tab">
              	<form action="packagesearch.jsp" method="post" class="search-destination">
              		<div class="row">
              			<!-- <div class="col-md align-items-end">
              				<div class="form-group">
              					<label for="#">Days</label>
              					<div class="form-field">
	              					<div class="select-wrap">
			                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                      <select name="days" id="days" class="form-control">
			                        <option value="0">Select Days</option>
			                      	<option value="3">3 days</option>
			                        <option value="4">4 days</option>
			                        <option value="5">5 days</option>
			                        <option value="6">6 days</option>
			                        <option value="7">7 days</option>
			                       </select>
			                    </div>
					              </div>
              			</div></div> -->
              			<div class="col-md align-items-end">
              				<div class="form-group">
              					<label for="#">Package Type</label>
              					<div class="form-field">
	              					<div class="select-wrap">
			                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                     
			                      <select name="packtype" id="packtype" class="form-control">
			                      	<option value="0">Select Package</option>
			                      	 <%  String sql="SELECT * FROM `tbl_package`";
              						  ResultSet rs=stmt.executeQuery(sql);
              						  while(rs.next()){%>
			                        <option value="<%=rs.getString("id")%>"><%=rs.getString("packname")%></option>
			                        <% } %>
			                       </select>
			                    </div>
					              </div>
				              </div>
              			</div>
              			
              			<div class="col-md align-self-end">
              				<div class="form-group">
              					<div class="form-field">
					                <input type="submit" value="Search" class="form-control btn btn-primary">
					              </div>
				              </div>
              			</div>
              		</div>
              	</form>
              </div>
            </div>
          </div>
        </div>
    	</div>
    </section>
	
	

<section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
          
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          
              <h2>Write  Review...!!!</h2>
              <p>Write in short about a wonderful trip you have made..share it with us.... </p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-lg-12">
                  <form action="reviewprocess.jsp" class="review" method="post">
                    
                 <div class="form-group row">
                 <label><b>Email Id</b></label> 
                      <input type="text" class="form-control" placeholder="Enter email address" name="mail" value="<%=user%>" validate="">
                      </div>
                 <div class="form-group row">
                 <label><b>Name</b></label>
                      <input type="text" class="form-control" placeholder="Enter your Name" name="name" required="">	
                     </div>
                <div class="form-group row">
                 <label><b>Place Name</b></label>
                       <input type="text" class="form-control" placeholder="Enter Place Name" name="place" required="">
 				</div>
                <div class="form-group row">
                 <label><b>Description</b></label>
                       <textarea rows="" cols="" type="text" class="form-control" name="description" placeholder="Description (min 80 words)" required=""></textarea>
                 
  				</div>
                <div class="form-group row">
                   <input type="submit" value="Submit" class="submit px-3">
  				 </div>
  				 </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	
	
	
        <jsp:include page="footer/footer.jsp"></jsp:include>
        <% }%>