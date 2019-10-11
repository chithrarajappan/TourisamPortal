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
<jsp:include page="header/foreignheader.jsp"></jsp:include>
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <%@page import="java.sql.*" %>
    <%
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
	Statement stmt=con.createStatement();	
	String destination=request.getParameter("place");
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
          <h1 class="h3 mb-2 text-gray-800">Tourist Places</h1>
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
                
                      <th>District</th>
                      <th>Description</th>
                      <th>Nearest Attractions</th> 
                      <th>Image</th>               
                    </tr>
                  </thead>
                 
                  <tbody>
                  <%
                    int count=1;
		   //SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district
					String sql="SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district where tbl_touristplace.state=tbl_state.sid and tbl_touristplace.district=tbl_district.did and tbl_touristplace.touristplace='"+destination+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						String des=rs.getString("description");
						int start = 0; 
						int end = 99; 
						char description[] = new char[end - start]; 
						des.getChars(start, end, description, 0);
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString("touristplace")%></td>
						
						<%-- <td><%=rs.getString("sname")%></td>
						 --%>
						 <td><%=rs.getString("districtname") %></td>
						<td class="bs-example"><%=description%>... 
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-title="<%=des%>">View More</button>
						  	<!-- Modal HTML -->
					    <div id="myModal" class="modal fade">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times" aria-hidden="true"></i></button>
					                    <h4 class="modal-title"></h4>
					                </div>
					               
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					                </div>
					            </div>
					        </div>
					    </div>
					    </td>
						  
						  <td><%=rs.getString("pointof_interest") %></td>
						<td><img src="../uploads/<%=rs.getString("image")%>" width="50px" height="50px"></td>
						 <td><a href="viewplacedetails.jsp?id=<%=rs.getString("id") %>"><button class="btn btn-info">Details</button></a>
	                    <%--<td><a href="moretouristplace.jsp?id=<%=rs.getString("touristplace")%>"><button class="btn btn-info">Images</button></a></td> --%>
						                   
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#myModal").on('show.bs.modal', function(event){
        var button = $(event.relatedTarget);  // Button that triggered the modal
        var titleData = button.data('title'); // Extract value from data-* attributes
        $(this).find('.modal-title').text(titleData + ' Details');
    });
});
</script>
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
    