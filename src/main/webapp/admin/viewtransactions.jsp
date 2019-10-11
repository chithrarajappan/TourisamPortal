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

		
		
 <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <%@page import="java.sql.*" %>
    
   <!--validation for no entry for non registered user or direct access
    -->
    <%
    
    //if(session.getAttribute("user")==null)
    //response.sendRedirect("login.jsp");
    %>
    <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Bookings For Hotels</h1>
<!--           <p class="mb-4">In this table show the all Autherized Hotels/HomeStays ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Overall Hotel Bookings</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <thead>
                    <tr>
                      <th>SI.No</th>
                      <th>Customer Name</th>
                      <th>Phone</th>
                      <th>Address</th>
                      <th>Date of Booking </th>
                      <th>From Account</th>
                      <th>To Account</th>
                      <th>Amount</th>                
                   	  <th>Hotel ID</th>
                   	  <th>Room Type</th>
                   	  
                    </tr>                </thead>
                  <tbody>
                   <%
                    int count=1;
                   String sql="SELECT * FROM tbl_transaction INNER JOIN tbl_booking ON tbl_booking.id=tbl_transaction.bookingid ";

					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{			
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("phone") %></td>
						<td><%=rs.getString("address") %></td>
						<td><%=rs.getString("bookingdate") %></td>
						<td><%=rs.getString("fromaccount") %></td>
						<td><%=rs.getString("toaccount") %></td>
						<td><%=rs.getString("amount") %></td>
						<td><%=rs.getString("hotelid") %></td>
						<td><%=rs.getString("type1") %></td>

<%-- 						<form action="offerapprovereject.jsp" method="post">
						<input type="hidden" name="id" value="<%=rs.getString("id")%>">
           				 <td><button class="btn btn-success" type="submit" name="approve">Approve</button><br/><br/>
           				  <button class="btn btn-warning" type="submit" name="reject">Reject</button></td>
 --%>	                    </form>
                    </tr>
                    <%
                    }
                    %>
                   </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Bookings For Packages</h1>
<!--           <p class="mb-4">In this table show the all Autherized Hotels/HomeStays ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Overall Package Bookings</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <thead>
                    <tr>
                      <th>SI.No</th>
                      <th>Customer Name</th>
                      <th>Phone</th>
                      <th>Address</th>
                      <th>Date of Booking </th>
                      <th>From Account</th>
                      <th>To Account</th>
                      <th>Amount</th>                
                   	  <th>Agency ID</th>
                   	  <th>Number of Members</th>
                   	  
                    </tr>                </thead>
                  <tbody>
                   <%
                    int c=1;
                   String sql1="SELECT * FROM tbl_transactionpack INNER JOIN tbl_packagebook ON tbl_packagebook.id=tbl_transactionpack.bookingid ";

					ResultSet rs1=stmt.executeQuery(sql1);
					while(rs1.next())
					{			
					%>
                    <tr>
                        <td><%= c++%></td>
						<td><%=rs1.getString("name") %></td>
						<td><%=rs1.getString("phone") %></td>
						<td><%=rs1.getString("address") %></td>
						<td><%=rs1.getString("bookingdate") %></td>
						<td><%=rs1.getString("fromaccount") %></td>
						<td><%=rs1.getString("toaccount") %></td>
						<td><%=rs1.getString("amount") %></td>
						<td><%=rs1.getString("agencyid") %></td>
						<td><%=rs1.getString("number") %></td>

<%-- 						<form action="offerapprovereject.jsp" method="post">
						<input type="hidden" name="id" value="<%=rs.getString("id")%>">
           				 <td><button class="btn btn-success" type="submit" name="approve">Approve</button><br/><br/>
           				  <button class="btn btn-warning" type="submit" name="reject">Reject</button></td>
 --%>	                    </form>
                    </tr>
                    <%
                    }
                    %>
                   </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
  
  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>
		
		
		


<jsp:include page="footer/footer.jsp"></jsp:include>
<%}%>