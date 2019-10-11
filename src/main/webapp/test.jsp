<%@ page contentType="text/html; charset=ISO-8859-1"
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Page</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <link rel="stylesheet" href="style.css" />
<style type="text/css">

            .btn
            {
                background-color:pink;
                border:lime;
                color:coffee;
                border-size:3;

            }
            </style>

</head>
<body>
    <form name="form1" id="form1" action="" method="post" enctype="multipart/form-data">
    <!--<input type="hidden" name="hiddenfield1" value="ok">-->
    <h1 align="center">PersonDetail Detail</h1>
<hr color="pink" width="50%" size="5%" align="center">
<br>
<table border="5" align="center" bordercolor="lime">    

<tr>
        <td>PName</td>
        <td><input type="text" name="pname" size="50" ></td>

</tr>


<tr>
    <td>Photo Upload :</td>
    <td>

<input type="file"  name="file1" ></td>
</tr>
<tr>
    <td colspan="2" align="center">

    <input type="submit" value="INSERT" class="btn">
</td>

</tr> 
</table>
</form>


<%
String pname="";





    /*  out.println();
        out.println("My Page");*/
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
                /*out.println("No fields found");*/
                return;
            }
            /*out.println("<table border=\"1\">");*/
            while (it.hasNext()) 
            {


                FileItem fileItem = it.next();

                
                if (fileItem.getFieldName().equals("pname"))
                    {
                             pname=fileItem.getString();
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
                    fileItem.write(new File("C:\\Chithra-Eclipse\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\" + s ));
                   // out.println(s);
                    fileItem.getOutputStream().close();
                    /*out.println("</td>");*/

                    try
                    {
        /*
                    out.println("pid====>"+pid);
                    out.println("pname====>"+pname);
                    out.println("inroduction====>"+introduction);
                    out.println("address====>"+address);
                    out.println("phone====>"+phone);
                    out.println("mo====>"+mo);
                    out.println("email====>"+email);

            */      

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection  cn = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");
                    PreparedStatement ps=cn.prepareStatement("insert into tbl_package(packname,packimage) values(?,?)");
                    FileInputStream fin=new FileInputStream("C:\\Chithra-Eclipse\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
                    out.println(fin.available());     
                    ps.setString(1,pname);
                    ps.setString(2,s);
                    int i=ps.executeUpdate();
            /*      System.out.println(i+" records affected");*/

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

</body>
</html>