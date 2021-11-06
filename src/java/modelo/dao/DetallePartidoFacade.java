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

    // Método CUSTOMER que busca los 2 detalle del partido por ID PARTIDO
    public List<DetallePartido> buscarDetallePorPartidoID(int partidoID) {
        List<DetallePartido> listaDetalle = null;
        try {
            listaDetalle = (List<DetallePartido>) em.createNamedQuery("DetallePartido.findByPartidoID")
                    .setParameter("partidoID", partidoID)
                    .getResultList();
        } catch (Exception e) {
            System.out.println("ERROR AL BUSCAR DETALLE" + e.getMessage());
        }
        return listaDetalle;
    }

    // Método CUSTOMER que busca un detalle del partido por ID PARTIDO y ID EQUIPO
    public DetallePartido buscarDetallePorPartido2(int partidoID, int equipoID) {
        DetallePartido detalle = null;
        try {
            detalle = (DetallePartido) em.createNamedQuery("DetallePartido.findByPartidoIDandEquipoID")
                    .setParameter("partidoID", partidoID).setParameter("equipoID", equipoID)
                    .getSingleResult();
        } catch (Exception e) {
            System.out.println("ERROR AL BUSCAR DETALLE" + e.getMessage());
        }
        return detalle;
    }

}
