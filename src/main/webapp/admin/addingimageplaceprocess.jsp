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
String plid="";
String placename="";
String state="";
String district="";
String description="";
String address="";
String maplink="";
String railway="";
String busstation="";
String points="";

Class.forName("com.mysql.jdbc.Driver");
Connection  cn = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");


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
                if (fileItem.getFieldName().equals("plimid"))
                    {
                	     plid=fileItem.getString();
                	     
                    }
                 else if (fileItem.getFieldName().equals("placename"))
                    {
                	     placename=fileItem.getString();
                    }
                
                else if (fileItem.getFieldName().equals("state"))
                {
                	     state=fileItem.getString();
                	     //out.print(state);
                }
                else if (fileItem.getFieldName().equals("district"))
                {
                	     district=fileItem.getString();
                	     
                }
                else if (fileItem.getFieldName().equals("description"))
                {
                	description=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("address"))
                {
                     address=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("maplink"))
                {
                	maplink=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("railway"))
                {
                	 railway=fileItem.getString();
                	 
                }
                else if (fileItem.getFieldName().equals("busstation"))
                {
                	busstation=fileItem.getString();
                }
                else if (fileItem.getFieldName().equals("points"))
                {
                	points=fileItem.getString();
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

                    PreparedStatement ps=cn.prepareStatement("insert into tbl_touristplace(touristplace,state,district,description,address,map_link,nearest_railway,nearest_bus,pointof_interest,image)values(?,?,?,?,?,?,?,?,?,?)");
                    FileInputStream fin=new FileInputStream("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+s);
                    //out.println(fin.available());     
                    ps.setString(1,placename);
                    ps.setString(2,state);
                    ps.setString(3,district);
                    ps.setString(4,description);
                    ps.setString(5,address);
                    ps.setString(6,maplink);
                    ps.setString(7,railway);
                    ps.setString(8,busstation);
                    ps.setString(9,points);
                    ps.setString(10,s);
                    int i=ps.executeUpdate();
                    /*System.out.println(i+" records affected");*/
	
					
		String sql="select max(id) from tbl_touristplace";
                   Statement stmt=cn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			String pid=rs.getString(1);
			//out.print(pid);
			String sql5="update tbl_moreplaceimg set imid='"+pid+"' where id='"+plid+"'";
			stmt.executeUpdate(sql5);
			
		}
				    
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
                        response.sendRedirect("addingplaces.jsp");
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
                    response.sendRedirect("addingplaces.jsp");
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
			
			