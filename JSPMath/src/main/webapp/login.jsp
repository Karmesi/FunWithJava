<%-- 
    Document   : login
    Created on : 22 jun 2020, 23:24:53
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    String userName = "";
    String output = "";

    for(int i = 0; i < cookies.length; i++) { 
        Cookie c = cookies[i];
        if (c.getName().equals("JSessionName")) {
            userName = c.getValue();
        }
    }

    if (!userName.isEmpty()) {
        output= "<h2>Bienvenido " + userName + "</h2>";
    }
%>
<%=output%>
<div class="main-login wrapper">
    <form method="post" action="actual_user.jsp">
        Usuario: <input type="text" name="user">
        <br />
        <input type="submit" value="Salvar" />
    </form>
</div>