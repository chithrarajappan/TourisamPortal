<html>
<head>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" ></script>
    <script type="text/javascript">
        //when the webpage has loaded do this
        $(document).ready(function() {  
            //if the value within the dropdown box has changed then run this code            
            $('#num_cat').change(function(){
                //get the number of fields required from the dropdown box
                var num = $('#num_cat').val();                  

                var i = 0; //integer variable for 'for' loop
                var html = ''; //string variable for html code for fields 
                //loop through to add the number of fields specified
                for (i=1;i<=num;i++) {
                    //concatinate number of fields to a variable
                    //html += 'Category ' + i + ': <input type="text" name="category-' + i + '"/><br/>'; 
                    html += 'Category ' + i + ': <textarea name="category-' + i + '" rows="15" cols="50"/></textarea><br/>';
                    }

                //insert this html code into the div with id catList
                $('#catList').html(html);
            });
        }); 
    </script>
</head>
<body>
    <form method="post" action="">
        Number of fields required:      
        <select id="num_cat" name="num_cat">
            <option value="0">- SELECT -</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>

        <div id="catList"></div>
        <label><b>Inclusions</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/>
                <input type="checkbox" name="inclusions" value="Accommodation">Accommodation &nbsp;&nbsp;  
                <input type="checkbox"  name="inclusions" value="Transpotation">Transpotation &nbsp;&nbsp;
                <input type="checkbox"  name="inclusions" value="Room for refreshment">Room for refreshment
                
                   
        <input type="submit" name="submit" value="Submit"/>
    </form>
</body>
</html>

<%@ page import="java.sql.*" %>
<%
if(request.getParameter("submit")!=null)
{
/*String c1=request.getParameter("category-1");
if(c1!=null){out.println(c1);}else{out.print("null");} 
String c2=request.getParameter("category-2");
if(c2!=null){out.println(c2);}else{out.print("null");}  
String c3=request.getParameter("category-3");
if(c3!=null){out.println(c3);}else{out.print("null");} 
String c4=request.getParameter("category-4");
if(c4!=null){out.println(c4);}else{out.print("null");} 
String c5=request.getParameter("category-5");
if(c5!=null){out.println(c5);}else{out.print("null");} 
String c6=request.getParameter("category-6");
if(c6!=null){out.println(c6);}else{out.print("null");}*/
String languages="";
String lang[]=request.getParameterValues("inclusions");
for(int i=0;i<lang.length;i++){
    languages+=lang[i]+" ";
}
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourismportal", "root", "");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into tbl_package(packname,packimage) values('"+languages+"','null')");
    out.println("Data is successfully inserted into database.");
    }
    catch(Exception e){
    System.out.println(e);
    }
}
%>