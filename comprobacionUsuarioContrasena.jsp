<%-- 
    Document   : comprobacionUsuarioContrasena
    Created on : 10 may 2022, 18:43:11
    Author     : dagma
--%>
<%@page import="java.security.MessageDigest"%>
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
        <title>JSP Page</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%

            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
                Statement u = conexion.createStatement();
                Statement s = conexion.createStatement();

                ResultSet listadoUsuario = s.executeQuery("SELECT * FROM usuario");
                

                while (listadoUsuario.next()) {
                

                    if ((request.getParameter("usuario").equals(listadoUsuario.getString("AliasUsu")) && (request.getParameter("password").equals(listadoUsuario.getString("Contrasena")) && (listadoUsuario.getString("Administrador") != null))))  {

                        session.setAttribute("usuarioRegistrado", listadoUsuario.getString("AliasUsu"));
                        session.setAttribute("contrasenaUsuario", listadoUsuario.getString("Contrasena"));
                        session.setAttribute("codigoUsuario", listadoUsuario.getString("CodUsu"));
                        
                        
                        
                        response.sendRedirect("listadoAdmin.jsp");

                        } else if (request.getParameter("usuario").equals(listadoUsuario.getString("AliasUsu")) && (request.getParameter("password").equals(listadoUsuario.getString("Contrasena")) && (listadoUsuario.getString("Administrador") == null))){
                    
                            session.setAttribute("usuarioRegistrado", listadoUsuario.getString("AliasUsu"));
                            session.setAttribute("contrasenaUsuario", listadoUsuario.getString("Contrasena"));
                            session.setAttribute("codigoUsuario", listadoUsuario.getString("CodUsu"));
                            
                            response.sendRedirect("listado.jsp");
                    
                            } else{
            
                                session.setAttribute("error", "Contraseña o usuario incorrecto.");
                    
                            }
                    
                    /*if(request.getParameter("usuario").equals("admin") && (request.getParameter("contrasena").equals("admin")) &&(listadoUsuario.getString("Administrador").equals("s"))){
            
                        session.setAttribute("usuarioRegistrado", listadoUsuario.getString("AliasUsu"));
                        session.setAttribute("contrasenaUsuario", listadoUsuario.getString("Contrasena"));
                        session.setAttribute("codigoUsuario", listadoUsuario.getString("CodUsu"));
                    
                    }*/

                       

                    

                }
                
            response.sendRedirect("index.jsp");
            } catch (Exception e) {

                out.print(e);

            }


        %>
    </body>
</html>