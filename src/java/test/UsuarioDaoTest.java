/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import javax.ejb.EJB;
import modelo.dao.UsuarioFacade;
import modelo.dto.TipoUsuario;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
public class UsuarioDaoTest {

    // Por alguna Razón los Test No funcionan
    // Revisar proximamente
    // O en su defecto omitir y Testear con páginas web
    
    @EJB
    private static UsuarioFacade usuarioFacade;

    public static void main(String[] args) {
        TipoUsuario tipo = new TipoUsuario(1);
        Usuario usuario = new Usuario("jorgito", "Wena uwu", tipo);
        usuarioFacade.agregar(usuario);
    }
}
