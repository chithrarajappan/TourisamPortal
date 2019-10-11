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
	String place=request.getParameter("place");
	String typestay=request.getParameter("typestay");
	%>
	<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Hotels</h1>
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
                    <th>Hotel Name</th>
                    <th>Address</th>
                    <th>Email id</th>
                    <th>contact_number</th>
                    <th>Star Rate</th>              
                    </tr>
                  </thead>
                 
                  <tbody>
                  <%
                    int count=1;
		   //SELECT * FROM tbl_touristplace INNER JOIN tbl_state ON tbl_touristplace.state INNER JOIN tbl_district ON tbl_touristplace.district
					String sql="SELECT * FROM `tbl_hotelregister` where typestay='"+typestay+"' and city='"+place+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next())
					{		
						String staytype=rs.getString("typestay");
					%>
                    <tr>
                        <td><%= count++%></td>
						<td><%=rs.getString("hotel_name")%></td>
						
						<td><%=rs.getString("address")%>,<%=rs.getString("street") %>,<%=rs.getString("city") %></td> 
						 <td><%=rs.getString("email_id") %></td>
						 <td><%=rs.getString("contact_number") %></td>
						 <td><%=rs.getString("starrate") %></td>
						 <td>
						 <% if(staytype.equals("hotel")){ %><a href="viewhoteldetails.jsp?id=<%=rs.getString("logid")%>"><button class="btn btn-info">More Details</button></a>
	                     <% } else{ %> <a href="viewhomestaydetails.jsp?id=<%=rs.getString("logid") %>"><button class="btn btn-info">More Details</button></a>
	                     <% } %></td>                 
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