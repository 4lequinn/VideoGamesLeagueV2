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
import modelo.dao.EstadoSolicitudFacade;
import modelo.dao.IncripcionFacade;
import modelo.dao.PerfilJugadorFacade;
import modelo.dao.UsuarioFacade;
import modelo.dto.EstadoSolicitud;
import modelo.dto.Incripcion;
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

    @EJB
    private IncripcionFacade inscripcionFacade;
    
    @EJB
    private EstadoSolicitudFacade estadoFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("btnAccion");
        if (opcion.equals("CrearEquipo")) {
            crearEquipo(request, response);
        }
        if (opcion.equals("")) {
            eliminarEquipo(request, response);
        }
        if (opcion.equals("ModificarEquipo")) {
            modificarEquipo(request, response);
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
            Equipo e = new Equipo(nombre,1, perfil, liga);
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
    
    protected void modificarEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Equipo equipo = equipoFacade.buscar(Integer.parseInt(request.getParameter("txtID")));
            equipo.setNombre(request.getParameter("nombre"));
            Liga liga = new Liga(Integer.parseInt(request.getParameter("cboLiga")));
            equipo.setIdLiga(liga);
            if (equipoFacade.modificar(equipo)) {
                request.getSession().setAttribute("msOKRegistrarU", "Equipo modificado correctamente");
            } else {
                request.getSession().setAttribute("msNORegistrarU", "El equipo no se ha podido modificar");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("msErrorRegistrarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("admin/panel-equipos.jsp");
        }
    }
    
    protected void aceptar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Buscamos por ID y eliminamos
            Incripcion incripcion  = inscripcionFacade.buscar(Integer.parseInt(request.getParameter("cambiarEstadoAceptado")));
            EstadoSolicitud estado = new EstadoSolicitud(3);
            incripcion.setIdEstado(estado);
            if (inscripcionFacade.modificar(incripcion)) {
                request.getSession().setAttribute("msOKRegistrarU", "Se aceptado la solicitud");
            }  else {
                request.getSession().setAttribute("msNORegistrarU", "No se ha podido aceptado la solicitud");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("equipo/consultar-solicitud.jsp");
        }
    }
    
    protected void rechazar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Buscamos por ID y eliminamos
            Incripcion incripcion  = inscripcionFacade.buscar(Integer.parseInt(request.getParameter("cambiarEstadoRechazado")));
            EstadoSolicitud estado = new EstadoSolicitud(2);
            incripcion.setIdEstado(estado);
            if (inscripcionFacade.modificar(incripcion)) {
                request.getSession().setAttribute("msOKRegistrarU", "Se rechazado la solicitud");
            }  else {
                request.getSession().setAttribute("msNORegistrarU", "No se ha rechazado la solicitud");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("equipo/consultar-solicitud.jsp");
        }
    }
    
    protected void cargarDatosModificar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int equipoID = Integer.parseInt(request.getParameter("id"));
            //Buscamos por ID
            Equipo equipo = equipoFacade.buscar(equipoID);
            request.getSession().setAttribute("dataEquipo", equipo);
            request.getSession().setAttribute("dataLiga", equipo.getIdLiga().getId());
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("equipo/modificar-equipo.jsp");
        }
    }

    protected void eliminarEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int equipoID = Integer.parseInt(request.getParameter("eliminarEquipo"));
            //Buscamos por ID y eliminamos
            if (equipoFacade.eliminar(equipoFacade.buscar(equipoID))) {
                //Mensaje SUCCESS
                request.getSession().setAttribute("msjErrorEliminar", "Se ha eliminado el equipo");
            } else {
                //Mensaje de error
                request.getSession().setAttribute("msjErrorEliminar", "No se ha podido eliminado el equipo");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msjErrorEliminar", "Errorsito");
        } finally {
            // Recargamos la página
            response.sendRedirect("admin/panel-equipos.jsp");
        }
    }

    protected void agregarInscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id_equipo = Integer.parseInt(request.getParameter("equipoID"));
            int id_perfil = Integer.parseInt(request.getParameter("perfilID"));
            // Creamos un perfil de jugador
            PerfilJugador perfil = perfilJugadorFacade.buscar(id_perfil);
            // Creamos un equipo 
            Equipo equipo = equipoFacade.buscar(id_equipo);
            // Creamos un estado de solicitud
            EstadoSolicitud estado = estadoFacade.buscar(1);
            System.out.println("ESTADO " + estado.getDescripcion());
            Incripcion inscripcion = new Incripcion(perfil, estado, equipo);
            if (inscripcionFacade.agregar(inscripcion)) {
                //Mensaje SUCCESS
                request.getSession().setAttribute("msjAgregarInscripcion", "¡Agregado!");
            } else {
                request.getSession().setAttribute("msjNoAgregarInscripcion", "¡No agregado!");
            }
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage());
            request.getSession().setAttribute("msjErrorInscripcion", "Errorsito");
        } finally {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String equipoID = request.getParameter("eliminarEquipo");
        String id_equipo = request.getParameter("equipoID");
        String id_perfil = request.getParameter("perfilID");
        String incripcionIDAceptar = request.getParameter("cambiarEstadoAceptado");
        String incripcionIDRechazar = request.getParameter("cambiarEstadoRechazado");
        String id = request.getParameter("id");
        if (equipoID != null) {
            eliminarEquipo(request, response);
        }else if (id != null) {
            cargarDatosModificar(request, response);
        } else if (id_equipo != null && id_perfil != null) {
            agregarInscripcion(request, response);
        }else if (incripcionIDAceptar != null) {
            aceptar(request, response);
        }else if (incripcionIDRechazar != null) {
            rechazar(request, response);
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
