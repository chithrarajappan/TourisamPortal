<jsp:include page="header/header.jsp"></jsp:include>
      <%
   if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
   {
     response.sendRedirect("../index.jsp"); 
   }
String user=(String)session.getAttribute("user"); 
%>



<jsp:include page="footer/footer.jsp"></jsp:include>
   