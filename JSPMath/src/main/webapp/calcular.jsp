<%-- 
    Document   : main
    Created on : 18 jun 2020, 2:26:40
    Author     : karmesi
--%>

<%@page import="java.util.*" %>
<%@page import="com.mathapp.jspmath.Triangulo" %>

        <jsp:useBean id="Triangulo" scope="application" class="com.mathapp.jspmath.Triangulo" />
        <jsp:setProperty name="Triangulo" property="*" />
        <%
            String base = request.getParameter("base");
            String altura = request.getParameter("altura");
            Triangulo.setBase(Double.parseDouble(base));
            Double area = Triangulo.getArea();
            Double perimetro = Triangulo.getPerimetro();
            response.addCookie(new Cookie("JSessionTriangleA", area.toString()));
            response.addCookie(new Cookie("JSessionTriangleP", perimetro.toString()));
            response.addCookie(new Cookie("JSessionTriangleBase", base.toString()));
            response.addCookie(new Cookie("JSessionTriangleAltura", altura.toString()));
            response.sendRedirect("/");
        %>