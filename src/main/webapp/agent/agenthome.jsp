<%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
   else{
%>
<jsp:include page="header/header.jsp"></jsp:include>

<% String user=(String)session.getAttribute("user");
String id=(String)session.getAttribute("uid");%>








</div>
<jsp:include page="footer/footer.jsp"></jsp:include>
<%}%>