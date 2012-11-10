// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package it.phrasebook.domain;

import it.phrasebook.domain.Contatto;
import it.phrasebook.domain.ContattoDataOnDemand;
import it.phrasebook.domain.ContattoIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContattoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ContattoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ContattoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ContattoIntegrationTest: @Transactional;
    
    @Autowired
    private ContattoDataOnDemand ContattoIntegrationTest.dod;
    
    @Test
    public void ContattoIntegrationTest.testCountContattoes() {
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", dod.getRandomContatto());
        long count = Contatto.countContattoes();
        Assert.assertTrue("Counter for 'Contatto' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ContattoIntegrationTest.testFindContatto() {
        Contatto obj = dod.getRandomContatto();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to provide an identifier", id);
        obj = Contatto.findContatto(id);
        Assert.assertNotNull("Find method for 'Contatto' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Contatto' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ContattoIntegrationTest.testFindAllContattoes() {
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", dod.getRandomContatto());
        long count = Contatto.countContattoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Contatto', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Contatto> result = Contatto.findAllContattoes();
        Assert.assertNotNull("Find all method for 'Contatto' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Contatto' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ContattoIntegrationTest.testFindContattoEntries() {
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", dod.getRandomContatto());
        long count = Contatto.countContattoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Contatto> result = Contatto.findContattoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Contatto' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Contatto' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ContattoIntegrationTest.testFlush() {
        Contatto obj = dod.getRandomContatto();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to provide an identifier", id);
        obj = Contatto.findContatto(id);
        Assert.assertNotNull("Find method for 'Contatto' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyContatto(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Contatto' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ContattoIntegrationTest.testMergeUpdate() {
        Contatto obj = dod.getRandomContatto();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to provide an identifier", id);
        obj = Contatto.findContatto(id);
        boolean modified =  dod.modifyContatto(obj);
        Integer currentVersion = obj.getVersion();
        Contatto merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Contatto' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ContattoIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", dod.getRandomContatto());
        Contatto obj = dod.getNewTransientContatto(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Contatto' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Contatto' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Contatto' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ContattoIntegrationTest.testRemove() {
        Contatto obj = dod.getRandomContatto();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Contatto' failed to provide an identifier", id);
        obj = Contatto.findContatto(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Contatto' with identifier '" + id + "'", Contatto.findContatto(id));
    }
    
}