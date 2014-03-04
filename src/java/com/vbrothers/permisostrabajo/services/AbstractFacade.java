package com.vbrothers.permisostrabajo.services;

import com.vi.comun.exceptions.LlaveDuplicadaException;
import com.vbrothers.locator.ServiceLocator;
import javax.persistence.EntityManager;
import org.hibernate.exception.ConstraintViolationException;

/**
 * @author jerviver21 
 */
public abstract class AbstractFacade<T> {
    protected ServiceLocator locator;
    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
        locator = ServiceLocator.getInstance();
    }

    protected abstract EntityManager getEntityManager();

    public void create(T entity) throws LlaveDuplicadaException{
        try {
            getEntityManager().persist(entity);
        } catch (ConstraintViolationException e) {
            throw new LlaveDuplicadaException("El registro ya existe");
        }
    }

    public void edit(T entity) throws LlaveDuplicadaException{
        try {
            System.out.println("-->"+entity+"<--");
            getEntityManager().merge(entity);
        } catch (ConstraintViolationException e) {
            throw new LlaveDuplicadaException("El registro ya existe");
        }
    }

    public void remove(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }

    
    
}
