<%-- 
    Document   : newtrain
    Created on : Oct 11, 2018, 9:22:02 PM
    Author     : RGUKT
--%>

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
        
        
        <%
        try{
            response.setContentType("text/html");
            String tnum=request.getParameter("trainno");
            String my[]=tnum.split("--");
            String tno=my[0] ;
            Class.forName("com.mysql.jdbc.Driver");
           
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="select * from trains where no= ?";
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1,tno);
           ResultSet rs=ps.executeQuery();
           rs.next();
          // String s=rs.getString(1);
           String trainno=rs.getString(1);
           String trainname=rs.getString(2);
           String source=rs.getString(3);
           String d=rs.getString(4);
           int sl=rs.getInt(5);
           int ac=rs.getInt(6);
           int sta=rs.getInt(7);
            int tn=Integer.parseInt(tno);
                
           
           
           
               %>
               <h2 align="center">Train Details </h2>
        <form action="addsched.jsp">
            <table cellpadding="5" align="center">
                <tr>
                    <td ><b>TrainNO</b></td>
                    <td> <input type="text" name="tno" value=<%= trainno %> /> </td>
                </tr>
 
                <tr>
                    <td><b>TrainName:</b></td>
                    <td><b><%=trainname %></b></td>
                </tr>
                <tr>
                    <td><b>Source:</b></td>
                    <td><b><%= source %></b></td>
                </tr>
                <tr>
                    <td><b>Destination</b></td>
                    <td><b><%= d %></b></td>
                </tr>
                <tr>
                    <td name="sta"><b>NoOfStations</b></td>
                    <td><b><%= sta %></b></td>
                </tr>
            </table><br><br>
                    
                <table cellpadding="5" align="center">
                    <tr>
                        <td><b>Station</b></td>
                         <td><b>Arrival Time</b></td>
                         <td><b>Destination Time</b></td>
                    </tr>
               
                
                <%
                    String result="",result2="",result3="";
                    int no ;
                  query="select * from schedule where trainno= ?";
                  ps=con.prepareStatement(query);
                  ps.setInt(1,tn);
                  
                  rs=ps.executeQuery();
                  
                  while(rs.next()){
                      %>
                 
                <%
                     // no= rs.getInt(1) ;
                      result=rs.getString(2);
                      result2=rs.getString(3);
                      result3=rs.getString(4);
                      
                  
                %>
                <tr>
                        <td> <%=result%> </td>
                        <td> <%=result2%></td>
                        <td> <%=result3%></td>
                        </tr>
                <%}%>
                </table><br><br>
               
                        
                        <%
                           
                        }
catch(Exception e){

    out.println(e);
                        %>
                        <h2>Sorry no train found</h2>
                        <%
                            }
                            %>
    	</div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 @B141005</div>        
    </div>
</body>
</html>                            
