<%-- 
    Document   : main
    Created on : 18 jun 2020, 2:26:40
    Author     : karmesi
--%>

<%@page import="java.util.*" %>
<%@page import="com.mathapp.jspmath.Triangulo" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="Triangulo" scope="application" class="com.mathapp.jspmath.Triangulo" />
        <jsp:setProperty name="Triangulo" property="*" />
    </head>
    <body>
        <h1>Area del triangulo. Resultado</h1>
        <%
            Triangulo.setAltura(Double.parseDouble(request.getParameter("base")));
            Triangulo.setBase(Double.parseDouble(request.getParameter("altura")));
            Double area = Triangulo.getArea();
        %>
        <p><%=area%></p>
    </body>
</html>
