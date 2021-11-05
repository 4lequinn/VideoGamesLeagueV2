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
<c:if test="${ sesionUsuario.idTipo.id != 1 }">
    <c:redirect url="../usuario/login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaEquipos">
    SELECT p.id , p.fecha, p.hora_inicio, 
    p.hora_termino, concat(f.descripcion) as fase,
    concat(l.descripcion) as liga
    FROM partido p
    INNER JOIN LIGA l
    ON p.id_liga = l.id
    INNER JOIN FASE f 
    ON p.id_fase = f.id
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Equipos</title>
        <link rel="stylesheet" href="../theme/css/equipo/panel-equipos-admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Iconos de Material Desing Google-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="panel-admin.jsp"></jsp:include>
            <!-- Nav Agregar Buscar-->
            <nav class="nav-crud">
                <ul class="nav-crud__lista">
                    <li class="nav-crud__item">
                        <a class="nav-crud__item-link nav-crud__item-link-add btn btn-success" href="../equipo/agregar-equipo.jsp"><span class="material-icons nav-crud__item-icon">add</span>Agregar</a>
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
                            <th>Fecha</th>
                            <th>Hora Inicio</th>
                            <th>Hora Termino</th>
                            <th>Fase</th>
                            <th>Liga</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                <c:forEach var="x" items="${listaEquipos.rows}">
                    <tbody>
                        <tr>
                            <td>${x.id}</td>
                            <td>${x.fecha}</td>
                            <td>${x.hora_inicio}</td>
                            <td>${x.hora_termino}</td>
                            <td>${x.fase }</td>
                            <td>${x.liga }</td>
                            <td>
                                <span class="action_btn ">
                                    <a href="../ControladorEquipo?id=${x.id}"  class="btn btn-primary material-icons ">edit</a>
                                    <a onclick="eliminarEquipo('${x.id}')" class="btn btn-danger material-icons ">delete</a>
                                </span>
                            </td>
                    </tbody>
                </c:forEach>

            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../functions/js/forms/alertas.js"></script>
        <jsp:include page="../template/footer.jsp"></jsp:include>
    </body>

</html>