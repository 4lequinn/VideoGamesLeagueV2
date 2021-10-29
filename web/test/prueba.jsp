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
        <form action="ControladorUsuario">
            User
            <input type="text" id="txtUser" name="txtUser">
            Pass
            <input type="text" id="txtPass" name="txtPass">
            Tipo
            <select id="cboTipo" name="cboTipo">
            <c:forEach var="aux" items="${tipoUsuario.rows}">
                <option value="${aux.id}">${aux.descripcion}</option>
            </c:forEach>
            </select>
            <input type="submit" id="btnAccion" name="btnAccion" value="OK">
        </form>
    </body>
</html>
