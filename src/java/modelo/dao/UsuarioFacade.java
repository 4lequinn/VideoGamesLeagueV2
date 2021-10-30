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

    public boolean Loguear(String usuario, String contrasenia) {
        // Te recomiendo que el loguear retorne un int, para saber el tipo de usuario o algo así
        try {
            Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.usuario = :usuario AND u.contrasenia = contrasenia");
            query.setParameter("usuario", usuario);
            query.setParameter("contrasenia", contrasenia);
            if (query.getResultList().get(0) != null) {
                return true;
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }
}
