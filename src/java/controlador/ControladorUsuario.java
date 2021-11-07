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
        if (opcion.equalsIgnoreCase("AgregarUsuario")) {
            agregarUsuario(request, response);
        }
        if (opcion.equalsIgnoreCase("ModificarUsuario")) {
            modificarUsuario(request, response);
        }
        if (opcion.equalsIgnoreCase("ModificarPerfil")) {
            modificarPerfil(request, response);
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
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String habilidad = request.getParameter("habilidad");
            TipoJugador tipoJugador = new TipoJugador(Integer.parseInt(request.getParameter("cboTipoJugador")));
            PerfilJugador perfilJugador = new PerfilJugador(nombre, apellido, correo, habilidad, tipoJugador, usuario);
            if (usuarioFacade.agregar(usuario) && perfilJugadorFacade.agregar(perfilJugador)) {
                request.getSession().setAttribute("msOKRegistrarU", "Usuario registrado correctamente");
            } else {

                request.getSession().setAttribute("msNORegistrarU", "El usuario no se ha podido registrar");
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
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String habilidad = request.getParameter("habilidad");
            TipoJugador tipoJugador = new TipoJugador(Integer.parseInt(request.getParameter("cboTipoJugador")));
            PerfilJugador perfilJugador = new PerfilJugador(nombre, apellido, correo, habilidad, tipoJugador, usuario);
            if (usuarioFacade.agregar(usuario) && perfilJugadorFacade.agregar(perfilJugador)) {
                request.getSession().setAttribute("msOKAgregarU", "Usuario agregado correctamente");
            } else {
                request.getSession().setAttribute("msNOAgregarU", "El usuario no se ha podido agregar");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("msErrorAgregarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("admin/panel-usuarios.jsp");
        }
    }

    //Modificar Usuario Admin
    protected void modificarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("txtUsuario");
            Usuario usuario = usuarioFacade.buscar(user);
            usuario.setContrasenia(request.getParameter("password"));
            TipoUsuario tipoUsuario = new TipoUsuario(Integer.parseInt(request.getParameter("cboTipoUsuario")));
            usuario.setIdTipo(tipoUsuario);
            // Usuario Listo
            PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuario.getUsuario());
            perfil.setHabilidad(request.getParameter("habilidad"));
            perfil.setCorreo(request.getParameter("correo"));
            perfil.setNombre(request.getParameter("nombre"));
            perfil.setApellido(request.getParameter("apellido"));
            // Perfil modificado
            if (usuarioFacade.modificar(usuario) && perfilJugadorFacade.modificar(perfil)) {
                request.getSession().setAttribute("msOKModificarU", "Usuario modificado correctamente");
            } else {
                request.getSession().setAttribute("msNOModificarU", "El usuario no se ha podido modificar");
            }
            request.getSession().setAttribute("sesionUsuario", usuario);
            request.getSession().setAttribute("sesionPerfil", perfil);
        } catch (Exception e) {
            request.getSession().setAttribute("msErrorModificarU", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("admin/panel-usuarios.jsp");
        }
    }

    //Modificar usuario de la sesion 
    protected void modificarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("txtUsuario");
            Usuario usuario = usuarioFacade.buscar(user);
            usuario.setContrasenia(request.getParameter("password"));
            // Usuario Listo
            PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuario.getUsuario());
            perfil.setHabilidad(request.getParameter("habilidad"));
            perfil.setCorreo(request.getParameter("correo"));
            perfil.setNombre(request.getParameter("nombre"));
            perfil.setApellido(request.getParameter("apellido"));
            // Perfil modificado
            if (usuarioFacade.modificar(usuario) && perfilJugadorFacade.modificar(perfil)) {
                request.getSession().setAttribute("msOKModificarPer", "Perfil modificado correctamente");
            } else {
                request.getSession().setAttribute("msNOModificarPer", "El perfil no se ha podido modificar");
            }
            request.getSession().setAttribute("sesionUsuario", usuario);
            request.getSession().setAttribute("sesionPerfil", perfil);
        } catch (Exception e) {
            request.getSession().setAttribute("msErrorModificarPer", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("usuario/modificar-perfil-usuario.jsp");
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
            request.getSession().setAttribute("msErrorCargarDu", "Error:" + e.getMessage());
        } finally {
            response.sendRedirect("usuario/modificar-usuario.jsp");
        }
    }

    protected void Loguear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            if (usuarioFacade.Loguear(user, pass) != 0) {
                Usuario usuario = usuarioFacade.buscar(user);
                PerfilJugador perfil = perfilJugadorFacade.buscarUsuario(usuario.getUsuario());
                request.getSession().setAttribute("sesionUsuario", usuario);
                request.getSession().setAttribute("sesionPerfil", perfil);
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("usuario/login.jsp");
            }

        } catch (Exception e) {

        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getSession().removeAttribute("sesionUsuario");
        } catch (Exception e) {
        } finally {
            response.sendRedirect("index.jsp");
        }
    }

    protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String usuarioID = request.getParameter("eliminarUsuario");
            Usuario usuario = usuarioFacade.buscar(usuarioID);
            // Al eliminar con JPA la entidad se elimina en cascada
            //Buscamos por ID y eliminamos
            if (usuarioFacade.eliminar(usuario)) {
                //Mensaje SUCCESS
                request.getSession().setAttribute("msOKEliminarU", "Se ha eliminado el usuario");
            } else {
                //Mensaje de error
                request.getSession().setAttribute("msNOEliminarU", "No se ha podido eliminar el usuario");
            }
        } catch (Exception e) {
            //Error
            request.getSession().setAttribute("msErrorEliminarU", "Error"+ e.getMessage());
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
        String logout = request.getParameter("logout");
        if (usuarioID != null) {
            eliminarUsuario(request, response);
        } else if (username != null) {
            cargarDatosUsuario(request, response);
        } else if (logout != null) {
            logout(request, response);
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
