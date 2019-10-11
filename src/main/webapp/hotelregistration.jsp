<jsp:include page="header/header.jsp"></jsp:include>

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
                <h1 class="h4 text-gray-900 mb-4">Register Valid Id For Hotel!</h1>
              </div>
              <form class="user" action="MailApp" method="post">
                <div class="form-group row">
                 <input type="hidden" class="form-control form-control-user" name="user" value="goanywhere97@gmail.com">
                   <input type="hidden" class="form-control form-control-user" name="pass" value="travelaround@123">
                  <input type="hidden" class="form-control form-control-user" name="subject" value="Confirmation mail">
                <label><b>Email Id</b></label>
                  <input type="email" class="form-control form-control-user" name="to" placeholder="Email Address">
                </div>
                <div class="form-group row">
                <label><b>Hotel Registration Id</b> </label>
                    <input type="text" class="form-control form-control-user" name="message" placeholder="Id For Hotel">
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