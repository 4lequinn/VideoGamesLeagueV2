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
<sql:query dataSource="${dataSource}" var="listaLigas">
    Select l.id, l.descripcion, l.cantidad_equipo, v.nombre
    FROM liga l
    INNER JOIN video_juego v on l.id_juego = v.id
</sql:query>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Ligas</title>
        <link rel="stylesheet" href="../theme/css/liga/panel-ligas-admin.css">
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
                        <a class="nav-crud__item-link nav-crud__item-link-add btn btn-success" href="../liga/agregar-liga.jsp"><span class="material-icons nav-crud__item-icon">add</span>Agregar</a>
                    </li>
                </ul>
            </nav>

            <div class="table_responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Liga</th>
                            <th>Video Juego</th>
                            <th>Cantidad de Equipos</th>
                            <th>Cupos</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                <c:forEach var="x" items="${listaLigas.rows}">
                    <tbody>
                        <tr>
                            <td>${x.id}</td>
                            <td>${x.descripcion}</td>
                            <td>${x.nombre}</td>
                            <td>${x.cantidad_equipo}</td>
                            <td>${8 - x.cantidad_equipo}</td>
                            <td>
                                <span class="action_btn ">
                                    <a href="../ControladorLiga?id=${x.id}" class="btn btn-primary material-icons" data-toggle="tooltip" data-placement="top" title="Editar" >edit</a>
                                    <a onclick="eliminarLiga('${x.id}')" class="btn btn-danger material-icons" data-toggle="tooltip" data-placement="top" title="Eliminar" >delete</a>
                                    <a href="#" class="btn btn-warning material-icons" data-toggle="tooltip" data-placement="top" title="Iniciar Torneo" >gamepad</a>
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