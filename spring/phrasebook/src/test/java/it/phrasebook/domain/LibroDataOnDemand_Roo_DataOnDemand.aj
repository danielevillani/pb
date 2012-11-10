// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package it.phrasebook.domain;

import it.phrasebook.domain.EditoreDataOnDemand;
import it.phrasebook.domain.Libro;
import it.phrasebook.domain.LibroDataOnDemand;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect LibroDataOnDemand_Roo_DataOnDemand {
    
    declare @type: LibroDataOnDemand: @Component;
    
    private Random LibroDataOnDemand.rnd = new SecureRandom();
    
    private List<Libro> LibroDataOnDemand.data;
    
    @Autowired
    private EditoreDataOnDemand LibroDataOnDemand.editoreDataOnDemand;
    
    public Libro LibroDataOnDemand.getNewTransientLibro(int index) {
        Libro obj = new Libro();
        setIsbn(obj, index);
        setPrezzo(obj, index);
        setTitolo(obj, index);
        return obj;
    }
    
    public void LibroDataOnDemand.setIsbn(Libro obj, int index) {
        String isbn = "isbn_" + index;
        if (isbn.length() > 13) {
            isbn = isbn.substring(0, 13);
        }
        obj.setIsbn(isbn);
    }
    
    public void LibroDataOnDemand.setPrezzo(Libro obj, int index) {
        BigDecimal prezzo = BigDecimal.valueOf(index);
        if (prezzo.compareTo(new BigDecimal("9999.99")) == 1) {
            prezzo = new BigDecimal("9999.99");
        }
        obj.setPrezzo(prezzo);
    }
    
    public void LibroDataOnDemand.setTitolo(Libro obj, int index) {
        String titolo = "titolo_" + index;
        obj.setTitolo(titolo);
    }
    
    public Libro LibroDataOnDemand.getSpecificLibro(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Libro obj = data.get(index);
        Long id = obj.getId();
        return Libro.findLibro(id);
    }
    
    public Libro LibroDataOnDemand.getRandomLibro() {
        init();
        Libro obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Libro.findLibro(id);
    }
    
    public boolean LibroDataOnDemand.modifyLibro(Libro obj) {
        return false;
    }
    
    public void LibroDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Libro.findLibroEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Libro' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Libro>();
        for (int i = 0; i < 10; i++) {
            Libro obj = getNewTransientLibro(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}