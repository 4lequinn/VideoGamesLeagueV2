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
import modelo.dao.PerfilJugadorFacade;
import modelo.dao.UsuarioFacade;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
public class ControladorEquipo extends HttpServlet {
    @EJB
    private EquipoFacade equipoFacade;
    
     @EJB
    private UsuarioFacade usuarioFacade;
    
     @EJB
    private PerfilJugadorFacade perfilJugadorFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String opcion = request.getParameter("btnAccion");
        if (opcion.equals("CrearEquipo")) {
            crearEquipo(request, response);
        }
        if (opcion.equals("")) {
            eliminarEquipo(request, response);
        }
    }
    
    protected void crearEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("txtUsuario");
            Usuario usuario = usuarioFacade.buscar(user);
            //Se busca el perfil de jugador con el usuario encontrado anteriormente
            PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuario.getUsuario());
             //Campos para crear Equipo
            String nombre = request.getParameter("nombre");
            Liga liga = new Liga(Integer.parseInt(request.getParameter("cboLiga")));
            Equipo e = new Equipo(nombre, perfil, liga);
            System.out.println(e.getNombre()+e.getCantidadJugador()+e.getIdLiga()+e.getIdPerfil());
            if (equipoFacade.agregar(e)) {
                request.getSession().setAttribute("msOKRegistrarU", "Equipo creado correctamente");
            } else {
                request.getSession().setAttribute("msNORegistrarU", "El equipo no se ha podido agregar");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("msErrorRegistrarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("equipo/agregar-equipo.jsp");
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
