<%-- 
    Document   : formularioEditarCampeones
    Created on : 23 feb 2022, 17:59:47
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/loginstyle.css" rel="stylesheet" type="text/css"/>
        <title>Formulario Campeones</title>
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
    </head>
    <body>



        <%request.setCharacterEncoding("UTF-8");%>

        <%
             
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();
            
            
            String identificador = request.getParameter("NomCamp");
            
        %>
          
    <div id="wrapper" class="container bg-light vh-100">
        <form action="editar.jsp?id="<%request.getParameter("id");%>">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="NomCampEdi">Nuevo nombre</label>
                                    <input type="hidden" name="id" value=""/>
                                    <input class="form-control" type="text" name="NomCampEdi" required/><br>
                                </div>
                                <div class="col-md-6">
                                    <label for="LineaCampEdi">Nueva línea</label>
                                    <input class="form-control" type="text" name="LineaCampEdi" required/></br>
                                </div>
                                <div class="col-md-6">
                                    <label for="RolHabCampEdi">Nuevo rol habitual</label>
                                    <input class="form-control" type="text" name="RolHabCampEdi" required/></br>
                                </div>
                                <div class="col-md-6">
                                    <label for="DescCampEdi">Nueva descripción</label>
                                    <input class="form-control" type="text" name="DescCampEdi" required/></br>
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <button class="btn btn-primary" type="submit" value="Aceptar">Editar</button>
                        </div>
                    </div>
                    </form>
        </div>





        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>