<%-- 
    Document   : newtrain
    Created on : Oct 11, 2018, 9:22:02 PM
    Author     : RGUKT
--%>

<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.lang.String"%>
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
                <a href="#">Add Schedule</a>
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
            
            String tno =request.getParameter("tno");   %>
            
            <%
            Class.forName("com.mysql.jdbc.Driver");
           String del="delete from schedule where trainno= ?";
           
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="select * from trains where no=?";
           PreparedStatement ps=con.prepareStatement(query);
           PreparedStatement ps2=con.prepareStatement(del);
           ps.setString(1,tno);
           ps2.setString(1,tno);
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
           String s1,s2,s3,arr1[],arr[],s5;
           int a1,b1,a2,b2,p1=0,p2=0;
          /* Enumeration parameters = request.getParameterNames();
           while(parameters.hasMoreElements()){
        String parameterName = (String)parameters.nextElement();
        String parameterValue = request.getParameter(parameterName);*/ %>
      
 <% // }   %>
           
           %>
           <%
          for(int j=1;j<=sta;j++){
                            s1=request.getParameter("station"+j);
                           
                            s2=request.getParameter("ati"+j);
                             s5=s2;
                            
                            %>
                           
           <%
                            s3=request.getParameter("dt"+j);
                        %>
                      
            <%
                       arr1=s2.split(":");
                       
                       arr=s3.split(":");
                       
                       a1=Integer.parseInt(arr1[0]);
                       b1=Integer.parseInt(arr1[1]);
                       a2=Integer.parseInt(arr[0]);
                       b2=Integer.parseInt(arr[1]);%>
                       
                       <%
                       if(a1<a2){
                           if(j!=1){
                               if(a1>p1){
                                p1=a1 ;
                                p2=b1 ;
                                }
                               else if(a1==p1){
                                   if(p2<b1){
                                       p1=a1 ;
                                p2=b1 ;
                                   }
                                   else{
                                   ps2.executeUpdate() ;
                                   throw new Exception() ;
                               }
                                       
                               }
                               else{
                                   ps2.executeUpdate() ;
                                   throw new Exception() ;
                               }
                                  
                       }
                           else{
                                p1=a1 ;
                                p2=b1 ;
                           }
                   
                        
                 }
                       else if(a1==a2&&b1<b2){
                           if(j!=1){
                               if(a1>p1){
                                p1=a1 ;
                                p2=b1 ;
                                }
                               else if(a1==p1){
                                   if(p2<b1){
                                       p1=a1 ;
                                p2=b1 ;
                                   }
                                       
                               }
                               else{
                                   ps2.executeUpdate() ;
                                   throw new Exception() ;
                               }
                                  
                       }
                           else{
                                p1=a1 ;
                                p2=b1 ;
                           }
                       }
                       else{
                           ps2.executeUpdate() ;
                           throw new Exception();
                       }
                       query="insert into schedule values (?,?,?,? )";
                       ps=con.prepareStatement(query);
                       ps.setString(1,trainno) ;
                       ps.setString(2,s1) ;
                       ps.setString(3,s2) ;
                       ps.setString(4,s3) ;
                       ps.executeUpdate() ;
          }
           
           
           
               %>
               <h2 align="center">Train Details </h2>
        <form action="">
            <table cellpadding="5" align="center">
                <tr>
                    <td ><b>TrainNO</b></td>
                    <td><b><%= tno %></b></td>
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
                    <<td><b><%= d %></b></td>
                </tr>
                <tr>
                    <td ><b>NoOfStations</b></td>
                    <td name="sta"><%= sta %></td>
                </tr>
 
                
 
            </table>
        </form>
                <h2 align="center">Train Schedule  </h2>
                <form action="addsched">
                     <table cellpadding="5" align="center">
                         <td><b>Station</b></td>
                         <td><b>Arrival Time</b></td>
                         <td><b>Destination Time</b></td>
                    <%
                       for(int j=1;j<=sta;j++){
                        %>
                        <tr>
                            <td><b> <%=request.getParameter("station"+j)%></b> </td>
                            <td> <b><%=request.getParameter("ati"+j)%> </b> </td>
                            <td><b> <%= request.getParameter("dt"+j)%> </b></td>
                        
                        </tr>
                       
                    <%
                        
                 }  %>
                        
                       
                         </table>
                </form> 
                 
                        <%
                        }

catch(Exception e){
response.sendRedirect("newshedule.jsp?status=false&trainno="+request.getParameter("tno"));
out.println(e.getMessage());
                        %>
                        <h2>Sorry no train found<%=e.getMessage() %></h2>
                        <%
                            }
                            %>
    	</div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018 </div>        
    </div>
</body>
</html>                            
