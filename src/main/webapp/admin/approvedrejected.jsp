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
    <div class="container">
    <div class="card-body p-0">
    <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
	<form action="" method="post">
    <select class="form-control form-control-user" name="option">
           <option selected>Select Category</option>
           <option value="1">Approved</option>
           <option value="2">Rejected</option>
	</select>
	<button class="btn btn-success" type="submit" name="opt">Submit</button>
	</form>
	</div></div>
	</div>
	</div>
	

                  
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();	
if(request.getParameter("opt")!=null)
{
	String option=request.getParameter("option");
	String sql="select * from tbl_agentoffers INNER JOIN tbl_agencyregister ON tbl_agentoffers.agentid where tbl_agentoffers.agentid=tbl_agencyregister.logid and tbl_agentoffers.status='"+option+"'";
	ResultSet rs=stmt.executeQuery(sql);
	%>
			          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                   
                      <th>Offer Name</th>
                      <th>Places</th>
                      <th>Days</th>
                      <th>amount</th>
                      <th>Food &<br/>Accomodation</th>
                      <th>Description</th>                
                   <th>Agency Name</th>
                    
                  </thead>
                  <tbody>
	<% while(rs.next()){
		%>
		

		
                 <tr>
                        
						<td><%=rs.getString("offername") %></td>
						<td><%=rs.getString("places") %></td>
						<td><%=rs.getString("days") %></td>
						<td><%=rs.getString("amount") %></td>
						<td><%=rs.getString("foodaccomodation") %></td>
						<td><%=rs.getString("description") %></td>
						<td><%=rs.getString("agency_name") %></td>					
						</tr>
                    
			<%}
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