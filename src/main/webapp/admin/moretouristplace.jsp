<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
%>
<jsp:include page="header/header.jsp"></jsp:include>

<% String user=(String)session.getAttribute("user"); %>

<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
%>
<center>
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome Agent</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 ">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Add More Tourist Image</h1>
              </div>
              <form action="../UploadServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
                 <div class="form-group row">
                    <label><b>Package Type</b></label>
                     <input name="packagename" type="text" id="packagename" readonly class="form-control form-control-user"  value="<%=id%>">
                   <%--  <select class="form-control form-control-user" name="packagename">
                    <option selected><font color="gray">Select package</font></option>
                    <%
                    
                    
                    /*String sql="select * from tbl_touristplace";
                    ResultSet rs1=stmt.executeQuery(sql);
            		while(rs1.next())
	            		{*/
                    %>
                    <option value="<%=rs1.getString("touristplace")%>"><%=rs1.getString("touristplace") %></option>
                    <%
            		}
                    %>
                    </select> --%>
                </div>
                <div class="form-group row">
                  <label><b>Package Image</b></label>
                  <input name="file" type="file" id="file" class="form-control form-control-user"  required="" multiple>
                </div>  
                <button type="submit" class="btn btn-primary btn-user btn-block" name="Submit" >
                  Submit
                </button>
                <hr>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
             </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
</center>


<jsp:include page="footer/footer.jsp"></jsp:include>
<% } %>