<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
String user=(String)session.getAttribute("user");
String uid=(String)session.getAttribute("uid");
%><jsp:include page="header/header.jsp"></jsp:include>

<%@page import="java.sql.*"%>

 
<%      
					 Class.forName("com.mysql.jdbc.Driver").newInstance();  
					 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");  
					 Statement stmt = con.createStatement();  
					 ResultSet rs = stmt.executeQuery("select * from tbl_hotelregister where logid='"+uid+"'");
					 
					     %>
<center>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center-content-between mb-4"  style="padding-top: 4%;">
            <h1 class="h3 mb-0 text-gray-800"></h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-10 " style="background-color: white;">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Upload Details</h1>
              </div>
              <form class="user" action="hotelupdateprocess.jsp" method="post" enctype="multipart/form-data">
                <input type="hidden" class="form-control form-control-user" name="id" value="<%=uid%>">
                <% while(rs.next())
				{ %>
                <div class="form-group row">
                <label><b>Name</b></label>
                  <input type="readonly" class="form-control form-control-user" name="name" value="<%=rs.getString("hotel_name")%>">
                </div>
                <%
				}
				%>
				<div class="form-group row">
                <label><b>Bank Acc Number</b></label>
                  <input type="text" class="form-control form-control-user" name="account" placeholder="11 digit Bank Account Number" required="">
                </div>
                <div class="form-group row">
                <label><b>About</b></label>
                  <textarea class="form-control form-control-user" name="about" required=""></textarea>
                  </div>
                  
                <div class="form-group row">
                <label><b>Nearby Attractions</b></label>
                  <input type="text" class="form-control form-control-user" name="nearby" placeholder="Nearby Attractions" required="">
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Do you have a Car parking facility?</b></label></div>
                <div class="col-md-6"><input type="radio" name="car" required="" value="yes">yes
                    <input type="radio" name="car" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is there a Gym inside the hotel?</b></label></div>
                <div class="col-md-6"><input type="radio" name="gym" required="" value="yes">yes
                    <input type="radio" name="gym" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
               <div class="col-md-6"> <label><b>Do you provide WIFI facilities to your customers?</b></label></div>
                <div class="col-md-6"><input type="radio" name="wifi" required="" value="yes">yes
                    <input type="radio" name="wifi" required="" value="no">no
                </div>
               </div>
               
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is there a Restaurant inside?</b></label></div>
               <div class="col-md-6"><input type="radio" name="res" required="" value="yes">yes
                    <input type="radio" name="res" required="" value="no">no
                </div>
                 </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Do you provide Laundry Services?</b></label></div>
                <div class=col-md-6><input type="radio" name="laun" required="" value="yes">yes
                    <input type="radio" name="laun" required="" value="no">no
                </div>
               </div>
               
                <div class="form-group row">
                <div class="col-md-6"><label><b>Do you have a Bar inside your Premises?</b></label></div>
               <div class=col-md-6><input type="radio" name="bar" required="" value="yes">yes
                    <input type="radio" name="bar" required="" value="no">no
                </div>
                 </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is it air conditioned?</b></label></div>
                <div class=col-md-6><input type="radio" name="ac" required="" value="yes">yes
                    <input type="radio" name="ac" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is there a spa inside?</b></label></div>
                <div class=col-md-6><input type="radio" name="spa" required="" value="yes">yes
                    <input type="radio" name="spa" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is there a pool inside the Hotel?</b></label></div>
                <div class=col-md-6><input type="radio" name="pool" required="" value="yes">yes
                    <input type="radio" name="pool" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Is there a playground inside?</b></label></div>
                <div class=col-md-6><input type="radio" name="play" required="" value="yes">yes
                    <input type="radio" name="play" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Do you have facility to conduct Conferences?</b></label></div>
                <div class=col-md-6><input type="radio" name="con" required="" value="yes">yes
                    <input type="radio" name="con" required="" value="no">no
                </div>
                </div>
                
                <div class="form-group row">
                <div class="col-md-6"><label><b>Do you have a wheel chair accessibility for persons with disability?</b></label></div>
                <div class=col-md-6><input type="radio" name="wc" required="" value="yes">yes
                    <input type="radio" name="wc" required="" value="no">no
                </div>
                </div>
                
                
                <div class="form-group row">
                <label><b>Fixed Charges</b> </label>
                    <input type="text" class="form-control form-control-user" name="charge" placeholder="Fixed Charges" required="">
                  </div>     
                
                <div class="form-group row">
                <label><b>Rent for Single rooms</b></label>
                <input type="text" class="form-control form-control-user" name="single">
                
                </div>
                
                <div class="form-group row">
                <label><b>Rent for Double rooms</b></label>
                <input tyrpe="text" class="form-control form-control-user" name="doubl">
                </div>
                
                <div class="form-group row">
                <label><b>Rent for Family rooms</b></label>
                <input type="text" class="form-control form-control-user" name="family">
                </div>
                
                <div class="form-group row">
                <label><b>Rent for Dormitory</b></label>
                <input type="text" class="form-control form-control-user" name="dormitory">
                </div>
                
                 <div class="form-group row">
                <label><b>Images</b></label>
                   <input type="file"  name="file" class="form-control form-control-user"  required="">
               </div>
                  <div class="form-group row">
                <label><b>Map</b></label>
                <input type="text" class="form-control form-control-user" name="maplink" placeholder="Location Link on Map" required="">
                </div>
                
                
                <input type="submit" class="btn btn-success btn-user btn-block" name="hotel" value="Submit">  
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