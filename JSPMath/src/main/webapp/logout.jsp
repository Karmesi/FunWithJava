<%-- 
    Document   : logout
    Created on : 29 jun 2020, 19:06:46
    Author     : karmesi
--%>
<%
    response.addCookie(new Cookie("JSessionResultado", ""));
    session.invalidate(); //destroy session
    response.sendRedirect("index.jsp");
%>
