// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package it.phrasebook.domain;

import it.phrasebook.domain.Richiesta;
import it.phrasebook.domain.TipoRichiesta;
import java.util.Date;

privileged aspect Richiesta_Roo_JavaBean {
    
    public Date Richiesta.getDataRichiesta() {
        return this.dataRichiesta;
    }
    
    public void Richiesta.setDataRichiesta(Date dataRichiesta) {
        this.dataRichiesta = dataRichiesta;
    }
    
    public String Richiesta.getNote() {
        return this.note;
    }
    
    public void Richiesta.setNote(String note) {
        this.note = note;
    }
    
    public TipoRichiesta Richiesta.getTipoRichiesta() {
        return this.tipoRichiesta;
    }
    
    public void Richiesta.setTipoRichiesta(TipoRichiesta tipoRichiesta) {
        this.tipoRichiesta = tipoRichiesta;
    }
    
}
