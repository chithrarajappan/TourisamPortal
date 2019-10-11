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
	var b=parseInt(document.getElementById('fr').value);
	var c=parseInt(document.getElementById('days').value);
	var d=parseInt(document.getElementById('rooms').value);
	var pay=document.getElementById('sum');
    pay.value=(a*c*d)+(b*d);
}

</script>

<%@page import="java.util.Date" %>
 <jsp:include page="header/nativeheader.jsp"></jsp:include>
 
      <%@page import="java.sql.*" %>	  
		<%
		
		String date=request.getParameter("date");
		String type=request.getParameter("type");
		String days=request.getParameter("days");
		String rooms=request.getParameter("rooms");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String address=request.getParameter("ad");
		String idname=request.getParameter("idp");
		String idnum=request.getParameter("idn");
		String hotelid=request.getParameter("hid");
		String personid=request.getParameter("pid");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();
		try
		{
			
			int j=stmt.executeUpdate("INSERT INTO `tbl_booking`(`logid`, `name`, `phone`, `address`, `idproof`, `hotelid`, `date1`, `type1`, `days`, `rooms`) VALUES ('"+personid+"','"+name+"','"+phone+"','"+address+"','"+idname+"','"+hotelid+"','"+date+"','"+type+"','"+days+"','"+rooms+"')");
			String sql="select max(id)from tbl_booking";
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
		
          <form action="payment.jsp" class="review" method="post">
  	
    	
      	<!-- Menu Section -->
      	<div class="col-md-4 col-lg-4" style="background-color: #ede8ef;">
        <div class="menu-profile" >
          <p>Personal Details</p>
          </div>
     
                    <font color="black" size="2px"><b>
                 <div class="form-group row">
       
              <input type="hidden" name="hid" value="<%=hotelid%>">
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
           <center><div class="main-heading">Hotel Booking</div></center> 
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
		String sql1="SELECT * FROM tbl_homestaydetails INNER JOIN tbl_hotelregister where tbl_hotelregister.logid=tbl_homestaydetails.hotelid and tbl_homestaydetails.hotelid='"+hotelid+"'";
		rs1=stmt.executeQuery(sql1);
		while(rs1.next())
		{		
%>  
<!--             <form accept-charset="UTF-8" action="editprofile.jsp" class="simple_form edit_consumer" data-validate="true" id="edit_consumer_10697408" method="post" novalidate="novalidate" enctype="multipart/form-data">
             <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
 -->     <font size="2px">   
      <div class="profile-inp-row">
                <div class="profile-edit-label">Hotel Name</div>: &nbsp;<%=rs1.getString("hotel_name") %></div>            
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
                <div class="profile-edit-label">Room Type</div>
               <div class="controls">
				<input class="string optional" id="type" name="type" type="text" value="<%=type %>" readonly></div>
				&nbsp;&nbsp;&nbsp;<div class="profile-edit-label">Days</div>
                <div class="controls">
				<input class="string optional" id="days" name="days" type="text" value="<%=days %>" readonly></div>
					&nbsp;&nbsp;&nbsp;<div class="profile-edit-label">Rooms</div>
                <div class="controls">
				<input class="string optional" id="rooms" name="rooms" type="text" value="<%=rooms %>" readonly></div></div>
	<hr>	  

<div class="profile-inp-row" >
                <div class="profile-edit-label" style="width:29%">Room Rent
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="re" name="re" type="text" value="<%=rs1.getString(type) %>" readonly></div></div></div></div>
              
                <div class="profile-edit-label" style="width:29%">Fixed Service Charges
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="fr" name="fr" type="text" value="<%=rs1.getString("amountcharges") %>" readonly></div></div></div></div>
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
               
               
               
               
               
               
               
        