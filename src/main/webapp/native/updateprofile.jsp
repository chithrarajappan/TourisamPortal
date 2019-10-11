<jsp:include page="header/nativeheader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script type="text/javascript">
function main()
{
	document.getElementById('profile1').style.display='block';
	document.getElementById('ep').style.display='none';
	document.getElementById('cp').style.display='none';
	document.getElementById('bk').style.display='block';
	document.getElementById('bk1').style.display='none';

}
function editprofile()
{
	document.getElementById('ep').style.display='block';
	document.getElementById('profile1').style.display='none';
	document.getElementById('cp').style.display='none';
	document.getElementById('bk').style.display='none';
	document.getElementById('bk1').style.display='none';


}
function changepass()
{
	document.getElementById('cp').style.display='block';
	document.getElementById('profile1').style.display='none';
	document.getElementById('ep').style.display='none';
	document.getElementById('bk').style.display='none';
	document.getElementById('bk1').style.display='none';

}
function book1()
{

	document.getElementById('profile1').style.display='block';
	document.getElementById('ep').style.display='none';
	document.getElementById('cp').style.display='none';
	document.getElementById('bk').style.display='block';
	document.getElementById('bk1').style.display='none';

}
function book2()
{

	document.getElementById('profile1').style.display='block';
	document.getElementById('ep').style.display='none';
	document.getElementById('cp').style.display='none';
	document.getElementById('bk').style.display='none';
	document.getElementById('bk1').style.display='block';

}

function check() {
    if(document.getElementById('password').value ==
            document.getElementById('confirm_password').value) {
        document.getElementById('message').innerHTML = "match";
    } else {
        document.getElementById('message').innerHTML = "no match";
    }
}
</script>



     <%@page import="java.sql.*" %>
	   <%
	  	if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
	  	{
	    response.sendRedirect("index.jsp"); 
	  	}
		String user=(String)session.getAttribute("user");
		String id=(String)session.getAttribute("uid");
		
		%>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
		Statement stmt=con.createStatement();
		%>
		<%
		String tp=request.getParameter("id");
		 
		ResultSet rs;
		String sql= "select * from tbl_nativeregister where logid='"+id+"'";
		rs=stmt.executeQuery(sql);
		%>


<!-- <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" name="viewport" />
  --><link href="https://d3u4hzlr7ozpoo.cloudfront.net/assets/application-afdbce6140549e688bdf1c9ac81362b2.css" media="screen" rel="stylesheet" type="text/css" />
 
<!--  <script src="https://d3u4hzlr7ozpoo.cloudfront.net/assets/application-ea984347d863e689e2d15ef00e7c27e8.js" type="text/javascript"></script>
 -->

<section class="ftco-section" style="height: 380px">
	<div class="container">		
		<div class="row">
		
	  <div class="new-pro-container">
    	<div class="row">
      	<!-- Menu Section -->
      	<div class="col-md-3 col-lg-3 ">
        <div class="menu-profile" style="background-color: #ede8ef;">
          <p>My Account</p>

          <ul class="menu-profile-account">
            <li class="menu-ico-1 selected"><i class="fa fa-cogs" aria-hidden="true"></i><span><a href="#main" class="nav-link" onclick="main()">Dashboard</a></span></li>
            <li class="menu-ico-1"><i class="fa fa-user" aria-hidden="true"></i><span><a href="#editprofile" class="nav-link" onclick="editprofile()">Edit Profile</a></span></li>
            <li class="menu-ico-1"><i class="fa fa-unlock-alt" aria-hidden="true"></i><span><a href="#changepassword" class="nav-link" onclick="changepass()">Change Password</a></span></li>
          </ul>

          <p>tour booking</p>
          <ul class="menu-tour-booking">
     
            <li id="myBookings"><i class="fa fa-file-text-o" aria-hidden="true"></i><span><a href="#bookhotel" class="nav-link" onclick="book1()">Hotel Bookings</a></span></li>
            <li id="myBookings"><i class="fa fa-file-text-o" aria-hidden="true"></i><span><a href="#bookpack" class="nav-link" onclick="book2()">Tour Package Bookings</a></span></li>
            
            
            <li id="wallet" class="menu-ico-wallet"><i class="fa fa-google-wallet" aria-hidden="true"></i><span>Wallet</span></li>
            <li id="reviews"><i class="fa fa-star" aria-hidden="true"></i>Reviews</li>
          </ul>
        </div>


        <div class="menu-questions" style="background-color: #ede8ef;">
          <p class="m-q-heading">Got a Question?</p>
          <hr class="m-q-ruler">
          <p class="m-q-description">Feel free to explore our <a href="https://thrillophilia.freshdesk.com/support/solutions">FAQ's</a> for any doubts. For any further queries, please connect.</p>

          <ul>
            <li>

              <i class="fa fa-envelope" aria-hidden="true"></i><span>goanywhere@gmail.com</span>
            </li>
            <li>
              <i class="fa fa-clock-o" aria-hidden="true"></i>
              <span>Raise a suppost ticket <a href="#">here</a></span>
            </li>
          </ul>
        </div>

      </div>

      <div class="col-md-9 col-lg-9">

        <!-- Wallet -->
        <div class="dashboard-card my-wallet" style="display: none;">
          <div class="c-p-heading">
            <div class="main-heading">My Wallet</div>
          </div>

          <div class="my-wallet-content">
            <div class="my-wallet-content-l">
              <div class="my-wallet-cont-bal">
                <p>MY WALLET BALANCE</p>
                <p>₹ 1000</p>
              </div>
              <hr>

              <!-- <div class="my-wallet-cont-thrill">
                <div>
                  <p>
                    <span>THRILLCASH+ :</span>
                    <span>₹ 0</span>
                    </p>
                </div>

                <p class="my-wallet-cash">
                  <span>THRILLCASH :</span>
                  <span>₹ 1000</span>
                </p>
              </div> -->


            </div>
            <div class="my-wallet-content-r">
              <form accept-charset="UTF-8" action="/users/redeem" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
                <input id="v_currency_tnx_discount_code" name="v_currency_tnx[discount_code]" placeholder="Got a Coupon Code?" size="30" type="text">
                <p class="coupon-result">
                  <span class="valid-coupon"><i class="fa fa-check"></i>Coupon Applied</span>
                  <span class="invalid-coupon"><i class="fa fa-close"></i>Invalid Coupon</span>
                </p>
                <input class="btn-redeem" id="redeem-button" name="commit" type="submit" value="Redeem">
				</form>          
			  </div>

          </div>
        </div>

        <div class="dashboard-card my-wallet" style="display: none;">
          <div class="c-p-heading">
            <div class="main-heading">Wallet Summary</div>
          </div>

          <div class="wallet-summary-cont">
            <div class="wallet-summary-table">
              <div class="wallet-sum-table-head">
                <div>Date</div>
                <div>Type</div>
                <div>TC Amount</div>
                <div>TC+ Amount</div>
              </div>

                <div class="wallet-sum-table-cont">
                  <div>22 Aug 2017</div>
                  <div>Thrillophilia Gifted Amount</div>
                  <div class="credit"> ₹ 1000.0</div>
                  <div class="credit"> ₹ 0.0</div>
                </div>
            </div>
          </div>
        </div>

        <!-- My Booking -->
        <div class="dashboard-card my-bookings mb-30" style="display: none;">
            <div class="block booking_voucher">
              <div class="nobooking-icon"></div>
              <h2>You didn't book any activities yet!</h2>
            </div>
        </div>

        <!-- Review List -->
        <div class="dashboard-card review-list" style="display: none;">

          <div class="c-p-heading">
            <div class="main-heading">Review List</div>
          </div>

          <div class="review-cont">
            <!-- <div class="review-row">
              <div class="image-containter">
                  <img src="/assets/aboutus/our_team/abhishek.png" alt="">
              </div>

              <div class="review-content">
                <div class="review-cont-heading">
                  <span class="review-cont-title">Burj Khalifa Tickets</span>

                  <span>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </span>
                  <span>June 15 2016</span>
                </div>
                
                <p>Spend your holidays in Dubai and explore the shimmering city like never before.Stay in a 3 star 
                  property. Take a half day city tour of Dubai. Indulge in Red Dune Bashing with all camp activities. 
                  This package also offers airport transfers.</p>

                <div class="review-images-cont">
                  <img src="https://images.thrillophilia.com/image/upload/s--kfgbcYxK--/c_fill,f_auto,fl_strip_profile,h_96,q_auto,w_159/v1/images/photos/000/074/454/original/10422983_990747214289822_8603906262426630283_n.jpg.jpg?1461561068" alt="">
                  <img src="https://images.thrillophilia.com/image/upload/s--kfgbcYxK--/c_fill,f_auto,fl_strip_profile,h_96,q_auto,w_159/v1/images/photos/000/074/454/original/10422983_990747214289822_8603906262426630283_n.jpg.jpg?1461561068" alt="">
                  <img src="https://images.thrillophilia.com/image/upload/s--kfgbcYxK--/c_fill,f_auto,fl_strip_profile,h_96,q_auto,w_159/v1/images/photos/000/074/454/original/10422983_990747214289822_8603906262426630283_n.jpg.jpg?1461561068" alt="">
                  <img src="https://images.thrillophilia.com/image/upload/s--kfgbcYxK--/c_fill,f_auto,fl_strip_profile,h_96,q_auto,w_159/v1/images/photos/000/074/454/original/10422983_990747214289822_8603906262426630283_n.jpg.jpg?1461561068" alt="">
                </div>
              </div>
            </div> -->

              <div class="block booking_voucher">
                <div class="nobooking-icon"></div>
                <h2>You haven't written any reviews yet.</h2>
              </div>
          </div>
        </div>

        <!-- Update Password -->
        <div class="dashboard-card update-password" id="cp" style="display: none;">
          <div class="c-p-heading">
            <div class="main-heading">Change Password</div>
          </div>

          <div class="profile-inpCont">
            <p>Passwords must be 8-20 characters long and contain at least 1 letter and 1 number</p>

            <form accept-charset="UTF-8" action="updatepassword.jsp" class="simple_form edit_consumer" id="edit_consumer_10697408" method="post">
            
            <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓">
            <input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
              
               <div class="profile-inp-row">
                <div class="profile-edit-label">Current Password*</div>
                <div class="profile-edit-inp"><input autocomplete="off" id="consumer_current_password" name="consumer[current_password]" placeholder="CURRENT PASSWORD" required="required" size="30" type="password" /></div>
              </div>

              <div class="profile-inp-row">
                <div class="profile-edit-label">New Password*</div>
                <div class="profile-edit-inp">
                <input autocomplete="off" id="password" name="password1" placeholder="NEW PASSWORD" required="required" size="30" type="password"></div>
              </div>

              <div class="profile-inp-row">
                <div class="profile-edit-label">Confirm Password*</div>
                <div class="profile-edit-inp">
                <input id="confirm_password" onkeyup="check()" name="confirm_password" placeholder="CONFIRM PASSWORD" required="required" size="30" type="password"></div>
                <span id='message'></span>
              </div>	

              <div class="profile-update-btnCont">
                <input class="btn button" name="commit" type="submit" value="Update">
              </div>
</form>
          </div>
        </div>
<%while (rs.next())
	{
	%>
        <!-- Edit Profile -->
        <div class="dashboard-card edit-profile" id="ep" style="display: none;">
          <div class="c-p-heading">
            <div class="main-heading">My Profile</div>
          </div>

          <div class="cp-edit">
            <div class="img-container">

              <img src="https://images.thrillophilia.com/image/upload/s--sw4068KU--/c_fill,f_auto,fl_strip_profile,h_580,q_auto,w_580/v1/consumers/photos/010/697/408/original/stringio.txt.jpg?1461580283" alt="">
            </div>

            
            <form accept-charset="UTF-8" action="" class="simple_form js-user-photo-form d-none" data-remote="true" enctype="multipart/form-data" id="edit_consumer_10697408" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
 </form>         </div>




          <div class="c-p-heading">
            <div class="main-heading">Account Information</div>
          </div>

          <div class="profile-inpCont">
            <form accept-charset="UTF-8" action="editprofile.jsp" class="simple_form edit_consumer" data-validate="true" id="edit_consumer_10697408" method="post" novalidate="novalidate" enctype="multipart/form-data">
            <div style="margin:0;padding:0;display:inline">
            <input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"><input name="authenticity_token" type="hidden" value="3w16Eecq2ccrH9tzr6tmZx0dDtYwU5J0+B0ZLu70SMQ="></div>
              <div class="profile-inp-row">
                <div class="profile-edit-label">First Name*</div>
                <div class="controls">
                <input class="string optional" id="first_name" name="name" placeholder="FIRST NAME" size="50" type="text" value="<%=rs.getString("name") %>" data-validate="true"></div></div>
              

                           
              <div class="profile-inp-row">
                <div class="profile-edit-label">Phone*</div>
                <div class="profile-edit-inp">
                <div class="control-group tel optional consumer_phone">
                <div class="controls"><input class="string tel optional" id="phone" name="phone" placeholder="PHONE" size="50" type="tel" value="<%=rs.getString("contact_number") %>" data-validate="true"></div></div></div>
              </div>
				
				<!-- address -->
				
				 <div class="profile-inp-row">
                <div class="profile-edit-label">Address*</div>
                
 				<div class="controls">
				<input class="string optional" id="ad" name="address" placeholder="Address" size="50" type="text" value="<%=rs.getString("address") %>" data-validate="true"></div></div>
				  
				 <div class="profile-inp-row">
                <div class="profile-edit-label">Profile Picture*</div>
                       <div class="controls">
                               <input type="file" id="updateProfilePic" name="file">
				</div> </div> 
				               
                <!-- id -->
                <div class="profile-inp-row">
                <div class="profile-edit-label">ID Proof*</div>
               <div class="controls">
				<input class="string optional" id="idp" name="id" placeholder="LAST NAME" size="50" type="text" value="<%=rs.getString("id_proof") %>" data-validate="true" disabled></div></div>
				
                
                <!-- id no -->
                <div class="profile-inp-row">
                <div class="profile-edit-label">ID Number*</div>
                <div class="controls">
				<input class="string optional" id="idn" name="idn" placeholder="LAST NAME" size="50" type="text" value="<%=rs.getString("id_details") %>" data-validate="true" disabled></div></div>
				
               
               
              <!-- <div class="profile-inp-row">
                <div class="profile-edit-label">Country*</div>
                <div class="profile-edit-inp">
                  <select name="" id="">
                    <option value="">SELECT</option>
                    <option value="">Male</option>
                    <option value="">Female</option>
                  </select>
                </div>
              </div> -->

              <div class="profile-update-btnCont">
                <input class="btn" name="commit" type="submit" value="Update Profile">
              </div>
              </form>
              </div>
<script>//<![CDATA[
if(window.ClientSideValidations===undefined)window.ClientSideValidations={};window.ClientSideValidations.disabled_validators=[];window.ClientSideValidations.number_format={"separator":".","delimiter":","};if(window.ClientSideValidations.patterns===undefined)window.ClientSideValidations.patterns = {};window.ClientSideValidations.patterns.numericality=/^(-|\+)?(?:\d+|\d{1,3}(?:\,\d{3})+)(?:\.\d*)?$/;if(window.ClientSideValidations.forms===undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['edit_consumer_10697408'] = {"type":"SimpleForm::FormBuilder","error_class":"help-inline","error_tag":"span","wrapper_error_class":"error","wrapper_tag":"div","wrapper_class":"control-group","wrapper":"bootstrap","validators":{}};
//]]></script>         
 
        </div>
        
 <!-- My Profile -->
        <div class="dashboard-card my-profile" id="profile1" style="display: block;">
          <div class="c-p-heading">
            <div class="main-heading">My Profile</div>
            <div id="profileEditProfile" class="main-heading-edit"><a href="#editprofile">Edit Profile</a></div>
          </div>
          <div class="c-p-content">
            <div class="img-container">
              <img src="https://images.thrillophilia.com/image/upload/s--sw4068KU--/c_fill,f_auto,fl_strip_profile,h_580,q_auto,w_580/v1/consumers/photos/010/697/408/original/stringio.txt.jpg?1461580283" alt="">
            </div>
          
            <div class="c-p-info-cont">
              <div class="info-row">
                <div>
                  <p class="info-col-left">
                    <span>Name</span>
                    <span><%=rs.getString("name") %></span>
                  </p>
                  <p>
                    <span>Email</span>
                    <span><%=user%></span>
                  </p>
                </div>
                <div>
                  <p>
                    <span>Phone</span>
                    <span class="pl-14"><%=rs.getString("contact_number") %></span>
                  </p>
                  <p>
                  <span></span>
                    <img src="../uploads/<%=rs.getString("image") %>" width="90px" height="100px">
                  
                  <!-- <p>Country <span>India</span></p> -->
                </div>
              </div>

              <hr>

<!--               <div class="profile-credits">

                <div class="pcredits-thrillplus">
                  <p>THRILLCASH+</p>
                  <p>₹ 0</p>
                </div>

                <div class="pcredits-thrill">
                  <p>THRILLCASH</p>
                  <p>₹ 1000</p>
                </div>
              </div> -->
            </div>
            <%
            } %>
          </div>
        </div>



        <div class="dashboard-card my-profile" id="bk" style="display: block;">
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                 
        
          
          <div class="c-p-heading">
            <div class="main-heading">Hotel Bookings</div>
            <div id="profileViewAllBooking" class="main-heading-edit">View All Booking</div>
          </div>
          <thead>
                    <tr><th>Booking id</th>	
                    <th>Booking Date</th> 
				    <th>Check-In Date</th>
				    <th>Room Type</th>
				    <th>Days of Stay</th>
					<th>Amount Payed</th>
          </tr></thead>

				<tbody>
				
				   
        <%
		ResultSet rs1;
		String sql1= "SELECT * FROM tbl_transaction INNER JOIN tbl_booking ON tbl_booking.logid=tbl_transaction.fromid where tbl_transaction.fromid='"+id+"'" ;
		rs1=stmt.executeQuery(sql1);
		
		
		while(rs1.next())
			{
		%>
        
				<tr><td><%=rs1.getString("bookingid")%></td>
					<td><%=rs1.getString("bookingdate")%></td>
					<td><%=rs1.getString("date1") %></td>
					<td><%=rs1.getString("type1") %></td>
					<td><%=rs1.getString("days") %></td>
					<td><%=rs1.getString("amount") %></td></tr>
				</tbody>
	        <%
			}
			%>
					 
            <div class="block booking_voucher">
            </div>
                             
                </table>
            
    		
			  <div class="c-p-heading">
            <div class="main-heading">Hotel Bookings</div>
            <div id="profileViewAllBooking" class="main-heading-edit">View All Booking</div>
          </div>

            <div class="block booking_voucher">
              <div class="nobooking-icon"></div>
              <h2>You didn't book any activities yet!</h2>
            </div>
			
	
        </div>



        <div class="dashboard-card my-profile" id="bk1" style="display: none;">
            
       
                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                 
        
          
          <div class="c-p-heading">
            <div class="main-heading">Tour Package Bookings</div>
            <div id="profileViewAllBooking" class="main-heading-edit">View All Booking</div>
          </div>
          <thead>
                    <tr><th>Booking id</th>	
                    <th>Booking Date</th> 
				    <th>Date of Journey</th>
				    <th>Number of Peoples</th>
				    <th>ID Given</th>
					<th>Amount Payed</th>
          </tr></thead>

				<tbody>
				 <%
		ResultSet rs2;
		String sql2= "SELECT * FROM tbl_transactionpack INNER JOIN tbl_packagebook ON tbl_packagebook.logid=tbl_transactionpack.fromid where tbl_packagebook.id=tbl_transactionpack.bookingid and tbl_transactionpack.fromid='"+id+"'" ;
		rs2=stmt.executeQuery(sql2);
		
		
		while(rs2.next())
			{
		%>
				<tr><td><%=rs2.getString("bookingid")%></td>
					<td><%=rs2.getString("bookingdate")%></td>
					<td><%=rs2.getString("date") %></td>
					<td><%=rs2.getString("number") %></td>
					<td><%=rs2.getString("idproof") %></td>
					<td><%=rs2.getString("amount") %></td></tr> 
				</tbody>	
				
				
            <div class="block booking_voucher">
            </div>
                             
                </table>
            
            <%
			}
			%>
			
			  <div class="c-p-heading">
            <div class="main-heading">Tour Package Bookings</div>
            <div id="profileViewAllBooking" class="main-heading-edit">View All Booking</div>
          </div>

            <div class="block booking_voucher">
              <div class="nobooking-icon"></div>
              <h2>You didn't book any activities yet!</h2>
            </div>
			
			
        </div>





        <div class="dashboard-card my-profile my-prof-review" style="display: block;">
          <div class="c-p-heading">
            <div class="main-heading">Reviews</div>
            <div id="profileViewAllReviews" class="main-heading-edit">View All Reviews</div>
          </div>

            <div class="block booking_voucher">
              <div class="nobooking-icon"></div>
              <h2>You haven't written any reviews yet!</h2>
            </div>
        </div>

      </div>
    </div>
  </div>
</div>
</div>
		
		
		
		
		
<jsp:include page="footer/footer.jsp"></jsp:include>
		