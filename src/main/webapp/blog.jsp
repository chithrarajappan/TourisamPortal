<jsp:include page="header/header.jsp"></jsp:include>
 <%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
Statement stmt=con.createStatement();	
%>

 <section class="ftco-section bg-light">
   <div class="container">
			<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">Blog & Articles</h2>
          </div>
        </div>    		
   </div>
      <div class="container-fluid">
      <div class="row d-flex">
      <% 
        String sql="SELECT * FROM `tbl_blog` ORDER BY id DESC";
        ResultSet rs=stmt.executeQuery(sql);
        while(rs.next())
        {
        	String des=rs.getString("description");
			int start = 0; 
			int end = 50; 
			char description[] = new char[end - start]; 
			des.getChars(start, end, description, 0);    
        %>
          <div class="col-md-4 d-flex ftco-animate">
            <a href="blogmore.jsp?id=<%=rs.getString("id")%>"><div class="blog-entry align-self-stretch">
              <a href="blogmore.jsp?id=<%=rs.getString("id")%>" class="block-20" style="background-image: url('uploads/<%=rs.getString("image")%>');">
              </a>
              <div class="text">
              	<span class="tag"><%=rs.getString("title") %></span>
                <h3 class="heading mt-3"><a href="blogmore.jsp?id=<%=rs.getString("id")%>"><%=description %>...</a></h3>
                <div class="meta mb-3">
                  <div><a href="blogmore.jsp?id=<%=rs.getString("id")%>"><span class="icon-calendar"></span> <%=rs.getString("pubdate") %></a></div>
                  <div><a href="blogmore.jsp?id=<%=rs.getString("id")%>"><span class="icon-person"></span><%=rs.getString("bloger") %></a></div>
                  <%-- <div><a href="blogmore.jsp?id=<%=rs.getString("id")%>" class="meta-chat"><span class="icon-chat"></span></a></div> --%>
                </div>
              </div>
            </div>
            </a>
          </div>
          <% } %> 

        </div>
<!--      <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> -->
      </div>
    </section>
    <jsp:include page="footer/footer.jsp"></jsp:include>