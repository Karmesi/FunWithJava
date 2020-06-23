<%-- 
    Document   : index
    Created on : 22 jun 2020, 22:01:59
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div class="main">
            <div class="main-login wrapper">
                <jsp:include page="login.jsp" />
            </div>
            <div class="wrapper">
                <jsp:include page="old_triangulo.jsp" />
            </div>
            <div class="wrapper">
                <jsp:include page="formulario.jsp" />
            </div>
        </div>
    </body>
</html>
