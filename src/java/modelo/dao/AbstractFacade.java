/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jorge
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected abstract EntityManager getEntityManager();

    // Método para agregar una entidad
    // Replace create - agregar
    public void agregar(T entity) {
        getEntityManager().persist(entity);
    }
    
    // Método para modificar una entidad
    // Replace edit - modificar
    public void modificar(T entity) {
        getEntityManager().merge(entity);
    }

    // Método para eliminar una entidad
    // Replace remove - eliminar
    public void eliminar(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }
    
    // Método para buscar una entidad por ID
    // Replace find - buscar
    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    // Método para listar las entidades
    // Replace findAll - listar
    public List<T> listar() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }
    
    // Método para filtar por un rango una entidad
    // Replace findRange - filtarRango
    public List<T> filtrarRango(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        q.setMaxResults(range[1] - range[0] + 1);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }
    
    // Método para contar las entidades
    // Replace count - cantidad
    public int cantidad() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<T> rt = cq.from(entityClass);
        cq.select(getEntityManager().getCriteriaBuilder().count(rt));
        javax.persistence.Query q = getEntityManager().createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }
    
}
