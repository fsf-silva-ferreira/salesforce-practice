/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationScheduler {
    
    public String cronExpression = '0 10 14 ? * *';
    private String jobId;

    public void scheduleConcacafConmebolUefa() {
        ScheduledWebToBaseConcacafConmebolUefa scheduledWebToBaseConcacafConmebolUefa = new ScheduledWebToBaseConcacafConmebolUefa();
        jobId = System.schedule('CONCACAF-CONMEBOL-UEFA', cronExpression, scheduledWebToBaseConcacafConmebolUefa);  
        
        System.debug('CONCACAF-CONMEBOL-UEFA Job ID: ' + jobId);
    }

    public void scheduleCafAfcOfc() {
        ScheduledWebToBaseCafAfcOfc scheduledWebToBaseCafAfcOfc = new ScheduledWebToBaseCafAfcOfc();        
        jobId = System.schedule('CAF-AFC-OFC', cronExpression, scheduledWebToBaseCafAfcOfc);    

        System.debug('CAF-AFC-OFC Job ID: ' + jobId);
    }

    public void scheduleTest() {
        ScheduledTest scheduledTest = new ScheduledTest();       
        jobId = System.schedule('SCHEDULED TEST', cronExpression, scheduledTest);    

        System.debug('SCHEDULED TEST Job ID: ' + jobId);
    }
}
