<jsp:include page="header/header.jsp"></jsp:include>
<%@ page import="java.sql.*"%>
<%
String msg=request.getParameter("msg");
String to1=request.getParameter("to1");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
	String sql="select * from tbl_registeragent where agentregid='"+msg+"'and email_id='"+to1+"' and status='0'";
	ResultSet rs=stmt.executeQuery(sql);	
%>
<center>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center-content-between mb-4"  style="padding-top: 4%;">
            <h1 class="h3 mb-0 text-gray-800"></h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 " style="background-color: silver;">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Update agency profile!</h1>
              </div>
              <%
              if(rs.next())
          	{ %>
              <form class="user" action="agencyregister2process.jsp" method="post">
               <input type="hidden" class="form-control form-control-user" name="agencyid" value="<%=rs.getString("id")%>">
                <div class="form-group row">
                <label><b>Agency_name</b></label>
                  <input type="text" class="form-control form-control-user" name="agencyname" value="<%=rs.getString("agency_name")%>">
                </div>
                <div class="form-group row">
                <label><b>Contact Number</b></label>
                  <input type="text" class="form-control form-control-user" name="contact" value="">
                </div>
                <div class="form-group row">
                <label><b>Account Number</b></label>
                  <input type="text" class="form-control form-control-user" name="account" value="">
                </div>
                <div class="form-group row">
                <label><b>Nationality</b></label>
                  <input type="text" class="form-control form-control-user" name="nation" value="">
                </div>
                <div class="form-group row">
                <label><b>Address</b></label>
                  <input type="text" class="form-control form-control-user" name="address" value="">
                </div>
                <div class="form-group row">
                <label><b>Street</b></label>
                  <input type="text" class="form-control form-control-user" name="street" value="">
                </div>
                <div class="form-group row">
                <label><b>City</b></label>
                  <input type="text" class="form-control form-control-user" name="city" value="">
                </div>
                <div class="form-group row">
                <label><b>Email Id</b></label>
                  <input type="email" class="form-control form-control-user" name="email_id" value="<%=rs.getString("email_id")%>">
                </div>
                 <div class="form-group row">
                <label><b>Password</b></label>
                  <input type="password" class="form-control form-control-user" name="password" value="">
                </div>
                <div class="form-group row">
                <label><b>Agency Registration Id</b> </label>
                    <input type="text" class="form-control form-control-user" name="aregid" value="<%=rs.getString("agentregid")%>">
                  </div>     
                <input type="submit" class="btn btn-success btn-user btn-block" value="Submit">  
                <hr>
              </form>
              <%
              }%>
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