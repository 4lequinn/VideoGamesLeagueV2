

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
    <%@include file="../template/navbar2.jsp" %>
    <body>
        <div class="container">
            <h1>Video Juego</h1>
            <h2>[Liga correspondiente]</h2>
            <div class="tournament-bracket tournament-bracket--rounded">                                                     
                <div class="tournament-bracket__round tournament-bracket__round--quarterfinals">
                    <h3 class="tournament-bracket__round-title">Cuartos de Final</h3>
                    <ul class="tournament-bracket__list">
                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-18">18 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Canada">CAN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ca" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">4</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Kazakhstan">KAZ</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-kz" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>

                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-18">18 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Czech Republic">CZE</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-cz" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">4</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Unitede states of America">USA</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-us" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-18">18 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Finland">FIN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-fi" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">2</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Sweden">SVE</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-se" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>

                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-18">18 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Russia">RUS</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ru" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">4</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Belarus">BEL</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-by" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="tournament-bracket__round tournament-bracket__round--semifinals">
                    <h3 class="tournament-bracket__round-title">Semi Final</h3>
                    <ul class="tournament-bracket__list">
                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-20">20 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Canada">CAN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ca" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Czech Republic">CZE</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-cz" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">2</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>

                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-20">20 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Finland">FIN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-fi" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">4</span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Russia">RUS</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ru" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">7</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="tournament-bracket__round tournament-bracket__round--bronze">
                    <h3 class="tournament-bracket__round-title">Bronce y Plata</h3>
                    <ul class="tournament-bracket__list">
                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-21">21 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Finland">FIN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-fi" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">3</span>
                                                <span class="tournament-bracket__medal tournament-bracket__medal--bronze fa fa-trophy" aria-label="Bronze medal"></span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Canada">CAN</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ca" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">2</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="tournament-bracket__round tournament-bracket__round--gold">
                    <h3 class="tournament-bracket__round-title">Ganador de Oro</h3>
                    <ul class="tournament-bracket__list">
                        <li class="tournament-bracket__item">
                            <div class="tournament-bracket__match" tabindex="0">
                                <table class="tournament-bracket__table">
                                    <caption class="tournament-bracket__caption">
                                        <time datetime="1998-02-22">22 February 1998</time>
                                    </caption>
                                    <thead class="sr-only">
                                        <tr>
                                            <th>Country</th>
                                            <th>Score</th>
                                        </tr>
                                    </thead>  
                                    <tbody class="tournament-bracket__content">
                                        <tr class="tournament-bracket__team tournament-bracket__team--winner">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Czech Republic">CZE</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-cz" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">1</span>
                                                <span class="tournament-bracket__medal tournament-bracket__medal--gold fa fa-trophy" aria-label="Gold medal"></span>
                                            </td>
                                        </tr>
                                        <tr class="tournament-bracket__team">
                                            <td class="tournament-bracket__country">
                                                <abbr class="tournament-bracket__code" title="Russia">RUS</abbr>
                                                <span class="tournament-bracket__flag flag-icon flag-icon-ru" aria-label="Flag"></span>
                                            </td>
                                            <td class="tournament-bracket__score">
                                                <span class="tournament-bracket__number">0</span>
                                                <span class="tournament-bracket__medal tournament-bracket__medal--silver fa fa-trophy" aria-label="Silver medal"></span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flickity/2.2.1/flickity.pkgd.min.js"></script>

        <%@include file="../includes/scripts/navbar-script.jsp" %>
    </body>

</html>