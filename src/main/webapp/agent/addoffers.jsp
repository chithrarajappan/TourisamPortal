<jsp:include page="header/header.jsp"></jsp:include>
 <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
String user=(String)session.getAttribute("user"); 
%>

	
<%@ page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String agent_id=(String)session.getAttribute("uid");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
%>
<center>

        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="col-lg-12"><!-- 
            <h1 class="h3 mb-0 text-gray-800" >Welcome Administrator</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          --> </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 ">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h3 mb-0 text-gray-800">Offers</h1>
              </div>
              <form class="user" action="addingofferprocess.jsp" method="post">
                
                
                <%-- 
                  <div class="form-group row">
                   <label><b>Package Type</b></label>
                    <select class="form-control form-control-user" name="packagetype">
                    <option selected>Select package</option>
                    <%
                    String sql="select * from tbl_package";
                    %>
                    </select>
                </div>
             --%>
             <input type="hidden" class="form-control form-control-user" name="id" value="<%=id%>">
             <input type="hidden" class="form-control form-control-user" name="agent_id" value="<%=agent_id%>">
                <div class="form-group row">
                 <label><b>Offer Name</b></label>
                    <input type="text" class="form-control form-control-user" name="offername" placeholder="Offer Name" required="">
                   </div>
            
                <div class="form-group row">
                 <label><b>Places To Visit</b></label>
                    <input type="text" class="form-control form-control-user" name="placevisiting" placeholder="Places to Visit" required="">
                   </div>
            <!-- 
                <div class="form-group row">
                 <label><b>District</b></label>
                    <select class="form-control form-control-user" name="district">
                    <option selected>Select District</option>
                    </select>
                    </div>
             -->
            
                <div class="form-group row">
                <label><b>Number Of Days</b></label>
                    <input type="text" class="form-control form-control-user" name="days" placeholder="Tour Length" required="">
    
    
                    <!-- <select class="form-control form-control-user" name="days">
                    <option selected>Select Number of Days</option>
                    <option value="3">3 days-2nights</option>
						<option value="4">4 Days-3 Nights</option>
						<option value="5">5 Days-4 Nights</option>
						<option value="6">6 Days-5 Nights</option>
						<option value="7">7 Days-6 Nights</option>

                    <option >
                    </select>
 -->                  </div>
                <div class="form-group row">
                <label><b>Amount</b></label>
                  <input type="text" class="form-control form-control-user" name="amount" placeholder="Offer Amount" required="">
                </div>
                <div  class="form-group row">                 
    				<label><b>Food & Accomodation</b></label>
                    <div class=col-md-4><input type="radio" name="fd" required="" value="yes">yes
                    <input type="radio" name="fd" required="" value="yes">no
                </div>   </div>
                
                    <div  class="form-group row">
                                     <label><b>Transportation</b></label>
                    <div class=col-md-6><input type="radio" name="transportation" required=""  value="yes">yes
                    <input type="radio" name="transportation" required=""  value="no">no
                </div>   </div>
                
                
                <div class="form-group row">
                 <label><b>Description</b></label>
                 <textarea rows="" cols="" type="text" class="form-control form-control-user" name="description" placeholder="About the package(min 120 words)" required=""></textarea>
                   </div>
            	
                
                <!-- 
                <div class="form-group row">
                <label><b>Inclusions</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/>
                <input type="checkbox" name="inclusions"  required="">Accommodation &nbsp;&nbsp;  
                <input type="checkbox"  name="inclusions"  required="">Transpotation &nbsp;&nbsp;
                <input type="checkbox"  name="inclusions"  required="">Room for refreshment
                
              
                    </div>
                
                <div class="form-group row">
    
                <label><b>Exclusions</b> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox"  name="exclusions"  required="">All personal expenses&nbsp;&nbsp;                    
                     <input type="checkbox"  name="exclusions"  required="">Entrypasses&nbsp;&nbsp;
                    <input type="checkbox"  name="exclusions"  required="">Outside Food &nbsp;&nbsp;
                     <input type="checkbox"  name="exclusions"  required="">Optional activities&nbsp;&nbsp;
                </div>
                
   -->
                <button type="submit" class="btn btn-primary btn-user btn-block">
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
      
</center>





<jsp:include page="footer/footer.jsp"></jsp:include>