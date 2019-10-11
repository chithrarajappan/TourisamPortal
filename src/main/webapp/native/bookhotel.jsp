<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {	
     response.sendRedirect("../index.jsp"); 
   }
   else{
	   
String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");
String hid=request.getParameter("id");

%>
<%@page import="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sdf.format(new Date()); %>
 <jsp:include page="header/nativeheader.jsp"></jsp:include>
      <%@page import="java.sql.*" %>	  
		<%
		out.print(hid);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();
		 
		ResultSet rs;
		String sql= "select * from tbl_nativeregister where logid='"+id+"'";
		rs=stmt.executeQuery(sql);
		%>
		<link href="https://d3u4hzlr7ozpoo.cloudfront.net/assets/application-afdbce6140549e688bdf1c9ac81362b2.css" media="screen" rel="stylesheet" type="text/css" />
		
		
		<section class="ftco-section">
	<div class="container">		
		<div class="row">
		
		<!-- 
	  <div class="new-pro-container">
    	<div class="row"> -->
    	
    	<form action="bookstayhotel.jsp" class="menu-profile" method="post">
          
      	<!-- Menu Section -->
      	<div class="col-md-4 col-lg-4" style="background-color: #ede8ef;">
        <div class="menu-profile" >
          <p>Details</p>
          </div>
          
                    <font color="black" size="2px"><b>
                 <div class="form-group row">
       
              <input type="hidden" name="hid" value="<%=hid%>">
              <input type="hidden" name="pid" value="<%=id%>">
              
                 <label><b>Check-In Date</b></label> 
                      <input type="date" class="form-control" placeholder="" name="date" required>
                      </div>
                 <div class="form-group row">
                 <label><b>Type Of Room</b></label>
                    <select name="type" id="" class="form-control" placeholder="Type of room">
                        <option value="single">Single Room</option>
                        <option value="doubl">Double Room</option>
                	    <option value="family">Family Room</option>
                        <option value="dormitory">Dormitory</option>
        		</select>
                     </div>
                <div class="form-group row">
                 <label><b>Number of Days Staying</b></label>
                       <input type="text" class="form-control" placeholder="Number of days" name="days" required>
        </div>
                <div class="form-group row">
                 <label><b>Number of Rooms Needed</b></label>
                <input type="text" class="form-control" placeholder="Number of Rooms" name="rooms" required>
               
          </div>
                </b></font>
                 
                  </div>
          
      <div class="col-md-8 col-lg-8">
        
       
<%while (rs.next())
	{
	%>
        <!-- Edit Profile -->
        <div class="dashboard-card edit-profile" id="ep" style="display: block;">
          <div class="c-p-heading">
           <center><div class="main-heading">Booking Details</div></center> 
          </div>

          <div class="cp-edit">
                      
            <!-- <form accept-charset="UTF-8" action="" class="simple_form js-user-photo-form d-none" data-remote="true" enctype="multipart/form-data" id="edit_consumer_10697408" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
 </form>   -->       </div>




          <div class="c-p-heading">
            <div class="main-heading">Account Information</div>
          </div>

          <div class="profile-inpCont">
<!--             <form accept-charset="UTF-8" action="editprofile.jsp" class="simple_form edit_consumer" data-validate="true" id="edit_consumer_10697408" method="post" novalidate="novalidate" enctype="multipart/form-data">
 -->            <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
              <div class="profile-inp-row">
                <div class="profile-edit-label">Name</div>
                <div class="controls">
                <input class="string optional" id="name" name="name" value="<%=rs.getString("name") %>" readonly></div></div>
              
                           
              <div class="profile-inp-row">
                <div class="profile-edit-label">Phone</div>
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="phone" name="phone" type="text" value="<%=rs.getString("contact_number") %>" readonly></div></div></div>
              </div>
				
				<!-- address -->
				
				 <div class="profile-inp-row">
                <div class="profile-edit-label">Address</div>
                
 				<div class="controls">
				<input class="string optional" id="ad" name="ad" type="text" value="<%=rs.getString("address") %>" readonly></div></div>
				  
				              
                <!-- id -->
                <div class="profile-inp-row">
                <div class="profile-edit-label">ID Proof</div>
               <div class="controls">
				<input class="string optional" id="idp" name="idp" type="text" value="<%=rs.getString("id_proof") %>" readonly></div>
				<div class="profile-edit-label">ID Number</div>
                <div class="controls">
				<input class="string optional" id="idn" name="idn" type="text" value="<%=rs.getString("id_details") %>" readonly></div></div>
		  
		  
		                <input type="submit" value="Submit" class="submit px-3">
          
              </form>
              </div>
<script>//<![CDATA[
if(window.ClientSideValidations===undefined)window.ClientSideValidations={};window.ClientSideValidations.disabled_validators=[];window.ClientSideValidations.number_format={"separator":".","delimiter":","};if(window.ClientSideValidations.patterns===undefined)window.ClientSideValidations.patterns = {};window.ClientSideValidations.patterns.numericality=/^(-|\+)?(?:\d+|\d{1,3}(?:\,\d{3})+)(?:\.\d*)?$/;if(window.ClientSideValidations.forms===undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['edit_consumer_10697408'] = {"type":"SimpleForm::FormBuilder","error_class":"help-inline","error_tag":"span","wrapper_error_class":"error","wrapper_tag":"div","wrapper_class":"control-group","wrapper":"bootstrap","validators":{}};
//]]></script>         
 
        </div>
        
                </div>
              </div>

              <hr>
            </div>
            <%
            } %>
   
	</section>	


 <jsp:include page="footer/footer.jsp"></jsp:include>

<%} %>		
		