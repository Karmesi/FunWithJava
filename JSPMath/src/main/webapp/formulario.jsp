<%-- 
    Document   : formulario
    Created on : 22 jun 2020, 23:08:08
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h2>Area y perimetro de un triangulo equilatero</h2>
<hr>
<p>Por favor, ingrese la base y altura del triangulo</p>
<form method="post" action="calcular.jsp">
    Base: <input type="text" name="base">
    <br />
    Altura: <input type="text" name="altura">
    <br />
    <input type="submit" value="Enviar" />
</form>
