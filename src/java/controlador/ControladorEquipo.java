/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
<<<<<<< HEAD
import java.io.PrintWriter;
=======
>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import modelo.dto.Equipo;
import modelo.dto.Liga;
import modelo.dto.PerfilJugador;
=======
>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999
import modelo.dao.EquipoFacade;

/**
 *
 * @author jorge
 */
public class ControladorEquipo extends HttpServlet {
<<<<<<< HEAD

=======
    
>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999
    @EJB
    private EquipoFacade equipoFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
<<<<<<< HEAD
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

>>>>>>> 7e99ef09ce80ead8c4ea0286779b568cf362f999
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
