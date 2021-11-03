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
            <h1 class="title">¡Únete! ¿Qué esperas?</h1>
            <div class="container">
            <c:forEach var="x" items="${listaEquipos.rows}">
                <div class="card">
                    <img src="../theme/img/equipo/team-fifa.png">
                    <div class="card__contenedor">
                        <h4>
                            ${x.nombre}
                            <br> ${x.id_usuario}
                        </h4>
                        <p>
                            ${x.descripcion}
                        </p>
                        <p class="card__cupos">
                            Sólo quedan ${8 - x.cantidad_jugador} cupos!
                        </p>
                        <a href="#" class="btn-solicitar">Solicitar Unirse</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>