<%-- 
    Document   : Modificar Usuario
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
<sql:query dataSource="${dataSource}" var="tipoUsuario">
    Select id, descripcion FROM tipo_usuario
</sql:query>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Usuario</title>
    <link rel="stylesheet" href="../theme/css/forms/forms2.css">
    <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
</head>

<!-- Incluimos la barra de navegación -->
<jsp:include page="../template/navbar2.jsp"></jsp:include>

<body>
    <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
    <div class="background-transparencia"></div>
    <main>
        <form action="" class="formulario" id="formulario">


            <!-- Grupo: Usuario -->
            <div class="formulario__grupo" id="grupo__usuario">
                <label for="usuario" class="formulario__label">Usuario</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="usuario" id="usuario" placeholder="Ej. Panshoots" required minlength="4" maxlength="16">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dÃ­gitos y sÃ³lo puede contener numeros, letras y guion bajo.</p>
            </div>


            <!-- Grupo: ContraseÃ±a -->
            <div class="formulario__grupo" id="grupo__password">
                <label for="password" class="formulario__label">ContraseÃ±a</label>
                <div class="formulario__grupo-input">
                    <input type="password" class="formulario__input" name="password" id="password" required minlength="8" maxlength="20">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error">La contraseÃ±a tiene que ser de 4 a 12 dÃ­gitos.</p>
            </div>

            <!-- Grupo: Cbo Tipo Usuario -->
            <div class="formulario__grupo">
                <label for="cboTipoUsuario" class="formulario__label-cbo">
                <span>Tipo de Usuario</span>
                <select name="cboTipoUsuario" id="cboTipoUsuario" class="formulario__input-cbo" required>
                    <!-- Primer op -->
                    <option disabled selected value="0">Seleccione</option>
                    <!--Quitar Options y poner la lista de la BDD -->
                <c:forEach var="x" items="${tipoUsuario.rows}">
                    <option value="${x.id}">${x.descripcion}</option>
                </c:forEach>
                    
                </select>
                </label>
            </div>

            <!-- Grupo: Cbo Tipo Jugador TEST -->
            <!-- 
                
            <div class="formulario__grupo">
                <label for="cboTipo" class="formulario__label-cbo">
                    <span>Tipo Jugador</span>
                    <input list="cboTipo" placeholder="Seleccione" class="formulario__input-cbo">
                    <datalist id = "cboTipo">
                        <option value="Estratega"></option>
                        <option value="Shooter"></option> 
                    </datalist>
                </label>
            </div>
            
            -->

            <div class="formulario__mensaje" id="formulario__mensaje">
                <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
            </div>


            <div class="formulario__grupo formulario__grupo-btn-enviar">
                <button type="submit" class="formulario__btn">Modificar Usuario</button>
                <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
            </div>
        </form>

    </main>
    <!--Incluir el CDN de Sweet alert -->
    <!-- Sweet Alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../functions/js/forms/formulario-agregar-usuario.js"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
    <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
</body>

</html>