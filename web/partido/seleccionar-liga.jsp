<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaLigas">
    SELECT l.id, l.descripcion , l.cantidad_equipo, j.nombre, j.tipo_juego
    from liga l
    INNER JOIN video_juego j 
    ON l.id_juego = j.id
</sql:query>
<!--Validación para que no puedas enviar Solicitud a un equipo que ya está completo -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Seleccionar Liga</title>
        <link rel="stylesheet" href="../theme/css/equipo/panel-equipos-usuario.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        <jsp:include page="../includes/links/footer-link.jsp"></jsp:include>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        </head>
    <jsp:include page="../template/navbar2.jsp"></jsp:include>
        <body style="overflow: scroll ">
            <h1 class="title">Clasificatorias</h1>
            <div class="container">
            <c:forEach var="x" items="${listaLigas.rows}">
                <div class="card">
                    <img src="../theme/img/equipo/team-fifa.png">
                    <div class="card__contenedor">
                        <h4>
                            ${x.descripcion}
                        </h4>
                        <p>
                            ${x.nombre}
                        </p>
                        <p class="card__cupos">
                            <c:choose>
                                <c:when test="${x.cantidad_equipo == 8}">
                                    <a href="../ControladorLiga?clasificatoria=${x.id}" class="btn-solicitar">Ver Clasificatoria</a>
                                </c:when>
                                <c:otherwise>
                                    ¡Todavía no comienza la clasificatoria!
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div> 
                </div>
            </c:forEach>
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>