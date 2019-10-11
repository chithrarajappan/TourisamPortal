<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }else{
%>
<jsp:include page="header/header.jsp"></jsp:include>

<% String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");
%>
<%@ page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" ></script>
    <script type="text/javascript">
        //when the webpage has loaded do this
        $(document).ready(function() {  
            //if the value within the dropdown box has changed then run this code            
            $('#num_cat').change(function(){
                //get the number of fields required from the dropdown box
                var num = $('#num_cat').val();                  

                var i = 0; //integer variable for 'for' loop
                var html = ''; //string variable for html code for fields 
                //loop through to add the number of fields specified
                for (i=1;i<=num;i++) {
                    //concatinate number of fields to a variable
                    html += 'Day ' + i + ': <textarea name="category-' + i + '" rows="" cols="" class="form-control form-control-user"/></textarea><br/>'; 
                }

                //insert this html code into the div with id catList
                $('#catList').html(html);
            });
        }); 
    </script>
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
                <h1 class="h4 text-gray-900 mb-4">Packages</h1>
              </div>
              <form class="user" action="addingagentpackageprocess.jsp" method="post">
                
                
                
                  <div class="form-group row">
                   <label><b>Package Type</b></label>
                    <select class="form-control form-control-user" name="packagetype">
                    <option selected><font color="black">Select package</font></option>
                    <%
                    String sql="select * from tbl_package";
                    ResultSet rs1=stmt.executeQuery(sql);
            		while(rs1.next())
            		{
                    %>
                     <option value="<%=rs1.getString("id")%>"><font color="black"><%=rs1.getString("packname") %></font></option>
                    <%
            		}
                    %>
                    </select>
                </div>
            
                <div class="form-group row">
                 <label><b>Package Name</b></label>
                    <input type="text" class="form-control form-control-user" name="packagename" placeholder="Package Name" required="">
                   </div>
            
                <div class="form-group row">
                 <label><b>Places To Visit</b></label>
                    <textarea class="form-control form-control-user" name="placevisting" placeholder="Places to Visit" required=""></textarea>
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
                 <label><b>Description</b></label>
                 <textarea rows="" cols="" class="form-control form-control-user" name="description" placeholder="About the package(min 120 words)" required=""></textarea>
                   </div>
            
                <div class="form-group row">
                <label><b>Number Of Days</b></label>
                    <select class="form-control form-control-user" id="num_cat" name="num_cat">
                        <option selected><font color="black">Select Number of Days</font></option>
                        <option value="3">3 Days - 2 Nights</option>
						<option value="4">4 Days - 3 Nights</option>
						<option value="5">5 Days - 4 Nights</option>
						<option value="6">6 Days - 5 Nights</option>
						<option value="7">7 Days - 6 Nights</option>
                    <option >
                    </select>
                  </div>
                  
                   <div class="form-group row" id="catList"></div>
                    
                <div class="form-group row">
                <label><b>Package Amount for Native</b></label>
                  <input type="text" class="form-control form-control-user" name="nativeamount" placeholder="Amount for Native" required="">
                </div>
                <div class="form-group row">
                <label><b>Package Amount for Foreigner</b></label>
                  <input type="text" class="form-control form-control-user" name="foreignamount" placeholder="Amount for Foreigner" required="">
                </div>
                
                <div class="form-group row">
                <label><b>Inclusions</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/>
                <input type="checkbox" name="inclusions" value="Accommodation">Accommodation &nbsp;&nbsp;  
                <input type="checkbox"  name="inclusions" value="Transpotation">Transportation &nbsp;&nbsp;
                <input type="checkbox"  name="inclusions" value="Room for refreshment">Room for refreshment
                
              
                    </div>
                
                <div class="form-group row">
    
                <label><b>Exclusions</b> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox"  name="exclusions" value="All personal expenses">All personal expenses&nbsp;&nbsp;                    
                     <input type="checkbox"  name="exclusions" value="Entrypasses">Entry passes&nbsp;&nbsp;
                    <input type="checkbox"  name="exclusions" value="Outside Food">Outside Food &nbsp;&nbsp;
                     <input type="checkbox"  name="exclusions" value="Optional activities">Optional activities&nbsp;&nbsp;
                </div>
                
                <div class="form-group row">
                <label><b>Transportation</b></label>
                  <input type="text" class="form-control form-control-user" name="transport" placeholder="transportation" required="">
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
      
</center>




<jsp:include page="footer/footer.jsp"></jsp:include>
<%} %>
