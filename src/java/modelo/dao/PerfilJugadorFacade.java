/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.PerfilJugador;

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
    
}
