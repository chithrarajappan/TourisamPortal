<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else {
%>
<% String user=(String)session.getAttribute("user"); 
String id=(String)session.getAttribute("uid"); %>
<jsp:include page="header/header.jsp"></jsp:include>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
 <%  
 	SimpleDateFormat sdf = new SimpleDateFormat("MMMM-dd-yyyy");
 	String date = sdf.format(new Date()); 
 %>

<center>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="col-lg-12">
            <h1 class="h3 mb-0 text-gray-800" >Blogging</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 ">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Blog Writing</h1>
              </div>
              <form class="user" action="addingblogprocess.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                 <label><b>Title</b></label>
                    <input type="text" class="form-control form-control-user" name="title" placeholder="blog title" required="">
                   </div> 
                <div class="form-group row">
                 <label><b>Description</b></label>
                 <textarea rows="" cols="" class="form-control form-control-user" name="description" placeholder="About the place(min 700 words)" required=""></textarea>
                   </div>   
                 <div class="form-group row">
                <label><b>Today Date</b></label>
                 <input type="text" name="tdate" value="<%=date%>" class="form-control form-control-user"  required="">
                </div>    
                 <input type="hidden" name="bloger" value="Admin" class="form-control form-control-user"  required="">
               <input type="hidden" name="id" value="<%=id %>" class="form-control form-control-user"  required="">
                 <div class="form-group row">
                <label><b>Image</b></label>
                  <input type="file"  name="file1" class="form-control form-control-user"  required="">
                </div>
                    
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
      <!-- End of Main Content -->
</center>




<jsp:include page="footer/footer.jsp"></jsp:include>
<% }%>