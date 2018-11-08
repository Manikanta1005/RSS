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
                <a href="ahome.jsp">Home</a>
                <a href="atrain.jsp">Add Train</a>
                <a href="nshed.jsp">Add Schedule</a>
                <a href="#">Add Station</a>
                <a href="#">Add Route</a>
                <a href="#">Add Admin</a>
                <a href="#">Update Fairs</a>
                <a href="Logout.jsp">Logout</a>
            </nav>
        </div>
    </div>
    <div class="container">
        
        
        <%
        try{
            response.setContentType("text/html");
            String tno=request.getParameter("trainno");
              
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
        String status=request.getParameter("status");
        
        if(status!=null){
            if(status.equals("false")){
                   %>
                   <h2 align="center" >Sorry incorrect time details </h2>
           <%                      
            }
            else{
                out.print("Some error occurred!");
            }
        }

                
           
           
           
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
   </table>
                    <br>  <h2 align="center"><b>Stations b/w <%=source%> and <%=d%></b></h2>
                <table cellpadding="5" align="center">
                    
               
                <tr>
                <%
                    String result="",result2="",result3="";
                  query="select id from stations where name= ?";
                  ps=con.prepareStatement(query);
                  ps.setString(1,source);
                  
                  rs=ps.executeQuery();
                  while(rs.next())
                      result+=rs.getInt(1);
                  
                  query="select id from stations where name= ?";
                  PreparedStatement ps2;
                  ps2=con.prepareStatement(query);
                  ps2.setString(1,d);
                  rs=ps2.executeQuery();
                  while(rs.next())
                      result2+=rs.getInt(1);
           int a=Integer.parseInt(result);
           int b=Integer.parseInt(result2);
           int c=a,e=b,f;
           String mam;
           if(a<b){
           
           for(int j=a;j<=b;j++){
               query="SELECT name FROM stations limit ?,1" ;
               ps=con.prepareStatement(query);
               ps.setInt(1,j-1) ;
               rs=ps.executeQuery();
               rs.next();
               mam=rs.getString(1);
               %>
               <td><b> </b></td>
               <td><b><%=mam%></b></td>
           <%}
        }
else{


           for(int j=a;j>=b;j--){
               query="SELECT name FROM stations limit ?,1" ;
               ps=con.prepareStatement(query);
               ps.setInt(1,j-1) ;
               rs=ps.executeQuery();
               rs.next();
               mam=rs.getString(1);
               %>
               <td><b> </b></td>
               <td><b><%=mam%></b></td>
           <%}
} %>
                </tr>
                </table><br><br>
                <h2 align="center">Train Schedule </h2>
                
                     <table cellpadding="5" align="center">
                         <td><b>Station</b></td>
                         <td><b>Arrival Time</b></td>
                         <td><b>Destination Time</b></td>
                    <%
                       for(int j=1;j<=sta;j++){
                        %>
                        <tr>
                        <td> <input type="text" required name=<%="station"+j%> /></td>
                        <td> <input type="time" required name=<%="ati"+j%>></td>
                        <td> <input type="time" required name=<%="dt"+j%> /></td>
                        </tr>
                    <%
                        }
                        %>
                        <tr>
                    <td colspan="3" align="center"  ><input class="button" type="submit" value="Add schedule"/></td>
                    
                </tr>
                         </table>
                </form> 
                        
                        <%
                           
                        }
catch(Exception e){
response.sendRedirect("nshed.jsp?msg=no");
   // out.println(e);
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
