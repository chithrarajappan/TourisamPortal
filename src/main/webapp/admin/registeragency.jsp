   <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }else{
String user=(String)session.getAttribute("user");
%>

<jsp:include page="header/header.jsp"></jsp:include>

<center>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Welcome Administrator</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 ">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Register Valid Id For Agency!</h1>
              </div>
              <form class="user" action="agencyregisterprocess.jsp" method="post">
                <div class="form-group row">
                 <label><b>Agency Holder Name</b></label>
                    <input type="text" class="form-control form-control-user" name="agentname" placeholder="Agent Name" required="">
                  
                  </div>
                  <div class="form-group row">
                  
                  <label><b>Agency Name</b></label>
                    <input type="text" class="form-control form-control-user" name="agencyname" placeholder="Agency Name" required="">
                  
                </div>
                <div class="form-group row">
                <label><b>Email Id</b></label>
                  <input type="email" class="form-control form-control-user" name="agentmail" placeholder="Email Address" required="">
                </div>
                <div class="form-group row">
                <label><b>Agency Registration Id</b> </label>
                    <input type="text" class="form-control form-control-user" name="agencyid" placeholder="Id For Agency" required="">
                  </div>
                  
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Registery Agency
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