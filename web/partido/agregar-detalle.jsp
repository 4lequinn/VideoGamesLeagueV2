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

<sql:query dataSource="${dataSource}" var="listaEquipoCuartos">
    SELECT e.id, e.nombre FROM equipo e 
    left JOIN detalle_partido dp 
    ON e.id = dp.id_equipo
    WHERE id_liga = '${partido.idLiga.id}' and dp.id IS NULL;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquipoSemifinal">
    SELECT e.id, e.nombre FROM EQUIPO e
    left JOIN detalle_partido dp
    ON e.id = dp.id_equipo
    left JOIN partido p
    on dp.id_partido = p.id
    where id_fase = 1 and dp.id_resultado = 2 and p.id_liga = '${partido.idLiga.id}' and dp.id IS NULL;;
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquipoTercerCuarto">
    SELECT e.id, e.nombre FROM EQUIPO e
    left JOIN detalle_partido dp
    ON e.id = dp.id_equipo
    left JOIN partido p
    on dp.id_partido = p.id
    where id_fase = 2 and dp.id_resultado = 3 and p.id_liga = '${partido.idLiga.id}';
</sql:query>
<sql:query dataSource="${dataSource}" var="listaEquipoFinal">
    SELECT e.id, e.nombre FROM EQUIPO e
    left JOIN detalle_partido dp
    ON e.id = dp.id_equipo
    left JOIN partido p
    on dp.id_partido = p.id
    where id_fase = 2 and dp.id_resultado = 2 and p.id_liga = '${partido.idLiga.id}';
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalle</title>
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
                    <input hidden value="${partido.id}" name="txtPartidoID">
                <c:choose>
                    <c:when test="${partido.idFase.id == 1}">
                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo1" class="formulario__label-cbo">
                                <span>Equipo 1</span>
                            </label>
                            <select name="cboEquipo1" id="cboEquipo1" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoCuartos.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo2" class="formulario__label-cbo">
                                <span>Equipo 2</span>
                            </label>
                            <select name="cboEquipo2" id="cboEquipo2" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoCuartos.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:when>
                    <c:when test="${partido.idFase.id == 2}">
                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo1" class="formulario__label-cbo">
                                <span>Equipo 1</span>
                            </label>
                            <select name="cboEquipo1" id="cboEquipo1" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoSemifinal.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo2" class="formulario__label-cbo">
                                <span>Equipo 2</span>
                            </label>
                            <select name="cboEquipo2" id="cboEquipo2" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoSemifinal.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:when>    
                    <c:when test="${partido.idFase.id == 3}">
                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo1" class="formulario__label-cbo">
                                <span>Equipo 1</span>
                            </label>
                            <select name="cboEquipo1" id="cboEquipo1" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoTercerCuarto.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo2" class="formulario__label-cbo">
                                <span>Equipo 2</span>
                            </label>
                            <select name="cboEquipo2" id="cboEquipo2" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoTercerCuarto.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:when>    
                    <c:when test="${partido.idFase.id == 4}">
                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo1" class="formulario__label-cbo">
                                <span>Equipo 1</span>
                            </label>
                            <select name="cboEquipo1" id="cboEquipo1" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoFinal.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Grupo: Cbo Equipo -->
                        <div class="formulario__grupo">
                            <label for="cboEquipo2" class="formulario__label-cbo">
                                <span>Equipo 2</span>
                            </label>
                            <select name="cboEquipo2" id="cboEquipo2" class="formulario__input-cbo" required>
                                <!-- Primer op -->
                                <option disabled selected value="0">Seleccione</option>
                                <!--Quitar Options y poner la lista de la BDD -->
                                <c:forEach var="x" items="${listaEquipoFinal.rows}">
                                    <option value="${x.id}">${x.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:when>    
                </c:choose>
                <c:choose>
                    <c:when test="${msjDetallePartido != null}">
                        ${msjDetallePartido}
                    </c:when>
                    <c:otherwise>
                        ${msjErrorDetallePartido} 
                    </c:otherwise>
                </c:choose>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" name="btnAccion" value="AgregarEquipos">Agregar Equipos</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>


            </form>
        </main>
        <!--Incluir el CDN de Sweet alert -->
        <!--<script src="../functions/js/forms/formulario-registro.js"></script> -->    
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
        <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
    </body>

</html>