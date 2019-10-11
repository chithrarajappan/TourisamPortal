
     <%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*" %>
<%@ page language="java"  errorPage="" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.io.output.*"%>
 <%@page import="java.util.Iterator,java.util.List" %>
 <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload.*"%> 
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory.*"%> 
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@page import="org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.util.*"%>



	   <%
	  	if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) 
	  	{
	    response.sendRedirect("index.jsp"); 
	  	}
		String user=(String)session.getAttribute("user");
		String id=(String)session.getAttribute("uid");
		
		%>
			
<%
	String name1="";
	String phone1="";
	String address1="";
	
	
		
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            /*out.println("You are not trying to upload<br/>");*/
            return;
        }
        /*out.println("You are trying to upload<br/>");*/

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> fields = upload.parseRequest(request);
            /*out.println("Number of fields: " + fields.size() + "<br/><br/>");*/
            Iterator<FileItem> it = fields.iterator();
            if (!it.hasNext())
             {
                return;
             }
            while (it.hasNext()) 
            {
                FileItem fileItem = it.next();   
                if (fileItem.getFieldName().equals("name"))
                    {
                	     name1=fileItem.getString();
                    }
                else if (fileItem.getFieldName().equals("phone"))
                {
                	     phone1=fileItem.getString();
           
                }
                else if (fileItem.getFieldName().equals("address"))
                {
                	     address1=fileItem.getString();
                	     
                }
                    else
                        {
                        /*out.println("hi u not success"); */
                        }
                /*out.println("<tr>");*/

                boolean isFormField = fileItem.isFormField();

                if (isFormField) 
                {
                    /*out.println("<td>regular form field</td><td>FIELD NAME: " + fileItem.getFieldName() +     "<br/>STRING: " + fileItem.getString() );
                    out.println("</td>");*/
                }

                else
                     {
                    String s = fileItem.getName().substring(fileItem.getName().lastIndexOf("\\")+1);
                    fileItem.write(new File("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s));
                   // out.println(s);
                    fileItem.getOutputStream().close();
                    /*out.println("</td>");*/

                    try
                    {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection  cn = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
                    PreparedStatement ps=cn.prepareStatement("update tbl_nativeregister set name=?,contact_number=?,address=?,image=? where logid=?");
                    FileInputStream fin=new FileInputStream("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
                    //out.println(fin.available());     
                    ps.setString(1,name1);
                    ps.setString(2,phone1);
                    ps.setString(3,address1);
                    ps.setString(4,s);
                    ps.setString(5,id);
                    
                    int i=ps.executeUpdate();
                    /*System.out.println(i+" records affected");*/

                if(i==1)
                {
                %>
                    <html>
                        <head>
                        <script type="text/javascript">
                        alert("profile updated ");
                        </script></head>
          
                        <body>
                        </body>
                        </html>
                        <%
                        response.sendRedirect("updateprofile.jsp");
                 }
                else
                {
                %>
                    <html>
                    <head>
                    <script type="text/javascript">
                    alert("failed");
                    </script></head>
                    <body>
                    </body>
                    </html>     
                    <%
                    response.sendRedirect("updateprofile.jsp");
                }
                cn.close();

                }
                catch(Exception e)
                {
                    out.println(e.toString());
                }
%>

<%



                }
                /*out.println("</tr>");             */
            }
            /*out.println("</table>");*/


        } catch (FileUploadException e) {
            e.printStackTrace();
        }
%>
			
			