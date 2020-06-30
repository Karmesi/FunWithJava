<%-- 
    Document   : main
    Created on : 18 jun 2020, 2:26:40
    Author     : karmesi
--%>

<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>  
<%@page import="com.mathapp.jspmath.Triangulo" %>

<jsp:useBean id="Triangulo" scope="application" class="com.mathapp.jspmath.Triangulo" />
<jsp:setProperty name="Triangulo" property="*" />
<%
    Double base = Double.parseDouble(request.getParameter("base"));
    Double altura = Double.parseDouble(request.getParameter("altura"));
    Triangulo.setBase(base);
    Triangulo.setAltura(altura);
    Double area = Triangulo.getArea();
    Double perimetro = Triangulo.getPerimetro();
    String resultado = "Base: " + base.toString() + ", Altura: " + altura.toString() + ", Perimetro: " + perimetro.toString() + ". Area: " + area.toString();
    response.addCookie(new Cookie("JSessionResultado", resultado));

    if (session.getAttribute("login") != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/netbeans?serverTimezone=UTC", "netbeans", "NetBeans_4444");

            String user_name = session.getAttribute("login").toString();

            PreparedStatement pstmt_sel = null; //create statement
            PreparedStatement pstmt = null; //create statement

            pstmt_sel = con.prepareStatement("select user_id from users where user_name=?");
            pstmt_sel.setString(1, user_name);
            ResultSet rs = pstmt_sel.executeQuery();
            if (rs.next()) {
                Integer user_id = rs.getInt("user_id");
                pstmt = con.prepareStatement("insert into math(base,altura,area,perimetro,user_id) values(?,?,?,?,?)"); //sql insert query
                pstmt.setDouble(1, base);
                pstmt.setDouble(2, altura);
                pstmt.setDouble(3, area);
                pstmt.setDouble(4, perimetro);
                pstmt.setInt(5, user_id);

                pstmt.executeUpdate(); //execute query

                request.setAttribute("successMsg", "Calculo asociado a usuario"); //register success messeage

                con.close(); //close connection
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    response.sendRedirect(
            "welcome.jsp");
%>