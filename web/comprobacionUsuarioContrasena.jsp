<%-- 
    Document   : comprobacionUsuarioContrasena
    Created on : 10 may 2022, 18:43:11
    Author     : dagma
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%

            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
                Statement s = conexion.createStatement();
                Statement u = conexion.createStatement();

                ResultSet listadoUsuario = s.executeQuery("SELECT * FROM usuario");
                
                String nombre = request.getParameter("AliasUsu");

                while (listadoUsuario.next()) {
                
                    out.print(listadoUsuario);

                    if (request.getParameter("usuario").equals(listadoUsuario.getString("AliasUsu")) && (request.getParameter("password").equals(listadoUsuario.getString("Contrasena")))) {

                        session.setAttribute("usuarioRegistrado", listadoUsuario.getString("AliasUsu"));
                        session.setAttribute("contrasenaUsuario", listadoUsuario.getString("Contrasena"));
                        session.setAttribute("codigoUsuario", listadoUsuario.getString("CodUsu"));
                       response.sendRedirect("listado.jsp");

                    } else{

                       response.sendRedirect("index.jsp");

                    }

                }

            } catch (Exception e) {

                out.print(e);

            }


        %>
    </body>
</html>
