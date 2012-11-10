package it.phrasebook.domain;

import java.math.BigDecimal;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class RichiestaVendita extends Richiesta {

    @Min(0L)
    @Digits(integer = 4, fraction = 2)
    private BigDecimal prezzoCopertina;
}
