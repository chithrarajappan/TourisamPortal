package agentmail;

import java.io.IOException;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.*;
import org.apache.commons.io.output.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory.*; 
import org.apache.commons.fileupload.*; 
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import java.util.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadServlet extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String packagename="";
    	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
               
                if (item.getFieldName().equals("packagename"))
                {
                	packagename=item.getString();
                }
           
               
                else
                    {
                    /*out.println("hi u not success"); */
                    }
            /*out.println("<tr>");*/

            boolean isFormField = item.isFormField();

            if (isFormField) 
            {
                /*out.println("<td>regular form field</td><td>FIELD NAME: " + fileItem.getFieldName() +     "<br/>STRING: " + fileItem.getString() );
                out.println("</td>");*/
            }

            else {
                try {
                String itemName = item.getName();
                File savedFile = new File("J:\\workspace\\eclipse\\tourisam\\src\\main\\webapp\\uploads\\"+itemName);
                
                item.write(savedFile);  
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tourismportal","root","");  
                Statement stmt = con.createStatement();  
                String sql="INSERT INTO `tbl_moreplaceimg`(`placename`, `moreimge`,`imid`)values('"+packagename+"','"+itemName+"','0')";
               int s= stmt.executeUpdate(sql);
                if(s>0)
                {
                	response.sendRedirect("admin/placelist.jsp");
                }
                else{
                	response.sendRedirect("admin/placelist.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        }
    }
    }
}
 
           