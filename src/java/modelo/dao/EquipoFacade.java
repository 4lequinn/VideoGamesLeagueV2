/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import modelo.dto.Equipo;

/**
 *
 * @author jorge
 */
@Stateless
public class EquipoFacade extends AbstractFacade<Equipo> {

    @PersistenceContext(unitName = "VideoJuegosWebPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EquipoFacade() {
        super(Equipo.class);
    }

    // Customer que retorna la lista de equipos según su liga
    public List<Equipo> listarEquipoCuartos(int idLiga) {
        try {
            return em.createNamedQuery("Equipo.findByLiga").setParameter("idLiga", idLiga).getResultList();
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
            return null;
        }
    }

    // Customer que retorna a los equipos que pasan a semifinales
    public List<Equipo> listarEquipoSemis(int idLiga) {
        try {
            return em.createNamedQuery("Equipo.findSemis").setParameter("idLiga", idLiga).getResultList();
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
            return null;
        }
    }
    // Customer que retorna a los equipos que perdieron las semis (3er y 4to)

    // Customer que retorna a los equipos que ganaron las semis (FINAL)
}
