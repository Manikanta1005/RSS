<%-- 
    Document   : newtrain
    Created on : Oct 11, 2018, 9:22:02 PM
    Author     : RGUKT
--%>

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
            String result="",result2="",result3="",s2="";
        try{
            response.setContentType("text/html");
            String tno=request.getParameter("tno");
                  
            Class.forName("com.mysql.jdbc.Driver");
           
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="";
           PreparedStatement ps;
           PreparedStatement ps2;
           PreparedStatement ps3;
                  
                  String sour= request.getParameter("source");
                  String de=request.getParameter("destination");
                  query="select id from stations where name= ?";
                   
                  ps=con.prepareStatement(query);
                  ps.setString(1,sour);
                  ResultSet rs=ps.executeQuery();
                  while(rs.next())
                      result+=rs.getInt(1);
                  query="select id from stations where name= ?";
                  ps2=con.prepareStatement(query);
                  ps2.setString(1,de);
                  rs=ps2.executeQuery();
                 
                  while(rs.next())
                      result2+=rs.getInt(1);
                  
           int a=Integer.parseInt(result);
           int b=Integer.parseInt(result2);
          
           if(a>0&&a<=11&&b>0&&b<=11){
           
                  
                  
                  
           query="insert into trains values (?,?,?,?,?,?,?)";
           ps=con.prepareStatement(query);
           ps.setString(1,request.getParameter("trainno")) ;
           ps.setString(2,request.getParameter("trainname"));
           ps.setString(3,request.getParameter("source"));
           ps.setString(4,request.getParameter("destination"));
           ps.setString(5,request.getParameter("sleeper"));
           ps.setString(6,request.getParameter("ac"));
           ps.setString(7,request.getParameter("noofstations"));
           int i=ps.executeUpdate();
           if(i>0){
               %>
               <h2 align="center">New Train added successfully </h2>
        <form action="newtrain.jsp">
            <table cellpadding="5" align="center">
                <tr>
                    <td><b>TrainNO</b></td>
                    <td><b> <%= request.getParameter("trainno") %> </b></td>
                </tr>
 
                <tr>
                    <td><b>TrainName:</b></td>
                    <td><b><%= request.getParameter("trainname") %></b></td>
                </tr>
                <tr>
                    <td><b>Source:</b></td>
                    <td><b><%= request.getParameter("source") %></b></td>
                </tr>
                <tr>
                    <td><b>Destination</b></td>
                    <td><b><%= request.getParameter("destination") %></b></td>
                </tr>
                <tr>
                    <td><b>Sleeper</b></td>
                    <td><b><%= request.getParameter("sleeper") %></b></td>
                </tr>
                <tr>
                    <td><b>AC</b></td>
                    <td><b><%= request.getParameter("ac") %></b></td>
                </tr>
                <tr>
                    <td><b>NoOfStations</b></td>
                    <td><b><%= request.getParameter("noofstations") %></b></td>
                </tr>
                
            </table>
        </form>
               
                  <%
                      
           }
    }
    else{
    
    String mine=sour+"  or "+de+" is not there in the list";
    throw new StationNotFound(mine);
    }
          
}
catch(MySQLIntegrityConstraintViolationException e2){
response.sendRedirect("atrain.jsp?msg=already") ;
}
catch(StationNotFound e ){
response.sendRedirect("atrain.jsp?msg=station") ;
}
catch(NumberFormatException e2){
response.sendRedirect("atrain.jsp?msg=station") ;
}
        catch(Exception e){
%>
      <h2 align="center"> Train failed to add to the database </h2>
      <li>Reasons might be</li>
      <li>1.Train already registered</li>
      <li>2.Software failure</li>
      <li>3.Stations might not be there in the list</li>
      <li>Contact your system admin</li>
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
