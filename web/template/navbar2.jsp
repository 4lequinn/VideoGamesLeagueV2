
<%-- 
    Document   : registro
    Created on : 13-sep-2021, 19:07:19
    Author     : sebas
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="icon" href="static/img/icon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <div class="siderbar">
            <div class="logo_content">
                <div class="logo">
                    <i class='bx bx-game'></i>
                    <div class="logo_name">Next Level</div>
                </div>
                <i class='bx bx-menu' id="btn"></i>
            </div>
            <c:choose>
                <c:when test="${sesionUsuario.idTipo.id == 2 }">
                    <ul class="nav_list">
                        <li>
                            <a href="../index.jsp">
                                <i class='bx bx-grid-alt'></i>
                                <span class="links_name">Inicio</span>
                            </a>
                            <span class="tooltip">Inicio</span>
                        </li>
                        <li>
                            <a href="../liga/panel-ligas.jsp">
                                <i class='bx bx-mouse'></i>
                                <span class="links_name">Liga</span>
                            </a>
                            <span class="tooltip">Liga</span>
                        </li>
                        <li>
                            <a href="../equipo/consultar-solicitud.jsp">
                                <i class='bx bx-search-alt-2'></i>
                                <span class="links_name">Ver Solicitudes</span>
                            </a>
                            <span class="tooltip">Ver Solicitudes</span>
                        </li>       
                        <li>
                            <a href="../equipo/panel-equipos.jsp">
                                <i class='bx bxs-group'></i>
                                <span class="links_name">Equipo</span>
                            </a>
                            <span class="tooltip">Equipo</span>
                        </li>
                        <li>
                            <a href="../usuario/modificar-perfil-usuario.jsp">
                                <i class='bx bxs-id-card'></i>
                                <span class="links_name">Perfil Jugador</span>
                            </a>
                            <span class="tooltip">Perfil Jugador</span>
                        </li>
                    </ul>
                    <div class="profile_content">
                        <div class="profile">
                            <div class="profile_details">
                                <img src="https://s1.best-wallpaper.net/wallpaper/m/2010/Smile-anime-girl-sea-blue-sky-clouds_m.webp" alt="">
                                <div class="name_job">
                                    <div class="name">${sesionUsuario.usuario}</div>
                                    <div class="job">Usuario</div>
                                </div>
                            </div>
                            <a href="ControladorUsuario?logout=true"><i class='bx bx-log-out' id="log_out"></i></a>
                        </div>
                    </div>
                </c:when> 
                <c:when test="${sesionUsuario.idTipo.id ==1 }">
                    <ul class="nav_list">
                        <li>
                            <a href="../index.jsp">
                                <i class='bx bx-grid-alt'></i>
                                <span class="links_name">Inicio</span>
                            </a>
                            <span class="tooltip">Inicio</span>
                        </li>
                        <li>
                            <a href="../liga/panel-ligas.jsp">
                                <i class='bx bx-mouse'></i>
                                <span class="links_name">Liga</span>
                            </a>
                            <span class="tooltip">Liga</span>
                        </li>
                        <li>
                            <a href="../equipo/consultar-solicitud.jsp">
                                <i class='bx bx-search-alt-2'></i>
                                <span class="links_name">Ver Solicitudes</span>
                            </a>
                            <span class="tooltip">Ver Solicitudes</span>
                        </li>       
                        <li>
                            <a href="../equipo/panel-equipos.jsp">
                                <i class='bx bxs-group'></i>
                                <span class="links_name">Equipo</span>
                            </a>
                            <span class="tooltip">Equipo</span>
                        </li>
                        <li>
                            <a href="../usuario/modificar-perfil-usuario.jsp">
                                <i class='bx bxs-id-card'></i>
                                <span class="links_name">Perfil Jugador</span>
                            </a>
                            <span class="tooltip">Perfil Jugador</span>
                        </li>
                        <li>
                            <a href="../admin/panel-usuarios.jsp">
                                <i class='bx bx-lock'></i>
                                <span class="links_name">Panel Admin</span>
                            </a>
                            <span class="tooltip">Panel Admin</span>
                        </li>
                    </ul>
                    <div class="profile_content">
                        <div class="profile">
                            <div class="profile_details">
                                <img src="https://s1.best-wallpaper.net/wallpaper/m/2010/Smile-anime-girl-sea-blue-sky-clouds_m.webp" alt="">
                                <div class="name_job">
                                    <div class="name">${sesionUsuario.usuario}</div>
                                    <div class="job">Administrador</div>
                                </div>
                            </div>
                            <a href="../ControladorUsuario?logout=true"><i class='bx bx-log-out' id="log_out"></i></a>
                        </div>
                    </div>
                </c:when> 
                <c:otherwise>
                    <ul class="nav_list">
                        <li>
                            <a href="../index.jsp">
                                <i class='bx bx-grid-alt'></i>
                                <span class="links_name">Inicio</span>
                            </a>
                            <span class="tooltip">Inicio</span>
                        </li>
                        <li>
                            <a href="../usuario/login.jsp">
                                <i class='bx bx-log-in'></i>
                                <span class="links_name">Iniciar sesión</span>
                            </a>
                            <span class="tooltip">Iniciar sesión</span>
                        </li>
                        <li>
                            <a href="../liga/panel-ligas.jsp">
                                <i class='bx bx-mouse'></i>
                                <span class="links_name">Liga</span>
                            </a>
                            <span class="tooltip">Liga</span>
                        </li>
                    </ul>
                </c:otherwise>
            </c:choose>

        </div>
    </body>

</html>