/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-14-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class FootballAssociationSchedulerTest {
    
    static testmethod void testScheduler() {
        Test.startTest();
        //TO-DO: Test code
        FootballAssociationScheduler footballAssociationScheduler = new FootballAssociationScheduler();
        String jobId = System.schedule('testscheduleConcacafConmebolUefa', footballAssociationScheduler.cronExpression, new ScheduledTest());

        CronTrigger cronTrigger = [  
            SELECT 
                Id, CronExpression, TimesTriggered, NextFireTime
            FROM 
                CronTrigger 
            WHERE 
                id = :jobId];

        System.assertEquals(footballAssociationScheduler.cronExpression, cronTrigger.CronExpression);
        System.assertEquals(0, cronTrigger.TimesTriggered);
        System.assertEquals('2023-01-14 14:10:00', String.valueOf(cronTrigger.NextFireTime));

        Test.stopTest();
    }
}