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
    <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to home page if already logged in
        if(email!=null){
            
            response.sendRedirect("ahome.jsp");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
            if(status.equals("false")){
                   out.print("Incorrect login details!");                       
            }
            else{
                out.print("Some error occurred!");
            }
        }
        %>
    
    
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
    #myVideo {
    position: fixed;
    right: 0;
    bottom: 0;
    min-width: 100%; 
    min-height: 100%;
    z-index:0;

}
.font_0{
    font-size: 100px;
    position : absolute;
    z-index: 1;
    
}
</style>
</head>
<body>
    <video autoplay muted loop id="myVideo">
  <source src="sun.mp4" type="video/mp4">
</video>
    <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="#">Home</a>
                <a href="userTrainSchedule.jsp">TrainDetails</a>
                <a href="trainschedule.html">Trains</a>
                <a href="liveTrain.html">liveTrain</a>
                <a href="checkAvailability.jsp">CheckAvailability</a>
                <a href="newReserve.jsp">Book Ticket</a>
                <a href="#">PNR Status</a>
                <a href="Login.jsp">Login</a>
            </nav>
        </div>
    </div>
    <div class="container">
        <h1 class="font_0"  text-align:center;">Railways</h1>
    	</div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018</div>        
    </div>
</body>
</html>                            