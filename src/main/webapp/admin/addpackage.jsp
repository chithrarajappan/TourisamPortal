<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   } else{
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
                <h1 class="h4 text-gray-900 mb-4">Add Packages</h1>
              </div>
                <form name="form1" id="form1" action="packprocess.jsp" method="post" enctype="multipart/form-data">
                 <div class="form-group row">
                 <label><b>Package Name</b></label>
                    <input type="text" class="form-control form-control-user" name="pack" placeholder="Enter Package Name" required="">
                   </div>
            
            
                    <div class="form-group row">
                <label><b>Package Image</b></label>
                  <input type="file"  name="file1" class="form-control form-control-user"  required="">
                </div>
                
                    
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Submit
                </button>
                <hr>
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
    <%}%>