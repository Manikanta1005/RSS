<%-- 
    Document   : Logout
    Created on : Oct 11, 2018, 8:41:35 PM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
