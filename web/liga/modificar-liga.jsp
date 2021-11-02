<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="videoJuego">
    Select id, nombre FROM video_juego
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Liga</title>
        <link rel="stylesheet" href="../theme/css/forms/forms2.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        </head>
        <!-- Incluimos la barra de navegaciÃ³n -->
    <jsp:include page="../template/navbar.jsp"></jsp:include>
        <body>
            <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
            <div class="background-transparencia"></div>
            <main>
                <form action="../ControladorLiga" method="POST" class="formulario" id="formulario">
                    <input name="txtID" hidden value="${dataLiga.id}">
                    <!-- Grupo: Nombre -->
                    <div class="formulario__grupo" id="grupo__nombre">
                        <label for="nombre" class="formulario__label">Nombre de la Liga</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre" id="nombre" placeholder="Ej. Liga de los MÃ¡quinas " required minlength="3" maxlength="40" value="${dataLiga.descripcion}">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">El nombre no puede contener letras y espacios.</p>
                </div>
                <!-- Grupo: Cbo Video Juegos -->
                <div class="formulario__grupo">
                    <label for="cboVideoJuego" class="formulario__label-cbo">
                        <span>Video Juego</span>
                        <select name="cboVideoJuego" id="cboVideoJuego" class="formulario__input-cbo" required>
                            <!-- For each que encuentra el Match -->
                            <c:forEach var="x" items="${videoJuego.rows}">
                                <c:choose>
                                    <c:when test="${x.id == dataVideoJuego}">
                                        <option selected value="${x.id}">${x.nombre}</option>
                                    </c:when>    
                                    <c:when test="${x.id != dataVideoJuego}">
                                        <option value="${x.id}">${x.nombre}</option>
                                    </c:when>  
                                </c:choose>
                            </c:forEach>
                        </select>
                    </label>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" name="btnAccion" value="ModificarLiga">Modificar Liga</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>
        </main>
        <!-- Sweet Alert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!--<script src="../functions/js/forms/formulario-agregar-liga.js"></script> -->
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>