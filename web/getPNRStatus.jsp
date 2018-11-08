<%-- 
    Document   : newtrain
    Created on : Oct 11, 2018, 9:22:02 PM
    Author     : RGUKT
--%>

<%@page import="java.util.Random"%>
<%@page import="java.lang.NumberFormatException"%>
<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page import="com.StationNotFound"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : index
    Created on : Oct 11, 2018, 6:14:40 PM
    Author     : RGUKT
--%>

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
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("Login.jsp");
        }
        %>
    <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="home.jsp">Home</a>
                <a href="#">TrainSchedule</a>
                <a href="#">PNR Status</a>
                <a href="#">TrainDetails</a>
                <a href="newReserve.jsp">BookTicket</a>
                <a href="checkAvailability.jsp">Availability</a>
                <a href="Logout.jsp">Logout</a>
            
            </nav>
        </div>
    </div>
    <div class="container">
        
        
        <%
            String result="",result2="",result3="",s2="";
        try{
            response.setContentType("text/html");
            
            Class.forName("com.mysql.jdbc.Driver");
           String pno=request.getParameter("pnrno") ;
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="";
           PreparedStatement ps;
           PreparedStatement ps2;
           PreparedStatement ps3;
                  
                 // String sour= request.getParameter("source");
                 // String de=request.getParameter("destination");
                  query="select * from reserve where sno= ?";
                   
                  ps=con.prepareStatement(query);
                  ps.setString(1,pno);
                  ResultSet rs=ps.executeQuery();
                  
                  if(rs.next()){
                   String num=rs.getString(1);
                   String tname=rs.getString(2);
                   String fare=rs.getString(5);
                   String date=rs.getString(3);
                   String type=rs.getString(4);
                   
                 //result is id of  previous station
                  
               %>
               <h2 align="center">PNR Status </h2>
        <form >
            <table cellpadding="5" align="center">
                <tr>
                    <td><b>PNR NO</b></td>
                    <td><b> <%= num %> </b></td>
                </tr>
 
                <tr>
                    <td><b>TrainNO:</b></td>
                    <td><b><%= tname %></b></td>
                </tr>
                <tr>
                    <td><b>Fare</b></td>
                    <td><b><%= fare%></b></td>
                </tr>
                <tr>
                    <td><b>date</b></td>
                    <td><b><%= date %></b></td>
                </tr>
                <tr>
                    <td><b>Type</b></td>
                    <td><b><%= type %></b></td>
                </tr>
                
            </table>
        </form>
               
                  <%
                      
           }
    }
   
          


        catch(Exception e) {
%>
      <h2 align="center"> Some kind of Error occured </h2>
      <li>Reasons might be</li>
      <li>1.Stations invalid</li>
      <li>2.Software failure</li>
      <li>3.??</li>
      <li>We'll figure it out</li>
               <%
                   out.println(e);
            e.printStackTrace();
        }
        %>
    	</div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 </div>        
    </div>
</body>
</html>                            
