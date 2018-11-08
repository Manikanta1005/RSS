<%-- 
    Document   : index
    Created on : Oct 11, 2018, 6:14:40 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Railways</title>
<style type="text/css">
    /* Add some padding on document's body to prevent the content
    to go underneath the header and footer */
    body{        
        padding-top: 60px;
        padding-bottom: 40px;
    }
    .container{
        width: 80%;
        margin: 0 auto; /* Center the DIV horizontally */
    }
    .fixed-header, .fixed-footer{
        width: 100%;
        position: fixed;        
        background: #333;
        padding: 10px 0;
        color: #fff;
    }
    .fixed-header{
        top: 0;
    }
    .fixed-footer{
        bottom: 0;
    }    
    /* Some more styles to beutify this example */
    nav a{
        color: #fff;
        text-decoration: none;
        padding: 7px 25px;
        display: inline-block;
    }
    .container p{
        line-height: 200px; /* Create scrollbar to test positioning */
    }
    #mine{
        background: #349;
    }
    .button {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
}
</style>
</head>
<body>
    <%
        %>
        <datalist id="trains">
    <%
            String result="",result2="",result3="",s2="";
        try{
            response.setContentType("text/html");
            //String tno=request.getParameter("tno");
                  
            Class.forName("com.mysql.jdbc.Driver");
           
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="select no,name from trains";
           PreparedStatement ps;
           ps=con.prepareStatement(query);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               result=rs.getString(1)+"--"+rs.getString(2); 
           %>
           <option value="<%= result%>">
<%
    }
        }
        catch(Exception e){
           out.println("hi"); 
        }
    
    
    %>
  </datalist>
    <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
                <a href="#">TrainDetails</a>
                <a href="">Trains b/w Stations</a>
                <a href="checkAvailability.jsp">Availability</a>
                <a href="Login.jsp">Login</a>
            </nav>
        </div>
    </div>
    <div class="container">
        
        <h2 align="center">Get Train Route Details</h2>
        <form name="reg" action="getshedule.jsp" ">
            <table cellpadding="5">
                <tr>
                    <td><b>TrainNO</b></td>
                    <td><input list="trains" name="trainno"  required/></td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input class="button" type="submit" value="Check Train"/></td>
                    
                </tr>
 
            </table>
        </form>
        <div id="mani"></div>
        
           
        
    	</div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 @B141005</div>        
    </div>
</body>
</html>                            