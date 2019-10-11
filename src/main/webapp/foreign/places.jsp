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
	Statement stmt=con.createStatement();	
	%>


    
    <section class="ftco-section" id="places">
    	<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Most Popular Tourist Places</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    	<div class="row">
    	<%
    	String sql1="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_touristplace.district=tbl_district.did";
		ResultSet rs1=stmt.executeQuery(sql1);
		while(rs1.next())
		{
			String des=rs1.getString("description");
			int start = 0; 
			int end = 99; 
			char description[] = new char[end - start]; 
			des.getChars(start, end, description, 0);
        %>
    
    		
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../uploads/<%=rs1.getString("image")%>);">
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
		    							<span>5 Rating</span>
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
    							<span><i class="icon-map-o"></i> <%=rs1.getString("address") %></span> 
    							<span class="ml-auto"><a href="viewplacedetails.jsp?id=<%=rs1.getString("id")%>&&dname=<%=rs1.getString("districtname")%>">Discover</a></span>
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

<jsp:include page="footer/footer.jsp"></jsp:include>
<%}%>