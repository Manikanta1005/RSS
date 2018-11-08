<%-- 
    Document   : api
    Created on : Oct 29, 2018, 1:48:13 PM
    Author     : RGUKT
--%>

<%@page import="java.util.Scanner"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            try{
            URL url=new URL("https://newsapi.org/v2/top-headlines?country=us&apiKey=be294673b62f41d0a73d71d0d7dc69b2") ;
            out.println(url) ;
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
           conn.setRequestMethod("GET") ;
           conn.connect();
           int responsecode = conn.getResponseCode();
           out.println(responsecode);
           out.println("hi");
           if(responsecode != 200)
              throw new RuntimeException("HttpResponseCode:"+responsecode) ;
else
{
        out.println("Else");%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
    String inline="" ;
    Scanner sc = new Scanner(url.openStream());
    out.println("hi");
while(sc.hasNext())
{
    out.println("while");
inline+=sc.nextLine();
}
out.println(" \nJSON data in string format") ;
out.println(inline);
sc.close();
}
            }
            catch(Exception e){
                out.println(" Sorry") ;
                  out.println(e.getMessage());
            }
            
        %>
    </body>
</html>
