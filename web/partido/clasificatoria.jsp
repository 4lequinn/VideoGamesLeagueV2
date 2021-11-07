<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="dataLiga">
    SELECT DISTINCT  p.id, p.fecha, p.hora_inicio, p.hora_termino, l.descripcion
    FROM partido p join liga l on l.id=p.id_liga
    WHERE id_fase = 2 and id_liga = 1
    group by l.descripcion;
</sql:query>
    <!-- 4tos de Final  DATA -->
<sql:query dataSource="${dataSource}" var="listaPartidos4toFinal">
    SELECT id, fecha, hora_inicio, hora_termino
    FROM partido
    WHERE id_fase = 2 and id_liga = 1;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquipos4toFinal">
    SELECT id_partido, dp.id_equipo, 
    concat(dp.id) as id_detalle,
    e.nombre,dp.id_resultado, 
    dp.id_localidad, 
    concat(r.descripcion) as estado_partido
    FROM detalle_partido dp
    INNER JOIN partido p
    ON dp.id_partido = p.id
    inner join equipo e
    ON dp.id_equipo = e.id
    INNER JOIN resultado r
    ON r.id = dp.id_resultado
    where p.id_fase = 2 and p.id_liga = 1;
</sql:query>

<!-- Semi Final DATA -->
<sql:query dataSource="${dataSource}" var="listaPartidosSemifinal">
    SELECT id, fecha, hora_inicio, hora_termino
    FROM partido
    WHERE id_fase = 3 and id_liga = 1;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquiposSemifinal">
    SELECT id_partido, dp.id_equipo, 
    concat(dp.id) as id_detalle,
    e.nombre,dp.id_resultado, 
    dp.id_localidad, 
    concat(r.descripcion) as estado_partido
    FROM detalle_partido dp
    INNER JOIN partido p
    ON dp.id_partido = p.id
    inner join equipo e
    ON dp.id_equipo = e.id
    INNER JOIN resultado r
    ON r.id = dp.id_resultado
    where p.id_fase = 3 and p.id_liga = 1;
</sql:query>

<!-- 3er y Cuarto Lugar DATA -->
<sql:query dataSource="${dataSource}" var="listaPartidosTercerCuarto">
    SELECT id, fecha, hora_inicio, hora_termino
    FROM partido
    WHERE id_fase = 4 and id_liga = 1;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquiposTercerCuarto">
    SELECT id_partido, dp.id_equipo, 
    concat(dp.id) as id_detalle,
    e.nombre,dp.id_resultado, 
    dp.id_localidad, 
    concat(r.descripcion) as estado_partido
    FROM detalle_partido dp
    INNER JOIN partido p
    ON dp.id_partido = p.id
    inner join equipo e
    ON dp.id_equipo = e.id
    INNER JOIN resultado r
    ON r.id = dp.id_resultado
    where p.id_fase = 4 and p.id_liga = 1;
</sql:query>

<!-- Final DATA -->
<sql:query dataSource="${dataSource}" var="listaPartidosFinal">
    SELECT id, fecha, hora_inicio, hora_termino
    FROM partido
    WHERE id_fase = 5 and id_liga = 1;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquiposFinal">
    SELECT id_partido, dp.id_equipo, 
    concat(dp.id) as id_detalle,
    e.nombre,dp.id_resultado, 
    dp.id_localidad, 
    concat(r.descripcion) as estado_partido
    FROM detalle_partido dp
    INNER JOIN partido p
    ON dp.id_partido = p.id
    inner join equipo e
    ON dp.id_equipo = e.id
    INNER JOIN resultado r
    ON r.id = dp.id_resultado
    where p.id_fase = 5 and p.id_liga = 1;
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Clasificatoria</title>
        <link rel="stylesheet" type="text/css" href="../theme/css/partido/clasificatoria.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Importo estilos de la NAVBAR -->
        <%@include file="../includes/links/navbar-link.jsp" %>
    </head>
    <!-- Incluimos la barra de navegación -->    
    <%@include file="../template/navbar2.jsp" %>
    <body style="overflow: scroll">
        <div class="container">
            <h1>Video Juego</h1>
            <c:forEach var="x" items="${dataLiga.rows}">
                <h2>${x.descripcion}</h2>
            </c:forEach>
            <div class="tournament-bracket tournament-bracket--rounded">                                                     
                <div class="tournament-bracket__round tournament-bracket__round--quarterfinals">
                    <h3 class="tournament-bracket__round-title mt-5">Cuartos de Final</h3>
                    <ul class="tournament-bracket__list">
                        <!-- Item  4tos de Final -->
                        <c:forEach var="x" items="${listaPartidos4toFinal.rows}">
                            <li class="tournament-bracket__item">
                                <div class="tournament-bracket__match" tabindex="0">
                                    <table class="tournament-bracket__table">
                                        <caption class="tournament-bracket__caption">
                                            <time>${x.fecha} - (${x.hora_inicio} - ${x.hora_termino})</time>
                                        </caption>
                                        <thead class="sr-only">
                                            <tr>
                                                <th>Country</th>
                                                <th>Score</th>
                                            </tr>
                                        </thead>  
                                        <tbody class="tournament-bracket__content">
                                            <c:forEach var="y" items="${listaEquipos4toFinal.rows}">
                                                <c:if test="${y.id_partido == x.id}">
                                                    <c:choose>
                                                        <c:when test="${y.id_localidad == 1}">
                                                            <tr class="tournament-bracket__team"> <!-- tournament-bracket__team--winner -->
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                </td>
                                                            </tr>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <tr class="tournament-bracket__team">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>

                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                </td>
                                                            </tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>  
                                    </table>
                                </div>
                            </li>
                        </c:forEach>
                        </tbody>  
                    </ul>
                </div>

                <div class="tournament-bracket__round tournament-bracket__round--semifinals">
                    <h3 class="tournament-bracket__round-title mt-5">Semi Final</h3>
                    <ul class="tournament-bracket__list">
                        <!-- Item  -->
                        <c:forEach var="x" items="${listaPartidosSemifinal.rows}">
                            <li class="tournament-bracket__item">
                                <div class="tournament-bracket__match" tabindex="0">
                                    <table class="tournament-bracket__table">
                                        <caption class="tournament-bracket__caption">
                                            <time datetime="1998-02-20">${x.fecha} - (${x.hora_inicio} - ${x.hora_termino})</time>
                                        </caption>
                                        <thead class="sr-only">
                                            <tr>
                                                <th>Country</th>
                                                <th>Score</th>
                                            </tr>
                                        </thead>  
                                        <c:forEach var="y" items="${listaEquiposSemifinal.rows}">
                                            <c:if test="${y.id_partido == x.id}">
                                                <c:choose>
                                                    <c:when test="${y.id_localidad == 1}">
                                                        <tbody class="tournament-bracket__content">
                                                            <tr class="tournament-bracket__team">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-ca" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                </td>
                                                            </tr>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-cz" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="tournament-bracket__round tournament-bracket__round--bronze">
                    <h3 class="tournament-bracket__round-title mt-5">Tercer y Cuarto Lugar</h3>
                    <ul class="tournament-bracket__list">

                        <!-- Item Tercer y Cuarto Lugar -->
                        <c:forEach var="x" items="${listaPartidosTercerCuarto.rows}">
                            <li class="tournament-bracket__item">
                                <div class="tournament-bracket__match" tabindex="0">
                                    <table class="tournament-bracket__table">
                                        <caption class="tournament-bracket__caption">
                                            <time datetime="1998-02-21">${x.fecha} - (${x.hora_inicio} - ${x.hora_termino})</time>
                                        </caption>
                                        <thead class="sr-only">
                                            <tr>
                                                <th>Country</th>
                                                <th>Score</th>
                                            </tr>
                                        </thead>  
                                        <c:forEach var="y" items="${listaEquiposTercerCuarto.rows}">
                                            <c:if test="${y.id_partido == x.id}">
                                                <c:choose>
                                                    <c:when test="${y.id_localidad == 1}">
                                                        <tbody class="tournament-bracket__content">
                                                            <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-fi" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                    <span class="tournament-bracket__medal tournament-bracket__medal--bronze fa fa-trophy" aria-label="Bronze medal"></span>
                                                                </td>
                                                            </tr>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <tr class="tournament-bracket__team">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-ca" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="tournament-bracket__round tournament-bracket__round--gold">
                    <h3 class="tournament-bracket__round-title mt-5">Final</h3>
                    <ul class="tournament-bracket__list">

                        <!-- Item Final -->
                        <c:forEach var="x" items="${listaPartidosFinal.rows}">
                            <li class="tournament-bracket__item">
                                <div class="tournament-bracket__match" tabindex="0">
                                    <table class="tournament-bracket__table">
                                        <caption class="tournament-bracket__caption">
                                            <time datetime="1998-02-22">${x.fecha} - (${x.hora_inicio} - ${x.hora_termino})</time>
                                        </caption>
                                        <thead class="sr-only">
                                            <tr>
                                                <th>Country</th>
                                                <th>Score</th>
                                            </tr>
                                        </thead>  
                                        <c:forEach var="y" items="${listaEquiposFinal.rows}">
                                            <c:if test="${y.id_partido == x.id}">
                                                <c:choose>
                                                    <c:when test="${y.id_localidad == 1}">
                                                        <tbody class="tournament-bracket__content">
                                                            <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-cz" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                    <span class="tournament-bracket__medal tournament-bracket__medal--gold fa fa-trophy" aria-label="Gold medal"></span>
                                                                </td>
                                                            </tr>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <tr class="tournament-bracket__team">
                                                                <td class="tournament-bracket__country">
                                                                    <abbr class="tournament-bracket__code">${y.nombre}</abbr>
                                                                    <span class="tournament-bracket__flag flag-icon flag-icon-ru" aria-label="Flag"></span>
                                                                </td>
                                                                <td class="tournament-bracket__score">
                                                                    <span class="tournament-bracket__number">${y.estado_partido}</span>
                                                                    <span class="tournament-bracket__medal tournament-bracket__medal--silver fa fa-trophy" aria-label="Silver medal"></span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>

            </div>

        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.pkgd.min.js"></script>

        <%@include file="../includes/scripts/navbar-script.jsp" %>
    </body>

</html>