<jsp:include page="header/header.jsp"></jsp:include>
 <%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();	
%>
    <section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h4"><b>Contact Information</b></h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3">
            <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
          </div>
          <div class="col-md-3">
            <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Website</span> <a href="#">yoursite.com</a></p>
          </div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last pr-md-5">
            <form action="" method="post">
              <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Your Name" required="required">
              </div>
              <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Your Email" required="required">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" placeholder="Subject" required="required">
              </div>
              <div class="form-group">
                <textarea name="message" id="" cols="30" rows="7" class="form-control" placeholder="Message" required="required"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" name="sendmsg" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-6">
          	<div><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7891.5521127072425!2d76.9572311222063!3d8.52111058593147!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b05bbd44fe25f35%3A0xff3e9d11fd5c770b!2sKowdiar%2C+Thiruvananthapuram%2C+Kerala+695003!5e0!3m2!1sen!2sin!4v1554789321939!5m2!1sen!2sin" width="500" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
          </div>
        </div>
      </div>
    </section>

	<!-- <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
<jsp:include page="footer/footer.jsp"></jsp:include>
<%
if(request.getParameter("sendmsg")!=null)
{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String message=request.getParameter("message");
	String sql="INSERT INTO `tbl_contactus`(`name`, `email`, `subject`, `message`) VALUES('"+name+"','"+email+"','"+subject+"','"+message+"')";
	int i=stmt.executeUpdate(sql);
}
%>
   