package it.phrasebook.domain;

import java.math.BigDecimal;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierColumn = "idLibro")
public class Libro {

    @NotNull
    private String titolo;

    @Size(max = 13)
    @Pattern(regexp = "[0-9]{13}")
    private String isbn;

    @Min(0L)
    @Digits(integer = 4, fraction = 2)
    private BigDecimal prezzo;

    @ManyToOne
    @JoinColumn(name = "idEditore", referencedColumnName = "idEditore")
    private Editore editore;
}
