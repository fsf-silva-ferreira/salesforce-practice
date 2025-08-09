/**
 * @description       : Scheduling all processes programmatically.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationScheduler {
    
    public String cronExpression = '0 42 13 ? * *';
    private String jobId;

    public void scheduleConcacaf() {
        ScheduledWebToBaseConcacaf scheduledWebToBaseConcacaf = new ScheduledWebToBaseConcacaf();
        jobId = System.schedule('CONCACAF', cronExpression, scheduledWebToBaseConcacaf);  
        
        System.debug('CONCACAF Job ID: ' + jobId);
    }

    public void scheduleConmebol() {
        ScheduledWebToBaseConmebol scheduledWebToBaseConmebol = new ScheduledWebToBaseConmebol();
        jobId = System.schedule('CONMEBOL', cronExpression, scheduledWebToBaseConmebol);  
        
        System.debug('CONMEBOL Job ID: ' + jobId);
    }

    public void scheduleUefa() {
        ScheduledWebToBaseUefa scheduledWebToBaseUefa = new ScheduledWebToBaseUefa();
        jobId = System.schedule('UEFA', cronExpression, scheduledWebToBaseUefa);  
        
        System.debug('UEFA Job ID: ' + jobId);
    }

    public void scheduleCaf() {
        ScheduledWebToBaseCaf scheduledWebToBaseCaf = new ScheduledWebToBaseCaf();        
        jobId = System.schedule('CAF', cronExpression, scheduledWebToBaseCaf);    

        System.debug('CAF Job ID: ' + jobId);
    }

    public void scheduleAfc() {
        ScheduledWebToBaseAfc scheduledWebToBaseAfc = new ScheduledWebToBaseAfc();        
        jobId = System.schedule('AFC', cronExpression, scheduledWebToBaseAfc);    

        System.debug('AFC Job ID: ' + jobId);
    }

    public void scheduleOfc() {
        ScheduledWebToBaseOfc scheduledWebToBaseOfc = new ScheduledWebToBaseOfc();        
        jobId = System.schedule('OFC', cronExpression, scheduledWebToBaseOfc);    

        System.debug('OFC Job ID: ' + jobId);
    }
}
