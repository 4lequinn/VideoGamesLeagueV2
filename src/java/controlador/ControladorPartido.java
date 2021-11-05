/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.DetallePartidoFacade;
import modelo.dao.PartidoFacade;
import modelo.dto.DetallePartido;
import modelo.dto.Equipo;
import modelo.dto.Fase;
import modelo.dto.Liga;
import modelo.dto.Partido;
import modelo.dto.Resultado;

/**
 *
 * @author joaco
 */
@WebServlet(name = "ControladorPartido", urlPatterns = {"/ControladorPartido"})
public class ControladorPartido extends HttpServlet {

    @EJB
    private PartidoFacade partidoFacade;

    @EJB
    private DetallePartidoFacade detallePartidoFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("btnAccion");
        if (opcion.equals("CrearPartido")) {
            CrearPartido(request, response);
        } else if (opcion.equalsIgnoreCase("AgregarEquipos")) {
            agregarEquipo(request, response);
        }

    }

    protected void CrearPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fecha = request.getParameter("fecha");
            String hora_inicio = request.getParameter("hora_inicio");
            String hora_termino = request.getParameter("hora_termino");
            Fase tipoFase = new Fase(Integer.parseInt(request.getParameter("cboFase")));
            Liga tipoLiga = new Liga(Integer.parseInt(request.getParameter("cboLiga")));
            Partido par = new Partido(fecha, hora_inicio, hora_termino, tipoFase, tipoLiga);
            if (partidoFacade.agregar(par)) {
                request.getSession().setAttribute("msOKRegistrarP", "Partido creado correctamente");
            } else {
                request.getSession().setAttribute("msNORegistrarP", "El partido no se ha podido crear");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msErrorRegistrarP", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("partido/agregar-partido.jsp");
        }

    }

    protected void cargarPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("partidoID"));
            Partido partido = partidoFacade.buscar(id);
            request.getSession().setAttribute("partido", partido);
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage());
        } finally {
            response.sendRedirect("partido/agregar-detalle.jsp");
        }
    }

    protected void cargarPartido2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id_partido"));
            // Llamamos al CUSTOMER que me trae el detalle del partido (2 EQUIPOS)
            List<DetallePartido> listaDetalle = detallePartidoFacade.buscarDetallePorPartidoID(id);
            // Recuperamos ambos detalles
            DetallePartido detalle1 = listaDetalle.get(0);
            DetallePartido detalle2 = listaDetalle.get(1);
            // Cargamos los detalles en la ventana para definir al ganador
            request.getSession().setAttribute("detalle1", detalle1);
            request.getSession().setAttribute("detalle2", detalle2);
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage());
        } finally {
            response.sendRedirect("partido/elegir-ganador.jsp");
        }
    }

    protected void agregarEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Resultado resultado = new Resultado(1); // Definimos el resultado como PENDIENTE
            int partidoID = Integer.parseInt(request.getParameter("txtPartidoID"));
            int equipo1ID = Integer.parseInt(request.getParameter("cboEquipo1"));
            int equipo2ID = Integer.parseInt(request.getParameter("cboEquipo2"));
            Partido partido = new Partido(partidoID); // Asignamos el partido
            Equipo equipo1 = new Equipo(equipo1ID);
            Equipo equipo2 = new Equipo(equipo2ID);
            // Insertamos 2 detalles para completar el partido
            // EQUIPO 1
            DetallePartido detalle1 = new DetallePartido(equipo1, resultado, partido);
            //EQUIPO 2
            DetallePartido detalle2 = new DetallePartido(equipo2, resultado, partido);
            if (detallePartidoFacade.agregar(detalle1) && detallePartidoFacade.agregar(detalle2)) {
                // Se agregan los 2 equipos al partido
            } else {
                //No se pudo agregar
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        } finally {
            response.sendRedirect("admin/panel-partidos.jsp");
        }
    }

    protected void elegirGanador(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Resultado rGanador = new Resultado(2);
            Resultado rPerdedor = new Resultado(3);
            int detallePartido = Integer.parseInt(request.getParameter("detallePartido"));
            int equipoGanador = Integer.parseInt(request.getParameter("ganadorEquipo"));
            int equipoPerdedor = Integer.parseInt(request.getParameter("perdedorEquipo"));
            // Buscamos el detalle del partido por el ID PARTIDO
            // EL EQUIPO ELEGIDO COMO GANADOR ACTUALIZARÁ SU ESTADO DE PENDIENTE A GANADOR
            DetallePartido ganador = detallePartidoFacade.buscarDetallePorPartido2(detallePartido, equipoGanador);
            ganador.setIdResultado(rGanador);
            // EL EQUIPO ELEGIDO COMO PERDEDOR ACTUALIZARÁ SU ESTADO DE PENDIENTE A PERDEDOR
            DetallePartido perdedor = detallePartidoFacade.buscarDetallePorPartido2(detallePartido, equipoPerdedor);
            perdedor.setIdResultado(rPerdedor);
            if(detallePartidoFacade.modificar(ganador) && detallePartidoFacade.modificar(perdedor)){
                System.out.println("MAKINOLA MASTER DE LOS MASTERS");
            }else{
                System.out.println("ERROR PERUANO");
            }
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage());
        } finally {
            response.sendRedirect("admin/panel-partidos.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eliminarID = request.getParameter("eliminarPartido");
        String modificarID = request.getParameter("id");
        String detalleID = request.getParameter("partidoID");
        String eleccion = request.getParameter("id_partido");
        String detallePartido = request.getParameter("detallePartido");
        String equipoGanador = request.getParameter("ganadorEquipo");
        String equipoPerdedor = request.getParameter("perdedorEquipo");

        if (eliminarID != null) {

        } else if (modificarID != null) {

        } else if (detalleID != null) {
            cargarPartido(request, response);
        } else if (eleccion != null) {
            cargarPartido2(request, response);
        } else if (detallePartido != null && equipoGanador != null && equipoPerdedor != null) {
            elegirGanador(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
