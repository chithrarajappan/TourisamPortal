<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
	   
String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");
 
%>
<script>
function calc()
{
	document.getElementById('pay').style.display='block';

	var a=parseInt(document.getElementById('re').value);
	var b=parseInt(document.getElementById('type').value);
	var pay=document.getElementById('sum');
    pay.value=(a*b);
}

</script>

<%@page import="java.util.Date" %>
 <jsp:include page="header/foreignheader.jsp"></jsp:include>
 
      <%@page import="java.sql.*" %>	  
		<%
		
		String number=request.getParameter("num");
		String date=request.getParameter("date");
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String address=request.getParameter("ad");
		String idname=request.getParameter("idp");
		String idnum=request.getParameter("idn");
		String packageid=request.getParameter("pid");
		String agencyid=request.getParameter("aid");
		
		String personid=request.getParameter("lid");
		
		out.println(number);out.println(date);out.println(name);
		out.println(phone);out.println(address);out.println(idname);
		out.println(idnum);out.println(packageid);out.println(agencyid);
		out.println(personid);		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();
		try
		{
			
			int j=stmt.executeUpdate("INSERT INTO `tbl_packagebook`(`logid`, `name`, `phone`, `address`, `idproof`, `agencyid`, `packageid`, `date`, `number`) VALUES ('"+personid+"','"+name+"','"+phone+"','"+address+"','"+idname+"','"+agencyid+"','"+packageid+"','"+date+"','"+number+"')");
			String sql="select max(id)from tbl_packagebook";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				String bid=rs.getString(1);
	session.setAttribute("bookid",bid);
			}
		
		}
		catch(Exception e)
		{
			out.println(e);
		}

		%>

		<link href="https://d3u4hzlr7ozpoo.cloudfront.net/assets/application-afdbce6140549e688bdf1c9ac81362b2.css" media="screen" rel="stylesheet" type="text/css" />
		
		
		
		
		<section class="ftco-section">
	<div class="container">		
		<div class="row">
		
          <form action="payment3.jsp" class="review" method="post">
  	
    	
      	<!-- Menu Section -->
      	<div class="col-md-4 col-lg-4" style="background-color: #ede8ef;">
        <div class="menu-profile" >
          <p>Personal Details</p>
          </div>
     
                    <font color="black" size="2px"><b>
                 <div class="form-group row">
       
              <input type="hidden" name="pid" value="<%=packageid%>">
              <input type="hidden" name="aid" value="<%=agencyid%>">
              <input type="hidden" name="id" value="<%=personid%>">

              
                 <label><b>Name</b></label> 
                      <input type="text" class="form-control" name="n1" value="<%=name %>" readonly="">
                      </div>
                 <div class="form-group row">
                 <label><b>Phone</b></label>
                    <input type="text" class="form-control" name="ph" value="<%=phone %>" readonly="">
                     </div>
                <div class="form-group row">
                 <label><b>Address</b></label>
                       <input type="text" class="form-control" name="ad" value="<%=address %>" readonly="">
        		</div>
                <div class="form-group row">
                 <label><b>Id</b></label>
                <input type="text" class="form-control" name="id" value=<%=idname %> readonly="">
              
          </div></b></font>           
      </div>

      

      <div class="col-md-8 col-lg-8">
       
        <!-- Edit Profile -->
        <div class="dashboard-card edit-profile" id="ep" style="display: block;">
          <div class="c-p-heading">
           <center><div class="main-heading">Tour Package Booking</div></center> 
          </div>

          <div class="cp-edit">
                      
            <!-- <form accept-charset="UTF-8" action="" class="simple_form js-user-photo-form d-none" data-remote="true" enctype="multipart/form-data" id="edit_consumer_10697408" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
 </form>   -->       </div>




          <div class="c-p-heading">
            <div class="main-heading">Booking Information</div>
          </div>

          <div class="profile-inpCont">
          
          <%
         
		ResultSet rs1;
		String sql1="SELECT * FROM tbl_agencyregister INNER JOIN tbl_agentpackages where tbl_agencyregister.logid=tbl_agentpackages.logid and tbl_agentpackages.logid='"+agencyid+"'";

		rs1=stmt.executeQuery(sql1);
		while(rs1.next())
		{		
%>  
<!--             <form accept-charset="UTF-8" action="editprofile.jsp" class="simple_form edit_consumer" data-validate="true" id="edit_consumer_10697408" method="post" novalidate="novalidate" enctype="multipart/form-data">
             <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
 -->     <font size="2px">   
      <div class="profile-inp-row">
                <div class="profile-edit-label">Hotel Name</div>: &nbsp;<%=rs1.getString("agency_name") %></div>            
              <div class="profile-inp-row">
                <div class="profile-edit-label">Address</div>: &nbsp;<%=rs1.getString("address") %> </div>
			</font>	<hr>
			<input type="hidden" id="acc" name="acc" value="<%=rs1.getString("account")%>">
				<!-- address -->
				<div></div>
				 <div class="profile-inp-row">
                <div class="profile-edit-label">Booking Date</div>
                
 				<div class="controls">
				<input class="string optional" id="date" name="date" type="text" value="<%=date %>" readonly></div></div>
				  
				              
                <!-- id -->
                <div class="profile-inp-row">
                <div class="profile-edit-label">Number of Travelers</div>
               <div class="controls">
				<input class="string optional" id="type" name="type" type="text" value="<%=number%>" readonly></div>
				&nbsp;&nbsp;&nbsp;<%-- <div class="profile-edit-label">Days</div>
                <div class="controls">
				<input class="string optional" id="days" name="days" type="text" value="<%=date%>" readonly></div>
					&nbsp;&nbsp;&nbsp;<div class="profile-edit-label">Rooms</div>
                <div class="controls">
				<input class="string optional" id="rooms" name="rooms" type="text" value="<%=date %>" readonly></div> --%>
				</div> 
	<hr>	  

<div class="profile-inp-row" >
                <div class="profile-edit-label" style="width:60%">Package Amount(per head)
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="re" name="re" type="text" value="<%=rs1.getString("foreignamount") %>" readonly></div></div></div></div>
              
                <%-- <div class="profile-edit-label" style="width:29%">Fixed Service Charges
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="fr" name="fr" type="text" value="<%=rs1.getString("nativeamount") %>" readonly></div></div></div> --%>
                </div>
                 
                
                
              </div>
		              <input type="button" onclick="calc()" value="Show rate">
		
	
		
		<div class="profile-inp-row" id="pay" style="display: none;">
                <div class="profile-edit-label">Amount to Pay</div>
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                

                <div class="controls"><input class="string tel optional" id="sum" name="sum" type="text" value="" readonly ></div></div></div>
              </div>
						
<hr>	
	<%} %>
		                <div class="c-p-heading">
            <div class="main-heading">Proceed to payment</div>
          </div>
 
		                <input type="submit" value="Procced" class="submit px-3">
  </div></div>
 
 </div>
    </form>
 </div>
     
</div>
</section>

 <jsp:include page="footer/footer.jsp"></jsp:include>
		
		<%}%>
               
               
               
               
               
               
               
        