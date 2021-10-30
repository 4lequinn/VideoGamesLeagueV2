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
import modelo.dao.PerfilJugadorFacade;
import modelo.dao.UsuarioFacade;
import modelo.dto.PerfilJugador;
import modelo.dto.TipoJugador;
import modelo.dto.TipoUsuario;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
public class ControladorUsuario extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private PerfilJugadorFacade perfilJugadorFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion = request.getParameter("btnAccion");
        if (opcion.equals("RegistrarUsuario")) {
            RegistrarUsuario(request, response);
        }
        if (opcion.equals("Loguear")) {
            Loguear(request, response);
        }
        if (opcion.equals("AgregarUsuario")) {
            agregarUsuario(request, response);
        }

    }

    protected void RegistrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            TipoUsuario tipoUsuario = new TipoUsuario(2);
            Usuario usuario = new Usuario(user, pass, tipoUsuario);
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String habilidad = request.getParameter("habilidad");
            TipoJugador tipoJugador = new TipoJugador(1);
            PerfilJugador perfilJugador = new PerfilJugador(nombre, correo, habilidad, tipoJugador, usuario);
            if (usuarioFacade.agregar(usuario) && perfilJugadorFacade.agregar(perfilJugador)) {
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

    protected void agregarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            TipoUsuario tipoUsuario = new TipoUsuario(Integer.parseInt(request.getParameter("cboTipoUsuario")));
            Usuario usuario = new Usuario(user, pass, tipoUsuario);
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String habilidad = request.getParameter("habilidad");
            TipoJugador tipoJugador = new TipoJugador(1);
            PerfilJugador perfilJugador = new PerfilJugador(nombre, correo, habilidad, tipoJugador, usuario);
            if (usuarioFacade.agregar(usuario) && perfilJugadorFacade.agregar(perfilJugador)) {
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

    protected void modificarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            TipoUsuario tipoUsuario = new TipoUsuario(Integer.parseInt(request.getParameter("cboTipoUsuario")));
            Usuario usuario = new Usuario(user, pass, tipoUsuario);
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String habilidad = request.getParameter("habilidad");
            TipoJugador tipoJugador = new TipoJugador(1);
            PerfilJugador perfilJugador = new PerfilJugador(nombre, correo, habilidad, tipoJugador, usuario);
            if (usuarioFacade.agregar(usuario) && perfilJugadorFacade.agregar(perfilJugador)) {
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

    protected void cargarDatosUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("id");
            Usuario usuario = usuarioFacade.buscar(user);
            PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuario.getUsuario());
            request.getSession().setAttribute("usuario", usuario);
            request.getSession().setAttribute("perfil", perfil);
        } catch (Exception e) {
            System.out.println("FFFFFFFFFFFFFFFFF" + e.getMessage());
            request.getSession().setAttribute("msErrorRegistrarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("usuario/modificar-usuario.jsp");
        }
    }

    protected void Loguear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            if (usuarioFacade.Loguear(user, pass)) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("prueba.jsp");
            }

        } catch (Exception e) {

        }
    }

    protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String usuarioID = request.getParameter("eliminarUsuario");
            Usuario usuario = usuarioFacade.buscar(usuarioID);
            PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuarioID);
            //Buscamos por ID y eliminamos
            if (usuarioFacade.eliminar(usuario) && perfilJugadorFacade.eliminar(perfil)) {
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
            response.sendRedirect("admin/panel-usuarios.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuarioID = request.getParameter("eliminarUsuario");
        String username = request.getParameter("id");
        if (usuarioID != null) {
            eliminarUsuario(request, response);
        } else if (username != null) {
            cargarDatosUsuario(request, response);
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
