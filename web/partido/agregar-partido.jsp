<%-- 
    Document   : prueba
    Created on : 07-10-2021, 14:32:53
    Author     : jorge
--%>
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
<sql:query dataSource="${dataSource}" var="tipoFase">
    Select id, descripcion FROM fase
</sql:query>
<sql:query dataSource="${dataSource}" var="tipoLiga">
    Select id, descripcion FROM liga
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar partido</title>
        <link rel="stylesheet" href="../theme/css/forms/forms.css">
        <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        </head>

        <!-- Incluimos la barra de navegación -->
    <jsp:include page="../template/navbar2.jsp"></jsp:include>

        <body>
            <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
            <div class="background-transparencia"></div>
            <main>
                <form action="../ControladorPartido" method="POST" class="formulario" id="formulario">

                    <!-- Grupo: Fecha -->
                    <div class="formulario__grupo" id="grupo_fecha">
                        <label for="fecha" class="formulario__label">Fecha</label>
                        <div class="formulario__grupo-input">
                            <input type="date" class="formulario__input" name="fecha" id="fecha"  required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                    </div>

                    <!-- Grupo: Hora inicio -->
                    <div class="formulario__grupo" id="grupo_hora_inicio">
                        <label for="hora_inicio" class="formulario__label">Hora inicio</label>
                        <div class="formulario__grupo-input">
                            <input type="time" class="formulario__input" name="hora_inicio" id="hora_inicio"  required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                    </div>

                    <!-- Grupo: Hora termino -->
                    <div class="formulario__grupo" id="grupo_hora_inicio">
                        <label for="hora_termino" class="formulario__label">Hora termino</label>
                        <div class="formulario__grupo-input">
                            <input type="time" class="formulario__input" name="hora_termino" id="hora_termino"  required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                    </div>

                    <!-- Grupo: Cbo Fase -->
                    <div class="formulario__grupo">
                        <label for="cboFase" class="formulario__label-cbo">
                            <span>Fase</span>
                        </label>
                        <select name="cboFase" id="cboFase" class="formulario__input-cbo" required>
                            <!-- Primer op -->
                            <option disabled selected value="0">Seleccione</option>
                            <!--Quitar Options y poner la lista de la BDD -->
                        <c:forEach var="x" items="${tipoFase.rows}">
                            <option value="${x.id}">${x.descripcion}</option>
                      
                        </c:forEach>
                    </select>
                        

                </div>

                <!-- Grupo: Cbo Liga --> <!-- NEW -->
                <div class="formulario__grupo">
                    <label for="cboLiga" class="formulario__label-cbo">
                        <span>Liga</span>
                    </label>
                    <select name="cboLiga" id="cboLiga" class="formulario__input-cbo" required>
                        <!-- Primer op -->
                        <option disabled selected value="0">Seleccione</option>
                        <!--Quitar Options y poner la lista de la BDD -->
                        <c:forEach var="x" items="${tipoLiga.rows}">
                            <option value="${x.id}">${x.descripcion}</option>
                        </c:forEach>
                    </select>

                </div>

                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" name="btnAccion" value="CrearPartido">Agregar Partido</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
                <div>${msOKCrearP}${msNOCrearP}${msErrorCrearP}</div>       

            </form>

        </main>
        <!--Incluir el CDN de Sweet alert -->
        <!--<script src="../functions/js/forms/formulario-registro.js"></script> -->    
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>

</html>