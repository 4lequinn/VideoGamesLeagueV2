<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<c:if test="${ sesionUsuario.idTipo.id != 1 && sesionUsuario.idTipo.id != 2 }">
    <c:redirect url="../usuario/login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaEquipos">
    select eq.id,l.descripcion, eq.nombre from equipo eq inner join
    liga l on eq.id_liga=l.id 
    inner join perfil_jugador p on p.id=eq.id_perfil
    where p.id_usuario ='${sesionUsuario.usuario}'
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
            </ul>
        </nav>

        <div class="table_responsive">
            <table>
                <thead>
                    <tr>
                        <th>Nombre del equipo</th>
                        <th>Liga</th>
                        <th>Modificar</th>
                    </tr>
                </thead>

                <c:forEach var="x" items="${listaEquipos.rows}">
                    <tbody>
                        <tr>
                            <td>${x.nombre}</td>
                            <td>${x.descripcion}</td>
                            <td>
                                <span class="action_btn ">
                                    <a href="../ControladorEquipo?id=${x.id}" class="btn btn-primary material-icons " data-toggle="tooltip" data-placement="top" title="Modificar">mode_edit</a>                        
                                </span>
                            </td>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>