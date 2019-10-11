 <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user"); 
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
          <h1 class="h3 mb-2 text-gray-800">Offers By Agents</h1>
<!--           <p class="mb-4">In this table show the all Autherized Hotels/HomeStays ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    <th>SI.No</th>
                      <th>Offer Name</th>
                      <th>Places</th>
                      <th>Days</th>
                      <th>amount</th>
                      <th>Food &<br/>Accomodation</th>
                      <th>Description</th>                
                   <th>Agency Name</th>
                    
                  </thead>
                  <tfoot>
                    <tr>
                    <th>SI.No</th>
                      <th>Offer Name</th>
                      <th>Places</th>
                      <th>Days</th>
                      <th>amount</th>
                      <th>Food &<br/>Accomodation</th>
                      <th>Description</th>                
                   <th>Agent Name</th>
                    </tr>                </tfoot>
                  <tbody>
                   <%
                    int count=1;
                    Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
					Statement stmt=con.createStatement();	
					String sql="select * from tbl_agentoffers INNER JOIN tbl_agencyregister ON tbl_agentoffers.agentid where tbl_agentoffers.agentid=tbl_agencyregister.logid and tbl_agentoffers.status='0';";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{			
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString("offername") %></td>
						<td><%=rs.getString("places") %></td>
						<td><%=rs.getString("days") %></td>
						<td><%=rs.getString("amount") %></td>
						<td><%=rs.getString("foodaccomodation") %></td>
						<td><%=rs.getString("description") %></td>
						<td><%=rs.getString("agency_name") %></td>
						<form action="offerapprovereject.jsp" method="post">
						<input type="hidden" name="id" value="<%=rs.getString("id")%>">
           				 <td><button class="btn btn-success" type="submit" name="approve">Approve</button><br/><br/>
           				  <button class="btn btn-warning" type="submit" name="reject">Reject</button></td>
	                    </form>
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
<% }  %>  