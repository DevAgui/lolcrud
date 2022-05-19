<%-- 
    Document   : formularioEditarUsuaios.jsp
    Created on : 19 may 2022, 12:48:56
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edita los usuarios</title>
        <link rel="stylesheet" href="styles/login.css">
        <link rel="shortcut icon" href="./images/lolcrud.ico" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body>
        
        <div id="wrapper" class="container vh-100 p-3">
                        <form action="editarUsuario.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="NomUsu">Nueva nombre</label>
                                    <input class="form-control" type="text" name="NomUsu" required value="<%= request.getParameter("NomUsu")%>"/></br>
                                </div>
                                </div>
                                <input type="hidden" name="CodUsu" value="<%= request.getParameter("CodUsu")%>"/>
                                <div class="col-md-6">
                                    <label for="RolHabCamp">Nuevo contraseña</label>
                                    <input class="form-control" type="text" name="Contrasena" required value="<%= request.getParameter("Contrasena")%>"/></br>
                                </div>
                                <div class="row">
                                <div class="col-md-2">
                                    <button class="btn btn-primary" type="submit" value="Aceptar">Editar</button>
                                    <a class="btn btn-secondary" href="listadoAdmin.jsp">Volver</a>
                                </div>
                                </div>
                            </div>
                        </form>
                    </div>                   
    </body>
</html>