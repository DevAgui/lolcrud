<%-- 
    Document   : anadirUsuario
    Created on : 14 may 2022, 13:15:52
    Author     : dagma
--%>

<%-- 
    Document   : anadirCampeon
    Created on : 23 feb 2022, 17:32:44
    Author     : Usuario
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Campeones</title>
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();

            Statement w = conexion.createStatement();

            session.getAttribute("usuarioRegistrado");
            session.getAttribute("codigoUsuario");
            
            boolean usuarioRepetido = false;

            ResultSet usuario = w.executeQuery("SELECT * FROM usuario");

            while (usuario.next()) {
                if (request.getParameter("NombreUsuario").toString().equals(usuario.getString("AliasUsu"))) {
                    usuarioRepetido = true;
                }
            }

            if (usuarioRepetido) {
                session.setAttribute("errorUsuario", "usuario repetido");
                response.sendRedirect("listadoAdmin.jsp");
                
            } else {

                ResultSet listadoUsuario = s.executeQuery("SELECT * FROM usuario");
                listadoUsuario.next();

                String insertarUsuario = "INSERT INTO usuario(AliasUsu, Contrasena) VALUES('" 
                        + request.getParameter("NombreUsuario") + "','"
                        + request.getParameter("ContrasenaUsuario") + "')";
                
                s.execute(insertarUsuario);
                response.sendRedirect("listadoAdmin.jsp");
            }

        %>
        
          </body>
</html>
