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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.PartidoFacade;
import modelo.dto.Fase;
import modelo.dto.Liga;
import modelo.dto.Partido;

/**
 *
 * @author joaco
 */
@WebServlet(name = "ControladorPartido", urlPatterns = {"/ControladorPartido"})
public class ControladorPartido extends HttpServlet {
    @EJB
    private PartidoFacade partidoFacade;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String opcion = request.getParameter("btnAccion");
        if (opcion.equals("CrearPartido")) {
            CrearPartido(request, response);
        }
        }
    
     protected void CrearPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fecha=request.getParameter("fecha");
            String hora_inicio= request.getParameter("hora_inicio");
            String hora_termino= request.getParameter("hora_termino");
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
