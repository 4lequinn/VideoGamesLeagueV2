<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Panel de Ligas</title>
        <link rel="stylesheet" href="../theme/css/liga/panel-ligas-usuario.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        </head>
    <jsp:include page="../template/navbar2.jsp"></jsp:include>
        <body>
            <h1 class="title">¡Compite y Gana!</h1>
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
                        <c:choose>
                            <c:when test="${x.cantidad_equipo == 0}">
                                <p class="card__cupos">
                                    No hay equipos participando, ¡sé el primero!
                                </p>
                            </c:when> 
                            <c:when test="${x.cantidad_equipo == 1}">
                                <p class="card__cupos">
                                    ¡Sólo hay un equipo!, inscríbete ¿qué esperas?
                                </p>
                            </c:when> 
                            <c:otherwise>
                                <p class="card__cupos">
                                    ¡Hay ${x.cantidad_equipo} Equipos participando!
                                </p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>