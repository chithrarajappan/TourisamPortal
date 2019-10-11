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
String title="";
String description="";
String tdate="";
String bloger="";
String id="";

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
        if (fileItem.getFieldName().equals("title"))
            {
        	      title=fileItem.getString();
            }
        else if (fileItem.getFieldName().equals("description"))
        {
        	      description=fileItem.getString();	    
        }
        else if (fileItem.getFieldName().equals("tdate"))
        {
        	      tdate=fileItem.getString();	    
        }
        else if (fileItem.getFieldName().equals("bloger"))
        {
        	     bloger=fileItem.getString();
        }
        else if (fileItem.getFieldName().equals("id"))
        {
        	     id=fileItem.getString();
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
            fileItem.write(new File("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\" + s ));
            fileItem.getOutputStream().close();
            try
            {

            Class.forName("com.mysql.jdbc.Driver");
            Connection  cn = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
            PreparedStatement ps=cn.prepareStatement("INSERT INTO `tbl_blog`(`title`, `description`, `pubdate`, `bloger`, `image`, `logid`) VALUES (?,?,?,?,?,?)");
            FileInputStream fin=new FileInputStream("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
            ps.setString(1,title);
            ps.setString(2,description);
            ps.setString(3,tdate);
            ps.setString(4,bloger);
            ps.setString(5,s);
            ps.setString(6,id);
            int i=ps.executeUpdate();
           
        if(i==1)
        {
        %>
            <html>
                <head>
                <script type="text/javascript">
                alert("Record Insert Succssfully ");
                </script></head>
                <body>
                </body>
                </html>
                <%
                response.sendRedirect("addblog.jsp");
        }
        else
        {
        %>
            <html>
            <head>
            <script type="text/javascript">
            alert("Record Insert Succssfully ");
            </script></head>
            <body>
            </body>
            </html>     
            <%
            response.sendRedirect("addblog.jsp");
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