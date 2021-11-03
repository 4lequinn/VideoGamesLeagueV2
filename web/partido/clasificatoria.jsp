

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="../theme/css/partido/clasificatoria.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.css">
    <!--Importo estilos de la NAVBAR -->
    <%@include file="../includes/links/navbar-link.jsp" %>
</head>
<!-- Incluimos la barra de navegación -->    
<%@include file="../template/navbar.jsp" %>
<body>
    <ul class="tournament">
        <li>
          <ul>
            <li>
              <ul>
                <li>
                  <div class="game">
                    <div>Team 1</div>
                    <div>Team 8</div>
                  </div>
                </li>
                <li>
                  <div class="game">
                    <div>Team 3</div>
                    <div>Team 6</div>
                  </div>
                </li>
              </ul>
              <div class="game">
                <div>Team 1</div>
                <div>Team 3</div>
              </div>
            </li>
            <li>
              <ul>
                <li>
                  <div class="game">
                    <div>Team 4</div>
                    <div>Team 5</div>
                  </div>
                </li>
                <li>
                  <div class="game">
                    <div>Team 2</div>
                    <div>Team 7</div>
                  </div>
                </li>
              </ul>
              <div class="game">
                <div>Team 2</div>
                <div>Team 4</div>
              </div>
            </li>
          </ul>
          <div class="game">
            <div>Team 1</div>
            <div>Team 2</div>
          </div>
          <div class="game" style="margin-top: -2px;">
            <h2 style="font-size: 20px; line-height: 12px;">Ganador</h2>
            <div>Team 1</div>
          </div>
        </li>
      </ul>       

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.pkgd.min.js"></script>

    <%@include file="../includes/scripts/navbar-script.jsp" %>
</body>

</html>