/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import modelo.dto.PerfilJugador;
import modelo.dto.Usuario;

/**
 *
 * @author jorge
 */
@Stateless
public class PerfilJugadorFacade extends AbstractFacade<PerfilJugador> {
    
    @PersistenceContext(unitName = "VideoJuegosWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PerfilJugadorFacade() {
        super(PerfilJugador.class);
    }
    
    // Método Customer que me busca el perfil jugador por nombre de Usuario
    // Primer customer
    public PerfilJugador buscarUsuario(String username){
        try {
            return em.createNamedQuery("PerfilJugador.findByUser",PerfilJugador.class)
                    .setParameter("usuario", username).
                    getSingleResult();
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage());
            return null;
        }
    }
    
}
