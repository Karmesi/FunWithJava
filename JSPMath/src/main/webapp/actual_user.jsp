<%-- 
    Document   : actual_user
    Created on : 22 jun 2020, 23:51:36
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        response.addCookie(new Cookie("JSessionName", request.getParameter("user").toString()));
        String redirectURL = "/";
        response.sendRedirect(redirectURL);
%>
