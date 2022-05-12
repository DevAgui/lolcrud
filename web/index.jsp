<%-- 
    Document   : login
    Created on : 10 may 2022, 13:37:48
    Author     : dagma
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login del CRUD de Programaci�n</title>
        <link rel="stylesheet" href="styles/login.css">
        <link rel="shortcut icon" href="./images/lolcrud.ico" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    </head>
    <body class="bg-secondary">

        <%request.setCharacterEncoding("UTF-8");%>
        
        <div id="wrapper" class="container bg-light">
            <form action="logout.jsp">
                
                <p>Loggeado como: <% out.print(session.getAttribute("usuarioRegistrado")); %></p>
                <p>Contrasena <% out.print(session.getAttribute("contrasenaUsuario")); %></p>
                <p>Codigo <% out.print(session.getAttribute("codigoUsuario")); %></p>
                <button type="submit" class="btn btn-primary">Salir</button>
            </form>
        </div>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3308/lolcrud?useSSL=false&allowPublicKeyRetrieval=true", "root", "root");

            try{

        %>

        <div id="wrapper" class="container bg-light vh-100 p-3">
            <h1 class="text-center py-5 text-danger">Login para CRUD de Programaci�n</h1>


            <div class="row">
                <div class="col-xs-12 col-md-8 col-lg-6 m-auto">
                    <!-- Formulario de Bootstrap -->
                    <form class="border border-primary p-4" method="post" action="comprobacionUsuarioContrasena.jsp">
                        <div class="mb-3">
                            <label for="usuario" class="form-label">Identificador</label>
                            <input type="text" class="form-control" id="usuario" aria-describedby="usuario" name="usuario" required>

                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Contrase�a</label>
                            <input type="text" class="form-control" id="password" name="password">

                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                        <h2><% 

                            if(session.getAttribute("entradaIlegal").equals("si")){

                                out.print(session.getAttribute("error"));
                            

                            } else{

                                out.print("Inicie sesión");

                            }

                        }catch(Exception e){

                            out.print(e);
                        }
                            
                            %></h2>
                    </form>
                    
                </div>
            </div>
            <!-- Formulario de Bootstrap -->


        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>