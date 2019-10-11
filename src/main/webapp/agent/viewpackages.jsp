<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
%>
<jsp:include page="header/header.jsp"></jsp:include>

    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	%>

<% String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");%>


<div class="col-lg-9">
          	<div class="row">
          	
          			 <%
                    int count=1;
					String sql="SELECT * FROM tbl_agentpackages INNER JOIN tbl_package on tbl_package.id=tbl_agentpackages.packageid where tbl_agentpackages.logid='"+id+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						//String st=rs.getString(2);		
					%>
		    			<div class="col-sm col-md-6 col-lg-6 ftco-animate">
		    				<div class="destination" style="background-color:white;">
		    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(../uploads/<%=rs.getString("packimage")%>);">
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






</div>
<jsp:include page="footer/footer.jsp"></jsp:include>
<%}%>