/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "VideoJuegosWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    // Método que valida el tipo de usuario en la sesión
    public int Loguear(String usuario, String contrasenia) {
        int valida = 0;
        try {
            Usuario user = (Usuario) em.createNamedQuery("Usuario.findByUsuarioAndContrasenia")
                    .setParameter("usuario", usuario).
                    setParameter("contrasenia", contrasenia).getSingleResult();
            valida = user.getIdTipo().getId();
        } catch (Exception ex) {
            System.out.println("ERROR " + ex.getMessage());
        } finally {
            return valida;
        }
    }
}
