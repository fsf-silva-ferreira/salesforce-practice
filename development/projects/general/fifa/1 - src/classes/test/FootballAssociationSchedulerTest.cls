/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-15-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class FootballAssociationSchedulerTest {
   
    static testmethod void testSchedulerConcacafConmebolUefa() {
        Test.startTest();

        FootballAssociationScheduler footballAssociationScheduler = new FootballAssociationScheduler();
        String jobId = System.schedule('testSchedulerConcacafConmebolUefa', footballAssociationScheduler.cronExpression, new ScheduledWebToBaseConcacafConmebolUefa());

        CronTrigger cronTrigger = [  
            SELECT 
                Id, CronExpression, TimesTriggered, NextFireTime
            FROM 
                CronTrigger 
            WHERE 
                id = :jobId];

        System.assertEquals(footballAssociationScheduler.cronExpression, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        System.assertEquals('2023-01-15 14:10:00', String.valueOf(cronTrigger.NextFireTime));

        Test.stopTest();
    }

    static testmethod void testSchedulerCafAfcOfc() {
        Test.startTest();

        FootballAssociationScheduler footballAssociationScheduler = new FootballAssociationScheduler();
        String jobId = System.schedule('testSchedulerCafAfcOfc', footballAssociationScheduler.cronExpression, new ScheduledWebToBaseCafAfcOfc());

        CronTrigger cronTrigger = [  
            SELECT 
                Id, CronExpression, TimesTriggered, NextFireTime
            FROM 
                CronTrigger 
            WHERE 
                id = :jobId];

        System.assertEquals(footballAssociationScheduler.cronExpression, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        System.assertEquals('2023-01-15 14:10:00', String.valueOf(cronTrigger.NextFireTime));

        Test.stopTest();
    }
}