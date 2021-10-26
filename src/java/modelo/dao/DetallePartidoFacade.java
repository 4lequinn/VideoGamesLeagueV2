/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.DetallePartido;

/**
 *
 * @author jorge
 */
@Stateless
public class DetallePartidoFacade extends AbstractFacade<DetallePartido> {

    @PersistenceContext(unitName = "VideoJuegosWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DetallePartidoFacade() {
        super(DetallePartido.class);
    }
    
}
