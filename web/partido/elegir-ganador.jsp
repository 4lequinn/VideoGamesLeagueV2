<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaEquipos">
    Select e.id, e.nombre, e.cantidad_jugador, p.id_usuario, l.descripcion
    FROM equipo e 
    INNER JOIN perfil_jugador p on e.id_perfil = p.id
    INNER JOIN liga l on e.id_liga = l.id
    WHERE e.cantidad_jugador < 8 
</sql:query>
<!--Validación para que no puedas enviar Solicitud a un equipo que ya está completo -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Panel de Equipos</title>
        <link rel="stylesheet" href="../theme/css/equipo/panel-equipos-usuario.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        <jsp:include page="../includes/links/footer-link.jsp"></jsp:include>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        </head>
    <jsp:include page="../template/navbar2.jsp"></jsp:include>
        <body>
            <h1 class="title">¿Quién ganará este encuentro?</h1>
            <div class="container">
                <div class="card">
                    <img src="../theme/img/equipo/team-fifa.png">
                    <div class="card__contenedor">
                        <h4>
                        ${detalle1.idEquipo.nombre}
                    </h4>
                    <p>
                        ${detalle1.idPartido.fecha}
                    </p>
                    <p class="card__cupos">
                        ${detalle1.idResultado.descripcion}
                    </p>
                    <a href="../ControladorPartido?detallePartido=${detalle1.idPartido.id}&ganadorEquipo=${detalle1.idEquipo.id}&perdedorEquipo=${detalle2.idEquipo.id}" class="btn-solicitar">GANADOR</a>
                </div> 
            </div>

            <div class="card">
                <img src="../theme/img/equipo/team-fifa.png">
                <div class="card__contenedor">
                    <h4>
                        ${detalle2.idEquipo.nombre}
                    </h4>
                    <p>
                        ${detalle2.idPartido.fecha}
                    </p>
                    <p class="card__cupos">
                        ${detalle2.idResultado.descripcion}
                    </p>
                    <a href="../ControladorPartido?detallePartido=${detalle2.idPartido.id}&ganadorEquipo=${detalle2.idEquipo.id}&perdedorEquipo=${detalle1.idEquipo.id}" class="btn-solicitar">GANADOR</a>
                </div> 
            </div>
                
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>