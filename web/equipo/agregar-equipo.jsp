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
<sql:query dataSource="${dataSource}" var="ligas">
    Select id, descripcion FROM liga
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Equipo</title>
        <link rel="stylesheet" href="../theme/css/forms/forms2.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        </head>

        <!-- Incluimos la barra de navegaciÃ³n -->
    <jsp:include page="../template/navbar2.jsp"></jsp:include>

        <body>
            <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
            <div class="background-transparencia"></div>
            <main>
                <form action="../ControladorEquipo" method="POST" class="formulario" id="formulario">
                    <!-- <input name="txtUsuario" hidden value="${usuario.usuario}"> -->
                <!-- Grupo: Nombre -->
                <div class="formulario__grupo" id="grupo__nombre">
                    <label for="nombre" class="formulario__label">Nombre del Equipo</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="nombre" id="nombre" placeholder="Ej. Corxea" required minlength="3" maxlength="40">
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">El nombre no puede contener letras y espacios.</p>
                </div>
                <!-- Grupo: Cbo Tipo Jugador -->
                <div class="formulario__grupo">
                    <label for="cboLiga" class="formulario__label-cbo">
                        <span>Liga</span>
                        <select name="cboLiga" id="cboLiga" class="formulario__input-cbo" required>
                            <!-- Primer op -->
                            <option disabled selected value="0">Seleccione</option>
                            <c:forEach var="x" items="${ligas.rows}">
                                <option value="${x.id}">${x.descripcion}</option> 
                            </c:forEach>
                        </select>
                    </label>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" name="btnAccion" value="CrearEquipo">Crear Equipo</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
                <div>${msOKRegistrarU}${msNORegistrarU}${msErrorRegistrarU}</div>       
            </form>
        </main>
        <!-- Sweet Alert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../functions/js/forms/formulario-agregar-equipo.js"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>
</html>