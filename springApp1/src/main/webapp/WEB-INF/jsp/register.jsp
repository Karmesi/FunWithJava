<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <script>
            function refreshAge(value) {
                var el = document.getElementById('years');
                el.innerHTML = " (" + value + ")";
            }
        </script>
    </head>
    <body>
    <center>
        <h1>Registrar</h1>
        <form action="register" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Primer nombre:</td>
                    <td><input type="text" name="firstName" required></td>
                </tr>
                <tr>
                    <td>Segundo nombre:</td>
                    <td><input type="text" name="middleName"></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td><input type="text" name="lastName" required></td>
                </tr>
                <tr>
                    <td>Altura (en metros):</td>
                    <td><input type="number" min="1.00" max="2.50" step="0.01" name="height" required></td>
                </tr>
                <tr>
                    <td>Peso (en kilos):</td>
                    <td><input type="number" min="40.00" step="0.01" name="weight" required></td>
                </tr>
                <tr>
                    <td>Genero:</td>
                    <td>
                        <input type="radio" id="male" name="gender" value="male" required>
                        <label for="male">Masculino</label><br>
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">Femenino</label><br>
                    </td>
                </tr>
                <tr>
                    <td>Edad<span id="years"></span>:</td>
                    <td><input onchange="refreshAge(this.value)" type="range" name="age" min="15" max="99" required></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Registrar"><a href="index.htm">Ir al Login</a></td>
                </tr>
            </table>
        </form>
    </center>
    ${mjs}
</body>
</html>
