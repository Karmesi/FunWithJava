<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function refreshAge(value) {
                var el = document.getElementById('years');
                el.innerHTML = " (" + value + ")";
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${user_data[0].firstName}!</h1>
        <table class="table">
            <tbody>
                <tr>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Genero</td>
                    <td>Edad</td>
                </tr>
                <c:forEach items="${user_data}" var="udt">
                    <tr>
                        <td>${udt.firstName} ${udt.middleName}</td>
                        <td>${udt.lastName}</td>
                        <td>${udt.gender}</td>
                        <td>${udt.age}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <table class="table">
            <tbody>
                <tr>
                    <td>Fecha</td>
                    <td>IMC</td>
                    <td>Altura</td>
                    <td>Peso</td>
                    <td>Edad</td>
                </tr>
                <c:forEach items="${user_history}" var="ush">
                    <tr>
                        <td>${ush.dateTake}</td>
                        <td>${ush.rangeBMI} kg/m2</td>
                        <td>${ush.height}</td>
                        <td>${ush.weight}</td>
                        <td>${ush.age}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="imc" method="post">
            <table>
                <tr>
                    <td>Altura (en metros):</td>
                    <td><input type="number" min="1.00" max="2.50" step="0.01" name="height" required></td>
                </tr>
                <tr>
                    <td>Peso (en kilos):</td>
                    <td><input type="number" min="40.00" step="0.01" name="weight" required></td>
                </tr>
                <tr>
                    <td>Edad:</td>
                    <td><input type="number" min="15" max="99" step="1" name="age" required></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="username" value="${user_data[0].username}">
                        <input type="submit" value="Calcular">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
