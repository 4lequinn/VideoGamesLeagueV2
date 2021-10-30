/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.LigaFacade;

/**
 *
 * @author jorge
 */
public class ControladorLiga extends HttpServlet {

    @EJB
    private LigaFacade ligaFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ligaID = request.getParameter("eliminarLiga");
        if (ligaID != null) {
            eliminarLiga(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
