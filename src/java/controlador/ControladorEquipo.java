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
import modelo.dto.Equipo;
import modelo.dto.Liga;
import modelo.dto.PerfilJugador;
import modelo.dao.EquipoFacade;

/**
 *
 * @author jorge
 */
public class ControladorEquipo extends HttpServlet {
    @EJB
    private EquipoFacade equipoFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String opcion = request.getParameter("btnAccion");
        if (opcion.equals("RegistrarUsuario")) {
            CrearEquipo(request, response);
        }
    }
    
    protected void CrearEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
             //Campos para crear Equipo
            String nombre = request.getParameter("nombre");
            Liga l = new Liga(Integer.parseInt(request.getParameter("cboLiga")));
            
            //Se busca el perfil de jugador con el usuario encontrado anteriormente
            PerfilJugador p = new PerfilJugador(Integer.SIZE);
            Equipo e = new Equipo(nombre, 1, p, l);
            
            if (equipoFacade.agregar(e)) {
                request.getSession().setAttribute("msOKRegistrarU", "Usuario agregado correctamente");
            } else {
                request.getSession().setAttribute("msNORegistrarU", "El usuario no se ha podido agregar");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("msErrorRegistrarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("usuario/registro.jsp");
        }
    }


    protected void eliminarEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int equipoID = Integer.parseInt(request.getParameter("eliminarEquipo"));
            //Buscamos por ID y eliminamos
            if (equipoFacade.eliminar(equipoFacade.buscar(equipoID))) {
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
            response.sendRedirect("admin/panel-equipos.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String equipoID = request.getParameter("eliminarEquipo");
        if (equipoID != null) {
            eliminarEquipo(request, response);
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
