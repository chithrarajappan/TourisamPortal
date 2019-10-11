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
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	%>
    
   <!--validation for no entry for non registered user or direct access
    -->
    <%
    
    //if(session.getAttribute("user")==null)
    //response.sendRedirect("login.jsp");
    %>
    <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Place Details</h1>
   <!--       <p class="mb-4">In this table show the all Autherized Agenices ID</p>
 -->
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                    <th>SI.No</th>
                      <th>Place Name</th>
                      <th>Image</th>               
                    </tr>
                  </thead>
                  <tbody>
                  <%
                    int count=1;
		   //SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district
					String sql="SELECT * FROM tbl_moreplaceimg";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						//String st=rs.getString(2);		
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString("placename")%></td>
						<td><img src="../uploads/<%=rs.getString("moreimge")%>"></td>
						
						
						<td><a href="addplacedetails.jsp?placename=<%=rs.getString("placename") %>&&id=<%=rs.getString("id")%>"><button class="btn btn-info">Add Details</button></a>
						                   
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
<% }%>