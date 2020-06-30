<%-- 
    Document   : index
    Created on : 22 jun 2020, 22:01:59
    Author     : karmesi
--%>

<%@page import="java.sql.*" %>
<%
    response.addCookie(new Cookie("JSessionResultado", ""));
    if (session.getAttribute("login") != null) {
        response.sendRedirect("welcome.jsp");
    }
%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans?serverTimezone=UTC", "netbeans", "NetBeans_4444");
        if (request.getParameter("btn_login") != null) {
            String dbname, dbpassword;
            String name, password;

            name = request.getParameter("txt_name");
            password = request.getParameter("txt_password");

            PreparedStatement pstmt = null;

            pstmt = con.prepareStatement("select * from users where user_name=? and user_pass=?");
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                dbname = rs.getString("user_name");
                dbpassword = rs.getString("user_pass");

                if (name.equals(dbname) && password.equals(dbpassword)) {
                    session.setAttribute("login", dbname);
                    response.sendRedirect("welcome.jsp");
                }
            } else {
                request.setAttribute("errorMsg", "<p class=\"badge badge-warning\">Nombre de usuario o contraseña invalido(s)</p>");
            }
            con.close();
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Welcome Page</title>

        <script>
            function validate() {
                var name = document.myform.txt_name;
                var password = document.myform.txt_password;

                if (name.value === null || name.value === "") {
                    window.alert("Por favor, ingrese su nombre de usuario");
                    name.style.background = '#f08080';
                    name.focus();
                    return false;
                }
                if (password.value === null || password.value === "") {
                    window.alert("Por favor, ingrese su password");
                    password.style.background = '#f08080';
                    password.focus();
                    return false;
                }
            }
        </script>
    </head>
    <body class="container">
        <div class="jumbotron">
            <p class="h1">Hola, Bienvenido!</p>
        </div>
        <div class="container">
            <form method="post" onsubmit="return validate();">
                <%
                    if (request.getAttribute("errorMsg") != null) {
                        out.println(request.getAttribute("errorMsg"));
                    }
                %>
                <div class="form-group">
                    <label>
                        <span>Usuario</span>
                        <input class="form-control" type="text" placeholder="Nombre" name="txt_name">
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        <span>Password</span>
                        <input class="form-control" type="password" placeholder="Password" name="txt_password">
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" name="btn_login">
                    Login
                </button>
                <span class="container">
                    <a href="register.jsp" class="badge badge-info">¿Nuevo usuario?</a>
                </span>
            </form>
        </div>
    </body>
</html>
