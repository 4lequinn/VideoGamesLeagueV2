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
<c:if test="${ sesionUsuario.idTipo.id != 1 }">
    <c:redirect url="../usuario/login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="listaUsuario">
    Select u.usuario, t.descripcion
    FROM usuario u
    INNER JOIN tipo_usuario t on u.id_tipo = t.id
    WHERE u.usuario <> '${sesionUsuario.usuario}'
</sql:query>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuarios</title>
        <link rel="stylesheet" href="../theme/css/liga/panel-ligas-admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Iconos de Material Desing Google-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="panel-admin.jsp"></jsp:include>
            <!-- Nav Agregar Buscar-->
            <nav class="nav-crud">
                <ul class="nav-crud__lista">
                    <li class="nav-crud__item">
                        <a class="nav-crud__item-link nav-crud__item-link-add btn btn-success" href="../usuario/agregar-usuario.jsp"><span class="material-icons nav-crud__item-icon">add</span>Agregar</a>
                    </li>
                    <li class="nav-crud__item">
                        <input class="nav-crud__item-text" type="text" placeholder="Ingrese un ID">
                        <a class="nav-crud__item-link nav-crud__item-link-search btn-warning" href=""><span class="nav-crud__item-icon material-icons">search</span></a>
                    </li>
                </ul>
            </nav>

            <div class="table_responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Tipo Usuario</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                <c:forEach var="x" items="${listaUsuario.rows}">
                    <tbody>
                        <tr>
                            <td>${x.usuario}</td>
                            <td>${x.descripcion}</td>
                            <td>
                                <span class="action_btn ">
                                    <a href="../ControladorUsuario?id=${x.usuario}" class="btn btn-primary material-icons ">edit</a>
                                    <a onclick="eliminarUsuario('${x.usuario}')" class="btn btn-danger material-icons ">delete</a>
                                </span>
                            </td>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../functions/js/forms/alertas.js"></script>
        <jsp:include page="../template/footer.jsp"></jsp:include>
    </body>

</html>