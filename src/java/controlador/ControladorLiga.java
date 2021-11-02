/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import modelo.dto.Liga;
=======
import modelo.dao.LigaFacade;
import modelo.dto.Liga;
import modelo.dto.VideoJuego;
>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999

/**
 *
 * @author jorge
 */
public class ControladorLiga extends HttpServlet {

    @EJB
    private LigaFacade ligaFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
<<<<<<< HEAD
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
=======
    }

    protected void eliminarLiga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int ligaID = Integer.parseInt(request.getParameter("eliminarLiga"));
            //Buscamos por ID y eliminamos
            if (ligaFacade.eliminar(ligaFacade.buscar(ligaID))) {
                //Mensaje SUCCESS
                request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
            } else {
                //Mensaje de error
                request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("admin/panel-ligas.jsp");
        }
    }

    protected void agregarLiga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //int ligaID = Integer.parseInt(request.getParameter("eliminarLiga"));
            String nombre = request.getParameter("nombre");
            int videoJuegoID = Integer.parseInt(request.getParameter("cboVideoJuego"));
            VideoJuego videoJuego = new VideoJuego(videoJuegoID);
            Liga liga = new Liga(nombre, videoJuego);
            //Agregamos una liga
            if (ligaFacade.agregar(liga)) {
                //Mensaje SUCCESS
                request.getSession().setAttribute("msjErrorEliminar", "agregó");
            } else {
                //Mensaje de error
                request.getSession().setAttribute("msjErrorEliminar", "else");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("admin/panel-ligas.jsp");
        }
    }

    protected void cargarDatosModificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int ligaID = Integer.parseInt(request.getParameter("id"));
            //Buscamos por ID
            Liga liga = ligaFacade.buscar(ligaID);
            request.getSession().setAttribute("dataLiga", liga);
            request.getSession().setAttribute("dataVideoJuego", liga.getIdJuego().getId());
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("liga/modificar-liga.jsp");
        }
    }

    protected void modificarLiga(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recuperamos la entidad enviada
            Liga liga = ligaFacade.buscar(Integer.parseInt(request.getParameter("txtID")));
            // Sobreescribimos la entidad
            liga.setDescripcion(request.getParameter("nombre"));
            VideoJuego videoJuego = new VideoJuego(Integer.parseInt(request.getParameter("cboVideoJuego")));
            liga.setIdJuego(videoJuego);
            if (ligaFacade.modificar(liga)) {
                request.getSession().setAttribute("msjErrorEliminar", "modificó");
                
            } else {
                //Mensaje de error
                request.getSession().setAttribute("msjErrorEliminar", "else");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", e.getMessage());
            System.out.println("ERRRRORRRR " + e.getMessage());
        } finally {
            // Recargamos la página
            response.sendRedirect("admin/panel-ligas.jsp");
        }
    }

>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ligaID = request.getParameter("eliminarLiga");
        String id = request.getParameter("id"); // Modificar
        if (ligaID != null) {
            eliminarLiga(request, response);
        } else if (id != null) {
            cargarDatosModificar(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("btnAccion");
        System.out.println(opcion);
        if (opcion.equalsIgnoreCase("AgregarLiga")) {
            agregarLiga(request, response);
        } else if (opcion.equalsIgnoreCase("ModificarLiga")) {
            modificarLiga(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
