/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.Fase;

/**
 *
 * @author jorge
 */
@Stateless
public class FaseFacade extends AbstractFacade<Fase> {

    @PersistenceContext(unitName = "VideoJuegosWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FaseFacade() {
        super(Fase.class);
    }
    
}
