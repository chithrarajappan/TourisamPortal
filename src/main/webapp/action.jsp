<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
 <head><title>Upload page</title></head><body>
 <form action="UploadServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
   <center>
   <table border="1">
       <tr>
           <td align="center"><b>Multipale file Uploade</td>
       </tr>
       <tr>
           <td>
               Specify file: <input name="file" type="file" id="file" multiple>
           </td>
       </tr>
         <tr>
            <td align="center">
               <input type="submit" name="Submit" value="Submit files"/>
            </td>
         </tr>
    </table>
    <center>
 </form>
 </body>
 </html>