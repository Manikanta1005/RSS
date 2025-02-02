

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html >
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
.table{
    cellpadding:5;
}
</style>
<script>
    document.addEventListener("DOMContentLoaded",
function myFunction() { 
    var prev=window.location.search;
    
    var array=prev.split("&");
    var arr2=array[0].split("=");
    var arr3=array[1].split("=");
    var source=arr2[1];
    var dest=arr3[1];
    console.log(source);
     console.log(dest);
    var request = new XMLHttpRequest();
    var table=document.createElement('table');
    table.cellPadding=5;
    var header = table.createTHead();
    var row = header.insertRow(0);     
    var cell = row.insertCell(0);
    var cell1 = row.insertCell(1);
    var cell2 = row.insertCell(2);
    var cell3 = row.insertCell(3);
    var cell4 = row.insertCell(4);
    cell1.innerHTML = "<b>Train Name</b>" ;
    cell2.innerHTML = "<b>ArrivalTime</b>";
    cell3.innerHTML = "<b>DepartureTime</b>";
    cell4.innerHTML = "<b>Availability</b>";
    cell.innerHTML = "<b>TrainNo</b>";
    var url = "https://api.railwayapi.com/v2/between/source/"+source+"/dest/"+dest+"/date/08-11-2018/apikey/zjd42xucb4/"
    ;
    //alert(url);
    const card = document.getElementById('card');
    request.open('GET', url, true);
    request.onload = function () {
    var data = JSON.parse(this.response);
    //console.log(data);
    for(i=0;i<data.total;i++){
      var row = table.insertRow(i+1);
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      var cell3=row.insertCell(2);
      var cell4=row.insertCell(3);
      var cell5=row.insertCell(4);
      cell1.innerHTML =  data.trains[i].number;
      cell2.innerHTML = data.trains[i].name;
      console.log(data.trains[i].name);
      cell3.innerHTML = data.trains[i].src_departure_time;
      cell4.innerHTML=data.trains[i].dest_arrival_time ;
      cell5.innerHTML="<button id='"+i+"' onclick='checkSchedule.html?tno="+data.trains[i].number+"'>BOOKNOW</button>";
    }
    card.append(table);
  };
  
  request.send();
}
);
</script>
</head>
<body>
    
    <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="#">Home</a>
                <a href="#">TrainSchedule</a>
                <a href="#">PNR Status</a>
                <a href="#">Services</a>
                <a href="#">Contact Us</a>
                <a href="Logout.jsp">Logout</a>
            </nav>
        </div>
    </div>
    <div class="container">
        
        <form name="mine"   >
            <datalist id="stations">
            
        </datalist>
            <table cellpadding="5" align="center" >
                <tr>
                   
                </tr>
                <tr>
                    
                </tr>
                
            </table>
        </form>
    	</div>  
    <div id="card"></div>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; 2018</div>        
    </div>
</body>
</html>                            