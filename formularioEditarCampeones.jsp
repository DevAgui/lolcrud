<%-- 
    Document   : formularioEditarCampeones.jsp
    Created on : 19 may 2022, 12:48:56
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edita tus campeones</title>
        <link rel="stylesheet" href="styles/login.css">
        <link rel="shortcut icon" href="./images/lolcrud.ico" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body>
        
        <div id="wrapper" class="container vh-100 p-3">
                        <form action="editarCampeon.jsp">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="NomCamp">Nuevo nombre</label>
                                    <input class="form-control" type="text" name="NomCamp" required value="<%= request.getParameter("NomCamp")%>"/><br>
                                </div>
                                    <input type="hidden" name="CodCamp" value="<%=request.getParameter("CodCamp")%>">
                                </label>
                                <div class="col-md-6">
                                    <label for="LineaCamp">Nueva línea</label>
                                    <input class="form-control" type="text" name="LineaCamp" required value="<%= request.getParameter("LineaCamp")%>"/></br>
                                </div>
                                <div class="col-md-6">
                                    <label for="RolHabCamp">Nuevo rol habitual</label>
                                    <input class="form-control" type="text" name="RolHabCamp" required placeholder="RolHabCamp" value="<%= request.getParameter("RolHabCamp")%>"/></br>
                                </div>
                                <div class="col-md-6">
                                    <label for="DescCamp">Nueva descripción</label>
                                    <input class="form-control" type="text" name="DescCamp" required value="<%= request.getParameter("DescCamp")%>"/></br>
                                </div>
                                <div class="row">
                                <div class="col-md-2">
                                    <button class="btn btn-primary" type="submit" value="Aceptar">Editar</button>
                                    <a class="btn btn-secondary" href="listado.jsp">Volver</a>
                                </div>
                                </div>
                            </div>
                        </form>
                    </div>                   
    </body>
</html>
