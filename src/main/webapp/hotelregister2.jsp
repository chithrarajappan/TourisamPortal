<jsp:include page="header/header.jsp"></jsp:include>

<%@ page import="java.sql.*"%>
<%
String msg=request.getParameter("msg");
String to1=request.getParameter("to1");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
	String sql="select * from tbl_registerhotel where hotelregid='"+msg+"'and email_id='"+to1+"'and status='0'";
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
                <h1 class="h4 text-gray-900 mb-4">Update Hotel Profile!</h1>
              </div>
               <%
              if(rs.next())
          	{ %>
              <form class="user" action="hotelregister2process.jsp" method="post">
               <input type="hidden" class="form-control form-control-user" name="hotelid" value="<%=rs.getString("id")%>">
                <div class="form-group row">
                <label><b>Hotel_name</b></label>
                  <input type="text" class="form-control form-control-user" name="hotelname" value="<%=rs.getString("hotel_name")%>">
                </div>
                <div class="form-group row">
                <label><b>Contact Number</b></label>
                  <input type="text" class="form-control form-control-user" name="contact" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Nationality</b></label>
                  <input type="text" class="form-control form-control-user" name="nation" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Address</b></label>
                  <input type="text" class="form-control form-control-user" name="address" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Street</b></label>
                  <input type="text" class="form-control form-control-user" name="street" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>City</b></label>
                  <input type="text" class="form-control form-control-user" name="city" value=""required="">
                </div>
                
                
                <div class="form-group row">
                <label><b>Type</b></label>
                <select  class="form-control form-control-user" name="type" value="" required="">
	                <option value="hotel">Hotel</option>
	                <option value="homestay">Home Stay</option>
                </select>
                </div>
                <div class="form-group row">
                <label><b>Star Rate </b></label>
                  <input type="text" class="form-control form-control-user" name="category" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Single Rooms</b></label>
                  <input type="text" class="form-control form-control-user" name="srooms" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Double Rooms</b></label>
                  <input type="text" class="form-control form-control-user" name="drooms" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Family Rooms</b></label>
                  <input type="text" class="form-control form-control-user" name="frooms" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Dormitory</b></label>
                  <input type="text" class="form-control form-control-user" name="dormitory" value="" required="">
                </div>
                
                <div class="form-group row">
                <label><b>Email Id</b></label>
                  <input type="email" class="form-control form-control-user" name="email_id" value="<%=rs.getString("email_id")%>">
                </div>
                 <div class="form-group row">
                <label><b>Password</b></label>
                  <input type="password" class="form-control form-control-user" name="password" value="" required="">
                </div>
                <div class="form-group row">
                <label><b>Hotel Registration Id</b> </label>
                    <input type="text" class="form-control form-control-user" name="hyregid" value="<%=rs.getString("hotelregid")%>">
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