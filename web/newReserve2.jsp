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
<script>
    function formValidation(){
        var no=document.reg.trainno;
        var name=document.reg.trainname;
        var source=document.reg.source;
        var dest=document.reg.destination;
        var sleeper=document.reg.sleeper;
        var ac=document.reg.ac;
        var noof=document.reg.noofstations;
        if(valid_no(no)){
            if(allLetter(name)){
                if(valid_source(source,dest)){
                    if(allLetter(source)){
                        if(allLetter(dest)){
                            if(allnum(sleeper)){
                                if(allnum(ac)){
                                    if(allnum(noof)){
                                        return true;
                                    }
                                    return false;
                                }
                                return false;
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
          return false; 
        }
        else{
            return false;
        }
        function valid_no(tno){
            var len=tno.value.length;
            if(len!==6){
                alert("Train no should be 6 digit length");
                return false;
            }
            var numbers = /^[0-9]+$/;
            if(tno.value.match(numbers)){
                return true;
            }
            else{
                alert("train no must have numbers only");
                return false;
            }
        }
        function allLetter(uname)
        { 
        var letters = /^[A-Za-z]+$/;
        if(uname.value.match(letters))
            {
            return true;
            }
        else
            {
            alert('Name must have alphabet characters only');
            return false;
            }
        }
        function valid_source(s,d){
            if(s.value===d.value){
                alert("you naughty source ,destination can't be same!");
                return false;
            }
            return true;
        }
        function allnum(n){
            var numbers = /^[0-9]+$/;
            if(n.value.match(numbers)){
                return true;
            }
            else{
                alert("no must have numbers only");
                return false;
            }
        }
        
    }
    var request;  
function sendInfo()  
{  
var v=document.vinform.t1.value;  
var url="ajax.jsp?val="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState===4){  
var val=request.responseText;  
document.getElementById('mani').innerHTML=val;  
}  
}  
    </script>
</head>
<body>
    <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("Login.jsp");
        }
        String msg=request.getParameter("msg");
        
        if(msg!=null) {
            if(msg.equals("no")){
    %>
                
                   <h2  >Sorry train was not there in the list </h2>
           <%}
}
        %>
        <datalist id="trains">
    <%
            String result="",result2="",result3="",s2="";
        try{
            response.setContentType("text/html");
            //String tno=request.getParameter("tno");
                  
            Class.forName("com.mysql.jdbc.Driver");
           
           Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mani","root","");
           String query="select name from stations";
           PreparedStatement ps;
           ps=con.prepareStatement(query);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               result=rs.getString(1) ;
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
                <a href="#">Home</a>
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
        
        <h2 align="center">Ticket Reservation</h2>
        <form name="reg" action="checkTrainTicket.html" >
            <table cellpadding="5" align="center">
                <tr>
                    <td><b>From station</b></td>
                    <td><input list="trains" name="fstation"   required/></td>
                </tr>
                <tr>
                    <td><b>To station</b></td>
                    <td><input list="trains" name="tstation"   required/></td>
                </tr>
                <td><b>Type</b></td><td>
                <select>
  <option value="all">AllClasses</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select>
                    
                </td>
                </tr>
                <tr>
                    <td><b>Date</b></td>
                    <td><input type="date" name="date"   required/></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center"><input class="button" type="submit" value="Reserve"/></td>
                    
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