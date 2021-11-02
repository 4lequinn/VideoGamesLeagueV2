<%-- 
    Document   : Login
    Created on : 11-10-2021, 17:28:20
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitudes</title>
    <link rel="stylesheet" href="../theme/css/equipo/panel-consultar-solicitud.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Iconos de Material Desing Google-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
    <body>
        <!-- Nav Agregar Buscar-->
        <nav class="nav-crud">
            <ul class="nav-crud__lista">
                <li class="nav-crud__item">
                    <a class="nav-crud__item-link nav-crud__item-link-add btn btn-success" href="../index.jsp"><span class="material-icons nav-crud__item-icon">exit_to_app</span>Volver</a>
                </li>
                <li class="nav-crud__item">
                    <input class="nav-crud__item-text" type="text" placeholder="Ingrese un ID">
                    <a class="nav-crud__item-link nav-crud__item-link-search btn-warning" href=""><span class="nav-crud__item-icon material-icons">search</span></a>
                </li>
            </ul>
        </nav>
        <div class="table_responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Habilidad</th>
                        <th>Jugador</th>
                        <th>Fecha Solicitud</th>
                        <th>Estado</th>
                        <th>Aceptar/Rechazar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Panshoots</td>
                        <td>Francisco</td>
                        <td>uwuxd</td>
                        <td>Banear a los de javita web</td>
                        <td>Java</td>
                        <td>Hoy</td>
                        <td>PENDIENTE</td>
                        <td>
                            <span class="action_btn ">
                                <a href="# " class="btn btn-success material-icons ">done</a>
                                <a href="# " class="btn btn-danger material-icons ">close</a>
                            </span>
                        </td>
                </tbody>
            </table>
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>