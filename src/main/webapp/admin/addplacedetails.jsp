<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
%>
<jsp:include page="header/header.jsp"></jsp:include>

<% String user=(String)session.getAttribute("user");
String place=request.getParameter("placename");
String plimid=request.getParameter("id");
%>
<%@page import="java.sql.*"%>
<script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
function showState(str)
{
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="district.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
}
      function stateChange()
      {   
      	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      	document.getElementById("district").innerHTML=xmlHttp.responseText   
        }   
      }


function showRailWay(str)
{
	if (typeof XMLHttpRequest != "undefined"){
	  xmlHttp= new XMLHttpRequest();
	  }
	else if (window.ActiveXObject){
	  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	  }
	if (xmlHttp==null){
	alert("Browser does not support XMLHTTP Request")
	return;
	} 
	var url="railway.jsp";
	url +="?count=" +str;
	xmlHttp.onreadystatechange = stateChange1;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
}
	function stateChange1(){   
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	document.getElementById("railway").innerHTML=xmlHttp.responseText   
	}   
	}
            

</script>
<center>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="col-lg-12">
            <h1 class="h3 mb-0 text-gray-800" >Welcome Administrator</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>

        <div class="card o-hidden border-0 shadow-lg my-5 col-lg-8 ">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Tourist Destinations</h1>
              </div>
              <form class="user" action="addingimageplaceprocess.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="hidden" value="<%=plimid%>" name="plimid">
                 <label><b>Place</b></label>
                    <input type="text" readonly class="form-control form-control-user" name="placename" placeholder="place Name" required="" value="<%=place%>">
                   </div>
            
            
                  <div class="form-group row">
                   <label><b>State</b></label>
                    <select class="form-control" name="state" onChange="showState(this.value)">
                    <option value="0"><font color="gray">Select State</font></option>
                    <%      
					 Class.forName("com.mysql.jdbc.Driver").newInstance();  
					 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");  
					 Statement stmt = con.createStatement();  
					 ResultSet rs = stmt.executeQuery("select * from tbl_state");
					 while(rs.next()){
					     %>
					      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
					      <%
					 }
					     %>
                    </select>
                </div>
                <div class="form-group row" id="district">
                </div>
                <!-- <div class="form-group row">
                 <label><b>District</b></label>
                    <select class="form-control form-control-user" name="district">
                    <option selected>Select District</option>
                    </select>
                    </div> -->
            
                
                <div class="form-group row">
                 <label><b>Description</b></label>
                 <textarea rows="" cols="" type="text" class="form-control form-control-user" name="description" placeholder="About the place(min 120 words)" required=""></textarea>
                   </div>
            
                <div class="form-group row">
                <label><b>Address</b></label>
                   <textarea rows="" cols="" type="text" class="form-control form-control-user" name="address" placeholder="Address details(min 100 words)" required=""></textarea>
                   </div>
                <div class="form-group row">
                <label><b>Location on Map Link</b></label>
                  <input type="text" class="form-control form-control-user" name="maplink" placeholder="Location Link on Map" required="">
                </div>
                
                <div class="form-group row" id="railway">
                </div>
                <!--<div class="form-group row">
                <label><b>Nearest Railway Station</b> </label>
                    <select class="form-control form-control-user" name="railway">
                    <option selected>Select Railway Station</option>
                    </select>
                </div> -->
                    <div class="form-group row">
                <label><b>Nearest Bus Station</b></label>
                  <input type="text" class="form-control form-control-user" name="busstation" placeholder="Nearest Bus Station" required="">
                </div>
                    <div class="form-group row">
                <label><b>Point of Interest</b></label>
                  <input type="text" class="form-control form-control-user" name="points" placeholder="Nearest Attractions" required="">
                </div>
                 <div class="form-group row">
                <label><b>Place Image</b></label>
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
<%}%>