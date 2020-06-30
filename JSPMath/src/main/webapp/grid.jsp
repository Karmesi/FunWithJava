<%-- 
    Document   : formulario
    Created on : 22 jun 2020, 23:08:08
    Author     : karmesi
--%>

<%@page import="java.sql.*" %>

<p class="h2">Resultados Previos</p>
<%
    if (session.getAttribute("login") != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans?serverTimezone=UTC", "netbeans", "NetBeans_4444");

            String user_name = session.getAttribute("login").toString();

            PreparedStatement pstmt_sel = null; //create statement
            PreparedStatement pstmt = null; //create statement

            pstmt_sel = con.prepareStatement("select * from math where user_id=(select user_id from users where user_name=?)");
            pstmt_sel.setString(1, user_name);
            ResultSet rs = pstmt_sel.executeQuery();
%>
<div class="container">
    <div class="row">
        <div class="col text-light bg-dark">ID</div>
        <div class="col text-light bg-dark">Base</div>
        <div class="col text-light bg-dark">Altura</div>
        <div class="col text-light bg-dark">Area</div>
        <div class="col text-light bg-dark">Perimetro</div>
    </div>
    <%while (rs.next()) {%>
    <div class="row">
        <div class="col bg-light"><%=rs.getInt("record_id")%></div>
        <div class="col"><%=rs.getDouble("base")%></div>
        <div class="col bg-light"><%=rs.getDouble("altura")%></div>
        <div class="col"><%=rs.getDouble("area")%></div>
        <div class="col bg-light"><%=rs.getDouble("perimetro")%></div>
    </div>
    <%}%>
</div>
<%
            con.close(); //close connection
        } catch (Exception e) {
            out.println(e);
        }
    }
%>