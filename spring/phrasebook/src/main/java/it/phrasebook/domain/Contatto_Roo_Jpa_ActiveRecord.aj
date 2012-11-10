// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package it.phrasebook.domain;

import it.phrasebook.domain.Contatto;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Contatto_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Contatto.entityManager;
    
    public static final EntityManager Contatto.entityManager() {
        EntityManager em = new Contatto().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Contatto.countContattoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Contatto o", Long.class).getSingleResult();
    }
    
    public static List<Contatto> Contatto.findAllContattoes() {
        return entityManager().createQuery("SELECT o FROM Contatto o", Contatto.class).getResultList();
    }
    
    public static Contatto Contatto.findContatto(Long id) {
        if (id == null) return null;
        return entityManager().find(Contatto.class, id);
    }
    
    public static List<Contatto> Contatto.findContattoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Contatto o", Contatto.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Contatto.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Contatto.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Contatto attached = Contatto.findContatto(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Contatto.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Contatto.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Contatto Contatto.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Contatto merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
