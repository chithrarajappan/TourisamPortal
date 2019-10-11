<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");
%>
<jsp:include page="header/header.jsp"></jsp:include>

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
          <h1 class="h3 mb-2 text-gray-800">News Letters</h1>
<!--           <p class="mb-4">In this table show the all Autherized Hotels/HomeStays ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All News Letters</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    <th>SI.No</th>
                      <th>Offer Name</th>
                      <th>description</th>
                      <th>Validity</th>
                      <th>Last date of Booking</th>                
                   <th>Contact</th>
                    <th>Image</th></tr>
                  </thead>
                  <tfoot>
                    <tr>
                    <th>SI.No</th>
                      <th>Offer Name</th>
                      <th>description</th>
                      <th>Validity</th>
                      <th>Last date of Booking</th>                
                   <th>Contact</th>
                    </tr>                </tfoot>
                  <tbody>
                   <%
                    int count=1;
                    Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
					Statement stmt=con.createStatement();	
					String sql="select * from tbl_newsletter";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{			
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
           				 <td><img src="../uploads/<%=rs.getString("image")%>" width="50px" height="50px"></td>
						 <td><a href="addoffers.jsp?id=<%=rs.getString("id")%>"><button class="btn btn-info">Add offer</button></a>
	                    
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