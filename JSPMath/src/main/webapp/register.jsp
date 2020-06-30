<%-- 
    Document   : login
    Created on : 22 jun 2020, 23:24:53
    Author     : karmesi
--%>
<%@page import="java.sql.*" %>  

<%
    if (session.getAttribute("login") != null) {
        response.sendRedirect("welcome.jsp");
    }
%>


<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans?serverTimezone=UTC", "netbeans", "NetBeans_4444");

        if (request.getParameter("btn_register") != null) //check register button click event not null
        {
            String name, password;

            name = request.getParameter("txt_name"); //txt_firstname
            password = request.getParameter("txt_password"); //txt_password

            PreparedStatement pstmt = null; //create statement

            pstmt = con.prepareStatement("insert into users(user_name,user_pass) values(?,?)"); //sql insert query
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            pstmt.executeUpdate(); //execute query

            request.setAttribute("successMsg", "<p class=\"alert alert-success\">Usuario registrado satisfactoriamente. Ahora puedes logearte</p>"); //register success messeage

            con.close(); //close connection
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
        <title>Registrar nuevo user</title>

        <!-- javascript for registeration form validation-->
        <script>

            function validate()
            {
                var name_valid = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
                var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 

                var full_name = document.getElementById("full_name"); //textbox id fname
                var password = document.getElementById("password"); //textbox id password

                if (!name_valid.test(full_name.value) || full_name.value == '')
                {
                    alert("Unicamente letras porfavor");
                    fname.focus();
                    fname.style.background = '#f08080';
                    return false;
                }
                if (!password_valid.test(password.value) || password.value == '')
                {
                    alert("Password debe ser de 6 a 12 chars y no se periten los siguientes !@#$%&*()<>");
                    password.focus();
                    password.style.background = '#f08080';
                    return false;
                }
            }

        </script>	
    </head>
    <body class="container">
        <div class="jumbotron">
            <p class="h1">Registra un nuevo usuario aqui</p>
            <span class="container">
                <a href="index.jsp" class="alert alert-primary">
                    ¿Ya tienes una cuenta con nosotros? Entra aqui!
                </a>
            </span>
        </div>
        <div class="container">
            <form method="post" onsubmit="return validate();">
                <%
                    if (request.getAttribute("successMsg") != null) {
                        out.println(request.getAttribute("successMsg")); //register success message
                    }
                %>
                <div class="form-group">
                    <label>
                        <span>User Name</span>
                        <input class="form-control" type="text" name="txt_name" id="full_name" placeholder="enter full name">
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        <span>Password</span>
                        <input class="form-control" type="password" name="txt_password" id="password" placeholder="enter password">
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" name="btn_register" value="Register">
                    Registrar
                </button>
            </form>
        </div>
    </body>
</html>
