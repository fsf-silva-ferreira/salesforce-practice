/**
 * @description       : Test class for scheduling processes.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class FootballAssociationSchedulerTest {
   
    static testmethod void testSchedulerConcacaf() {
        Test.startTest();

        FootballAssociationScheduler footballAssociationScheduler = new FootballAssociationScheduler();
        String jobId = System.schedule('testSchedulerConcacaf', footballAssociationScheduler.cronExpression, new ScheduledWebToBaseConcacaf());

        CronTrigger cronTrigger = [  
            SELECT 
                Id, CronExpression, TimesTriggered, NextFireTime
            FROM 
                CronTrigger 
            WHERE 
                id = :jobId];

        System.assertEquals(footballAssociationScheduler.cronExpression, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        System.assertEquals('2023-01-16 13:42:00', String.valueOf(cronTrigger.NextFireTime));

        Test.stopTest();
    }

    static testmethod void testSchedulerCaf() {
        Test.startTest();

        FootballAssociationScheduler footballAssociationScheduler = new FootballAssociationScheduler();
        String jobId = System.schedule('testSchedulerCaf', footballAssociationScheduler.cronExpression, new ScheduledWebToBaseCaf());

        CronTrigger cronTrigger = [  
            SELECT 
                Id, CronExpression, TimesTriggered, NextFireTime
            FROM 
                CronTrigger 
            WHERE 
                id = :jobId];

        System.assertEquals(footballAssociationScheduler.cronExpression, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        System.assertEquals('2023-01-16 13:42:00', String.valueOf(cronTrigger.NextFireTime));

        Test.stopTest();
    }
}