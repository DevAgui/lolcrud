<%-- 
    Document   : editarUsuarios
    Created on : 14 may 2022, 13:38:40
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/peceraStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Editar Campeones</title>
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
    </head>
    <body>


        <%request.setCharacterEncoding("UTF-8");%>

        <%

            String identificadorCampeon = request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();

            Statement w = conexion.createStatement();

            boolean usuarioRepetido = false;

            ResultSet usuario = w.executeQuery("SELECT * FROM usuario WHERE CodUsu = " + request.getParameter("CodigoUsuario"));

            while (usuario.next()) {
                if (request.getParameter("NombreUsuario").toString().equals(usuario.getString("AliasUsu").toString())) {
                    usuarioRepetido = true;
                }
            }

            if (usuarioRepetido) {
                session.setAttribute("errorUsuario", "usuario repetido");
                response.sendRedirect("listadoAdmin.jsp");
            }else {

                ResultSet listadoUsuario = s.executeQuery("SELECT * FROM usuario");
                listadoUsuario.next();

                String insertarUsuario = "UPDATE usuario SET "
                        
                        + "CodUsu='" + request.getParameter("CodigoUsuarioEdi") + "',"
                        + "AliasUsu='" + request.getParameter("NombreUsuarioEdi") + "',"
                        + "Contrasena='" + request.getParameter("ContrasenaUsuEdi") + "'"
                        + "WHERE CodUsu='"+ request.getParameter("CodigoUsuarioEdi")+ "'";
                
                s.execute(insertarUsuario);
                //out.print(insertarCampeon);
                response.sendRedirect("listadoAdmin.jsp");
            }

        %>

     


        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </script>
    </body>
</html>
