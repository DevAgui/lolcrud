<%-- 
    Document   : consulta.jsp
    Created on : 21 feb 2022, 19:41:15
    Author     : Usuario
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de usuarios</title>
        <link rel="stylesheet" href="styles/login.css">
        <link rel="shortcut icon" href="./images/lolcrud.ico" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body class="vh-100">

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            try {

                if (session.getAttribute("usuarioRegistrado") == null) {


                    session.setAttribute("error", "¡Alto ahí! Inicie sesión como administrador si quiere acceder al listado.");
                    session.setAttribute("entradaIlegal", "si");
                    response.sendRedirect("index.jsp");

                } else{

                    session.setAttribute("entradaIlegal", "no");
                }
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
                Statement s = conexion.createStatement();
                Statement u = conexion.createStatement();

                ResultSet listadoUsuarios = s.executeQuery("SELECT * FROM usuario WHERE AliasUsu !=  'admin'");
        %>

        <div id="wrapper" class="container bg-light">
            <form action="logout.jsp">
                <p>Loggeado como: <% out.print(session.getAttribute("usuarioRegistrado")); %></p>
                <button type="submit" class="btn btn-primary">Logout</button>
            </form>
        </div>

        <div id="wrapper" class="container vh-100 bg-light">
            <h1 class="text-center py-5">Usuarios</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                        <tr>
                            <th scope="col">Código Usuario</th>
                            <th scope="col">Alias Usuario</th>
                            <th scope="col">Contraseña Usuario</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (listadoUsuarios.next()) {
                        %>

                        <tr>
                            <td class="col-2"> <%= listadoUsuarios.getString("CodUsu")%></td>
                            <td class="col-2"> <%= listadoUsuarios.getString("AliasUsu")%></td>
                            <td class="col-2"> <%= listadoUsuarios.getString("Contrasena")%></td> 
                            <!--<td class="col-3"> listadoCampeones.getString("CodUsu")</td>-->
                            <td class="col-1">
                                <form action="formularioEditarUsuarios.jsp" method="get">
                                    <input type="hidden" name="CodUsu" value="<%=listadoUsuarios.getString("CodUsu")%>">
                                    <input type="hidden" name="NomUsu" value="<%=listadoUsuarios.getString("AliasUsu")%>">
                                    <input type="hidden" name="Contrasena" value="<%=listadoUsuarios.getString("Contrasena")%>">
                                    <button href="formularioEditarUsuarios.jsp" class="col-1 bi bi-pencil-square rowWithImage" type="submit"></button>
                                </form>
                            </td> 
                            <td class="col-1"><a href="eliminarUsuario.jsp?id=<%=listadoUsuarios.getString("CodUsu")%>" class=" bi-trash3-fill rowWithImage text-danger" onclick="alert('Has eliminado a <%= listadoUsuarios.getString("AliasUsu")%> con éxito.')"></a></td>
                        </tr>
                        <%
                            
                                }
                            } catch (Exception e) {

                                out.print(e);
                            }


                        %>
                    </tbody>
                </table>
            </div>
            <a href="anadirCampeon.jsp" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAnadidoUsuario">Insertar nuevo usuario</a>

            <!-- Modal para añadir campeones -->
            <div class="modal fade" id="modalAnadidoUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAnadidoUsuario">Nuevo usuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body container">
                            <form action="anadirUsuario.jsp">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="NombreUsuario">Nombre Usuario</label>
                                        <input class="form-control" type="text" name="NombreUsuario" required/></br>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ContrasenaUsuario">Contraseña Usuario</label>
                                        <input class="form-control" type="text" name="ContrasenaUsuario" required/></br>
                                    </div>
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <input class="btn btn-primary" type="submit" value="Introducir">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para eliminar campeones -->
        <div class="modal fade" id="modalEliminadoUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalEliminadoUsuario">¡¡¡Vas a eliminar un usuario!!!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body container">
                        <form action="eliminarUsuario.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    <input class="form-control" type="radio" name="eliminarUsuario" value='ELIMINAR'/><br>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" type="radio" name="eliminarUsuario" value='VOLVER'/><br>
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <input class="btn btn-primary" type="submit" value="Aceptar">
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>      
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>