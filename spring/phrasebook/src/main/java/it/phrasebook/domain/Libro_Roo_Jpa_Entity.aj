// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package it.phrasebook.domain;

import it.phrasebook.domain.Libro;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Libro_Roo_Jpa_Entity {
    
    declare @type: Libro: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idLibro")
    private Long Libro.id;
    
    @Version
    @Column(name = "version")
    private Integer Libro.version;
    
    public Long Libro.getId() {
        return this.id;
    }
    
    public void Libro.setId(Long id) {
        this.id = id;
    }
    
    public Integer Libro.getVersion() {
        return this.version;
    }
    
    public void Libro.setVersion(Integer version) {
        this.version = version;
    }
    
}