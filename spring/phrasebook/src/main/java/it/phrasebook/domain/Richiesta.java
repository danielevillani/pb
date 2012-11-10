package it.phrasebook.domain;

import java.util.Date;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "idRichiesta", inheritanceType = "SINGLE_TABLE")
public abstract class Richiesta {

    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "S-")
    private Date dataRichiesta;

    private String note;

    @NotNull
    @Enumerated(EnumType.STRING)
    private TipoRichiesta tipoRichiesta;
}
