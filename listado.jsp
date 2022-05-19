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
        <title>Consulta tus campeones</title>
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


                    session.setAttribute("error", "¡Alto ahí! Inicie sesión si quiere acceder al listado.");
                    session.setAttribute("entradaIlegal", "si");
                    response.sendRedirect("index.jsp");

                } else{

                    session.setAttribute("entradaIlegal", "no");
                    
                }
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
                Statement s = conexion.createStatement();
                Statement u = conexion.createStatement();

                ResultSet listadoCampeones = s.executeQuery("SELECT * FROM listado_campeon WHERE CodUsu = " + session.getAttribute("codigoUsuario"));
        %>

        <div id="wrapper" class="container bg-light">
            <form action="logout.jsp">
                <p>Loggeado como: <i><% out.print(session.getAttribute("usuarioRegistrado")); %></i></p>
                <button type="submit" class="btn btn-primary">Logout</button>
            </form>
        </div>

        <div id="wrapper" class="container vh-100 bg-light">
            <h1 class="text-center py-5">Bienvenido <% out.print(session.getAttribute("usuarioRegistrado")); %></h1>
            <h3 class="text-center py-5">Estos son los campeones que has jugado</h3>
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                        <tr>
                            <th scope="col">Código Campeón</th>
                            <th scope="col">Nombre Campeón</th>
                            <th scope="col">Línea del Campeón</th>
                            <th scope="col">Rol habitual</th>
                            <th scope="col">Descripción del campeón</th>
                            <!--<th scope="col">Usuarios que ya lo han jugado</th>-->
                            <th scope="col">Editar</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (listadoCampeones.next()) {
                        %>

                        <tr>
                            <td class="col-2"> <%=listadoCampeones.getString("CodCamp")%></td>
                            <td class="col-2"> <%=listadoCampeones.getString("NomCamp")%></td>
                            <td class="col-2"> <%=listadoCampeones.getString("LineaCamp")%></td> 
                            <td class="col-2"> <%=listadoCampeones.getString("RolHabCamp")%></td>
                            <td class="col-4"> <%=listadoCampeones.getString("DescCamp")%></td>
                            <!--<td class="col-3"> listadoCampeones.getString("CodUsu")</td>-->
                            <td class="col-1">
                                <form action="formularioEditarCampeones.jsp" method="get">
                                    <input type="hidden" name="CodCamp" value="<%=listadoCampeones.getString("CodCamp")%>">
                                    <input type="hidden" name="NomCamp" value="<%=listadoCampeones.getString("NomCamp")%>">
                                    <input type="hidden" name="LineaCamp" value="<%=listadoCampeones.getString("LineaCamp")%>">
                                    <input type="hidden" name="RolHabCamp" value="<%=listadoCampeones.getString("RolHabCamp")%>">
                                    <input type="hidden" name="DescCamp" value="<%=listadoCampeones.getString("DescCamp")%>">
                                    <button href="formularioEditarCampeones.jsp" class="col-1 bi bi-pencil-square rowWithImage" type="submit"></button>
                                </form>
                            </td> 
                            <td class="col-1"><a href="eliminarCampeon.jsp?id=<%=listadoCampeones.getString("CodCamp")%>" class=" bi-trash3-fill rowWithImage text-danger" onclick="alert('Has eliminado a <%= listadoCampeones.getString("NomCamp")%> con éxito.')"></a></td>
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
            <a href="anadirCampeon.jsp" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAnadido">Insertar nuevo campeón</a>

            <!-- Modal para añadir campeones -->
            <div class="modal fade" id="modalAnadido" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAnadido">Nuevo campeón</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body container">
                            <form action="anadirCampeon.jsp">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="NomCamp">Nombre Campeón</label>
                                        <input class="form-control" type="text" name="NomCamp" required/><br>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="LineaCamp">Linea del Campeón</label>
                                        <input class="form-control" type="text" name="LineaCamp" required/></br>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="RolHabCamp">Rol habitual del Campeón</label>
                                        <input class="form-control" type="text" name="RolHabCamp" required/></br>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="DescCamp">Descripción del Campeón</label>
                                        <input class="form-control" type="text" name="DescCamp" required/></br>
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
        <div class="modal fade" id="modalEliminado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalEliminado">¡¡¡Vas a eliminar un campeón!!!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body container">
                        <form action="eliminarCampeon.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    <input class="form-control" type="radio" name="eliminar" value='ELIMINAR'/><br>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" type="radio" name="eliminar" value='VOLVER'/><br>
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


        <!-- Modal para editar campeones -->
        
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>