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
<jsp:include page="header/nativeheader.jsp"></jsp:include>
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	String logid=request.getParameter("id");

	%>
  
    
            <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Agency Details</h1>
   <!--       <p class="mb-4">In this table show the all Autherized Agenices ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              </div>
            <div class="card-body">
            
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                 <tbody>
                  <%
					String sql="SELECT * FROM `tbl_agencyregister` INNER JOIN tbl_registeragent ON tbl_agencyregister.agencyid= tbl_registeragent.id WHERE tbl_agencyregister.logid='"+logid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						 
					%>
                    <tr><th>Agency Name</th><td><%=rs.getString("agency_name")%></td></tr>	
                    <tr><th>Agent Name</th><td><%=rs.getString("agent_name")%></td></tr> 
				    <tr><th>Address</th><td><%=rs.getString("address") %>,<%=rs.getString("street") %>,<%=rs.getString("city") %></td></tr>
				    <tr><th>Nationality</th><td><%=rs.getString("nationality") %></td></tr>
				    <tr><th>Email id</th><td><%=rs.getString("email_id") %></td></tr>
					<tr><th>Contact Number</th><td><%=rs.getString("contact_number") %></td></tr>
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
<% } %>