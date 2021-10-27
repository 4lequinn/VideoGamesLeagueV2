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
import modelo.dao.UsuarioFacade;
import modelo.dto.TipoUsuario;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
public class ControladorUsuario extends HttpServlet {
    
    @EJB
    private UsuarioFacade usuarioFacade;
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
        String opcion=request.getParameter("btnAccion");
         if( opcion.equals("RegistrarUsuario")){
             RegistrarUsuario(request,response);
         }
         
//        String user = request.getParameter("txtUser");
//        String pass = request.getParameter("txtPass");
//        int tipo = Integer.parseInt(request.getParameter("cboTipo"));
//        TipoUsuario tipoUsuario = new TipoUsuario(tipo);
//        Usuario usuario = new Usuario(user, pass, tipoUsuario);
//        // Agregar 
//        usuarioFacade.agregar(usuario);
        // Eliminar
        //usuarioFacade.eliminar(usuario);
        // Buscar y Modificar
//        usuario = usuarioFacade.find(user);
//        usuario.setUsuario(user);
//        usuario.setContrasenia(pass);
//        usuario.setIdTipo(tipoUsuario);
//        usuarioFacade.modificar(usuario);
    }
    
    
    protected void RegistrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try{
            String user = request.getParameter("usuario");
            String pass = request.getParameter("password");
            TipoUsuario tipoUsuario = new TipoUsuario(2);
            Usuario usuario = new Usuario(user, pass, tipoUsuario);
            usuarioFacade.agregar(usuario);
            request.getSession().setAttribute("msOK","Usuario agregado correctamente");

       }catch(Exception e){
            request.getSession().setAttribute("msNO","Error:"+e.getMessage());
            }finally{
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
