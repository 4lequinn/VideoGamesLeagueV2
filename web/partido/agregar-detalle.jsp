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
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaEquipos">
    Select id, nombre 
    FROM equipo
    WHERE id_liga = '${partido.idLiga.id}'
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
    <jsp:include page="../template/navbar.jsp"></jsp:include>

        <body>
            <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
            <div class="background-transparencia"></div>
            <main>
                <form action="../ControladorPartido" method="POST" class="formulario" id="formulario">
                    <input hidden value="${partido.id}" name="txtPartidoID">
                    <!--VER ALGUNA FORMA DE VALIDAR QUE AL ELEGIR UN EQUIPO NO APAREZCA EN EL OTRO CBO -->
                    <!-- Grupo: Cbo Equipo -->
                    <div class="formulario__grupo">
                        <label for="cboEquipo1" class="formulario__label-cbo">
                            <span>Equipo 1</span>
                        </label>
                        <select name="cboEquipo1" id="cboEquipo1" class="formulario__input-cbo" required>
                            <!-- Primer op -->
                            <option disabled selected value="0">Seleccione</option>
                            <!--Quitar Options y poner la lista de la BDD -->
                        <c:forEach var="x" items="${listaEquipos.rows}">
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
                        <c:forEach var="x" items="${listaEquipos.rows}">
                            <option value="${x.id}">${x.nombre}</option>
                        </c:forEach>
                    </select>
                </div>

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