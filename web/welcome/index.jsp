<%-- 
    Document   : prueba
    Created on : 07-10-2021, 14:32:53
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="theme/css/template/inicio.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.css">
    <!--Importo estilos de la NAVBAR -->
    <%@include file="../includes/links/navbar-link.jsp" %>
</head>
<!-- Incluimos la barra de navegación -->    
<%@include file="../template/navbar.jsp" %>
<body>

    <div class="hero-slider" data-carousel>
        <div class="carousel-cell" style="background-image: url(theme/img/inicio/league-of-legends.png);">
            <div class="overlay"></div>
            <div class="inner">
                <h3 class="subtitle">MOBA BATTLE ARENA</h3>
                <h2 class="title">League of Legends</h2>
                <a href="#" class="btn">Ver Más</a>
            </div>
        </div>

        <div class="carousel-cell" style="background-image: url(theme/img/inicio/csgo.png);">
            <div class="overlay"></div>
            <div class="inner">
                <h3 class="subtitle">SHOOTER</h3>
                <h2 class="title">Counter Strike Global Offensive</h2>
                <a href="#" class="btn">Ver Más¡s</a>
            </div>
        </div>

        <div class="carousel-cell" style="background-image: url(theme/img/inicio/fifa22.png);">
            <div class="overlay"></div>
            <div class="inner">
                <h3 class="subtitle">EA SPORTS</h3>
                <h2 class="title">FIFA 22</h2>
                <a href="#" class="btn">Ver Más</a>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.pkgd.min.js"></script>
    <script type="text/javascript" src="functions/js/inicio/carrusel.js"></script>

    <%@include file="../includes/scripts/navbar-script.jsp" %>
</body>

</html>