<%-- 
    Document   : old_triangulo
    Created on : 22 jun 2020, 23:13:51
    Author     : karmesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
                <%
                    Cookie[] cookies = request.getCookies();
                    String aTriangle = "";
                    String pTriangle = "";
                    String baseTriangle = "";
                    String alturaTriangle = "";
                    String output = "";

                    for(int i = 0; i < cookies.length; i++) { 
                        Cookie c = cookies[i];
                        if (c.getName().equals("JSessionTriangleA")) {
                            aTriangle = c.getValue();
                        }
                        if (c.getName().equals("JSessionTriangleP")) {
                            pTriangle = c.getValue();
                        }
                        if (c.getName().equals("JSessionTriangleBase")) {
                            baseTriangle = c.getValue();
                        }
                        if (c.getName().equals("JSessionTriangleAltura")) {
                            alturaTriangle = c.getValue();
                        }
                    }
                    if (!aTriangle.isEmpty() && !pTriangle.isEmpty() && !baseTriangle.isEmpty() && !alturaTriangle.isEmpty()) {
                        output = "<p>Resultados previos:<br>Area: " + aTriangle + ", Perimetro: " + pTriangle + ", Base: " + baseTriangle + ", Altura: " + alturaTriangle + "</p>";
                    }
                %>
                <%=output%>