<%-- 
    Document   : welcome
    Created on : 29 jun 2020, 19:01:38
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Hola <%=session.getAttribute("login")%></title>
    </head>
    <body class="container">
        <div class="jumbotron">
            <%
                if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                    response.sendRedirect("index.jsp");
                }
            %>
            <p class="h1">Hola, <%=session.getAttribute("login")%></p>
            <span class="container">
                <a class="alert alert-warning" href="logout.jsp">Cerrar session</a>
            </span>
        </div>
        <div class="container">
            <p class="h2">Calcular nueva area y perimetro de triangulo</p>
            <form method="post" action="calcular.jsp">
                <div class="form-group">
                    <label>
                        <span>Base</span>
                        <input class="form-control" placeholder="base" type="text" name="base">
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        <span>Altura</span>
                        <input class="form-control" placeholder="altura" type="text" name="altura">
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" name="btn_enviar">
                    Enviar
                </button>
            </form>
            <hr>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Resultado del ultimo calculo de la sesion</h5>
                    <p class="card-text">
                        ${cookie['JSessionResultado'].getValue()}
                    </p>
                </div>
            </div>
            <hr>
            <%@include file="grid.jsp"%>
        </div>
    </body>
</html>
