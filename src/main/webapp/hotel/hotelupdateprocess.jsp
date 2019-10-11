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
String gym="";
String wifi="";
String restaurent="";
String laundery="";
String bar="";
String ac="";
String spa="";
String pool="";
String playground="";
String conference="";
String wc="";
String charges="";
String single="";
String doubl="";
String family="";
String dormitory="";
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
                	     out.print("about");     
                }
                else if (fileItem.getFieldName().equals("nearby"))
                {
                	nearby=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("car"))
                {
                     carpark=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("gym"))
                {
                	gym=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("wifi"))
                {
                	 wifi=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("res"))
                {
                	restaurent=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("laun"))
                {
                	laundery=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("bar"))
                {
                	bar=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("ac"))
                {
                	ac=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("spa"))
                {
                	spa=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("pool"))
                {
                		pool=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("play"))
                {
                	playground=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("con"))
                {
                	conference=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("wc"))
                {
                	wc=fileItem.getString();
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
                else if (fileItem.getFieldName().equals("family"))
                {
                	family=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("dormitory"))
                {
                	dormitory=fileItem.getString();
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
                    PreparedStatement ps=cn.prepareStatement("INSERT INTO tbl_hoteldetails(hotelid,hotelname,account,about,nearbyattractions,carpark,gym,wifi,restaurent,laundery,bar,ac,spa,pool,playground,conference,wheelchair,amountcharges,single,doubl,family,dormitory,image,maplink)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    FileInputStream fin=new FileInputStream("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
                    //out.println(fin.available());     
                    ps.setString(1,hotelid);
                    ps.setString(2,hotelname);
                    ps.setString(3,account);
                    ps.setString(4,about);
                    ps.setString(5,nearby);
                    ps.setString(6,carpark);
                    ps.setString(7,gym);
                    ps.setString(8,wifi);
                    ps.setString(9,restaurent);
                    ps.setString(10,laundery);
                    ps.setString(11,bar);
                    ps.setString(12,ac);
                    ps.setString(13,spa);
                    ps.setString(14,pool);
                    ps.setString(15,playground);
                    ps.setString(16,conference);
                    ps.setString(17,wc);
                    ps.setString(18,charges);
                    ps.setString(19,single);
                    ps.setString(20,doubl);
                    ps.setString(21,family);
                    ps.setString(22,dormitory);
                    ps.setString(23,s);
                    ps.setString(24,maplink);
                    
                    
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