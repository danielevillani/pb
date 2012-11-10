package it.phrasebook.domain;

import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "idContatto")
public class Contatto {

    @NotNull
    private String cognome;

    private String nome;

    @NotNull
    private String telefono;
}
