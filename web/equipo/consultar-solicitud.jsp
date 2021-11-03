<%-- 
    Document   : Login
    Created on : 11-10-2021, 17:28:20
    Author     : jorge
--%>

<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaSolicitudes">
    Select i.id, e.nombre,p.id_usuario, p.habilidad, i.fecha, es.descripcion 
    FROM equipo e 
    INNER JOIN perfil_jugador p on e.id_perfil = p.id
    INNER JOIN incripcion i on i.id_jugador = p.id
    INNER JOIN tipo_jugador t on t.id = p.id_tipo_jugador
    INNER JOIN estado_solicitud es on es.id = i.id_estado
</sql:query>
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
                        <th>Nombre Equipo</th>
                        <th>Usuario</th>
                        <th>Jugador</th>
                        <th>Fecha Solicitud</th>
                        <th>Estado</th>
                        <th>Aceptar/Rechazar</th>
                    </tr>
                </thead>

                <tbody>
                   
                        <tr>
                             <c:forEach var="x" items="${listaSolicitudes.rows}">
                            <td>${ x.id }<td>
                            <td>${ x.nombre }</td>
                            <td>${x.id_usuario}</td>
                            <td>${ x.descripcion }</td>
                            <td> ${ x.fecha } </td>
                            <td> ${x.descripcion}</td>
                            <td>
                                <span class="action_btn ">
                                    <a href="# " class="btn btn-success material-icons ">done</a>
                                    <a href="# " class="btn btn-danger material-icons ">close</a>
                                </span>
                            </td>
                                 </c:forEach>
                        </tr>
               
                </tbody>

            </table>
        </div>
    </body>
</html>