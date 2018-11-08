<%-- 
    Document   : index
    Created on : Oct 11, 2018, 6:14:40 PM
    Author     : RGUKT
--%>

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
        %>
    <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="ahome.jsp">Home</a>
                <a href="atrain.jsp">Add Train</a>
                <a href="newshe">Add Schedule</a>
                <a href="#">Add Station</a>
                <a href="#">Add Route</a>
                <a href="#">Add Admin</a>
                <a href="#">Update Fairs</a>
                <a href="Logout.jsp">Logout</a>
            </nav>
        </div>
    </div>
    <div class="container">
        
        <h2 align="center">Check Train </h2>
        <form name="reg" action="newshedule.jsp">
            <table cellpadding="5">
                <tr>
                    <td><b>TrainNO</b></td>
                    <td><input type="text" name="tno"   required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Check Train"/></td>
                    
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