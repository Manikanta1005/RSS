<%-- 
    Document   : LoginHandler
    Created on : Oct 11, 2018, 7:10:18 PM
    Author     : RGUKT
--%>

<%@page import="com.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>
 
<%
String result=LoginDAO.loginCheck(loginBean);
String s=loginBean.getEmail();
if(result.equals("true")){
    if(s.equals("admin@gmail.com")){
        session.setAttribute("email",loginBean.getEmail());
        response.sendRedirect("ahome.jsp");
    }
    else{
    session.setAttribute("email",loginBean.getEmail());
    response.sendRedirect("home.jsp");
}
// should check if he is admin


    
}
if(result.equals("false")){
    response.sendRedirect("Login.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("Login.jsp?status=error");
}
 
%>