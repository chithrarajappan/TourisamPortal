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
<%@ page import="java.sql.*"%>


<%
String hotelid="";
String hotelname="";
String account="";
String about="";
String nearby="";
String carpark="";
String ac="";
String wifi="";
String laundery="";
String charges="";
String single="";
String doubl="";
String image="";
String maplink="";



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
                if (fileItem.getFieldName().equals("id"))
                    {
                	     hotelid=fileItem.getString();
                    }
                else if (fileItem.getFieldName().equals("name"))
                {
                	     hotelname=fileItem.getString();
                	     
                }
                else if (fileItem.getFieldName().equals("account"))
                {
                	     account=fileItem.getString();
                	     
                }
                else if (fileItem.getFieldName().equals("about"))
                {
                	     about=fileItem.getString();

                }
                else if (fileItem.getFieldName().equals("nearby"))
                {
                	nearby=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("car"))
                {
                     carpark=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("ac"))
                {
                	ac=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("wifi"))
                {
                	 wifi=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("laun"))
                {
                	laundery=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("charge"))
                {
                	charges=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("single"))
                {
                	single=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("doubl"))
                {
                	doubl=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("maplink"))
                {
                	maplink=fileItem.getString();
                	
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
                   // out.println(s);
                    fileItem.getOutputStream().close();
                    /*out.println("</td>");*/

                    try
                    {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection  cn = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
                    PreparedStatement ps=cn.prepareStatement("insert into tbl_homestaydetails(id,hotelid,hotelname,account,about,nearby,carpark,ac,wifi,laundry,amountcharges,single,doubl,image,maplink) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    FileInputStream fin=new FileInputStream("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
                    //out.println(fin.available());     
                    ps.setString(1,hotelid);
                    ps.setString(2,hotelname);
                    ps.setString(3,account);
                    ps.setString(4,about);
					ps.setString(5,nearby);
                    ps.setString(6,carpark);
                    ps.setString(7,ac);
                    ps.setString(8,wifi);
                    ps.setString(9,laundery);
                    ps.setString(10,charges);
                    ps.setString(11,single);
                    ps.setString(12,doubl);
                    ps.setString(13,s);
                    ps.setString(14,maplink);
                    
                    
                    int i=ps.executeUpdate();
                    /*System.out.println(i+" records affected");*/

                if(i==1)
                {
                %>
                    <html>
                        <head>
                        <script type="text/javascript">
                        alert("Profile Updated Succesfully");
                        </script></head>
          
                        <body>
                        </body>
                        </html>
                        <%
                        response.sendRedirect("hotelhome.jsp");
                }
                else
                {
                %>
                    <html>
                    <head>
                    <script type="text/javascript">
                    alert("Failed to Upload");
                    </script></head>
                    <body>
                    </body>
                    </html>     
                    <%
                    response.sendRedirect("hotelhome.jsp");
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