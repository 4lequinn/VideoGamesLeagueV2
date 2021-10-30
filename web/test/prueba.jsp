<!--Prefijos-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : prueba
    Created on : 12-10-2021, 16:36:13
    Author     : jorge
--%>

<!-- Test de los Facade con JSTL -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Establecemos la conexión a la BD -->
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
        <sql:query dataSource="${dataSource}" var="tipoUsuario">
            Select id, descripcion FROM tipo_usuario
        </sql:query>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../ControladorLiga" method="POST">
            nombre
            <input type="text" id="txtUser" name="nombre">
            cboVideoJuego
            <input type="text" id="txtPass" name="cboVideoJuego">

            <input type="submit" id="btnAccion" name="btnAccion" value="AgregarLiga">
            ${msjErrorEliminar}
        </form>
    </body>
</html>
