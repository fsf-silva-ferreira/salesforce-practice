/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class FootballAssociationTest {

    @IsTest
    static void testSendEmailToAdmins(){
        Test.startTest();
        System.assertEquals(0, Limits.getEmailInvocations(), 'No emails should be sent');
 
        MailSender.sendErrorMessagesToAdmins('Football association found.');
 
        System.assertEquals(1, Limits.getEmailInvocations(), 'Emails should be sent');
        Test.stopTest();
    }

    @IsTest
    static void testSendNotification() {
        boolean notificationSuccessfullySent = Notification.notifyErrorsToAdmins('Fifa App - Error Messages', 'Football association found.');
 
        System.assertEquals(true, notificationSuccessfullySent);
    }

    @IsTest
    static void testSaveResultsSuccess() {
        Football_Association__c footballAssociation = new Football_Association__c();
        footballAssociation.Name = 'South African Football Association';
        footballAssociation.Acronym__c = 'SAFA';
        footballAssociation.Year_Founded__c = 1992;

        List<Football_Association__c> listFA = new List<Football_Association__c>();
        listFA.add(footballAssociation);

        List<Database.SaveResult> listSaveResults = Database.insert(listFA, false);
        String errorMessages = DatabaseErrorManager.handleSaveResults(listSaveResults);

        System.assertEquals('', errorMessages);
    }

    @IsTest
    static void testSaveResultsError() {
        Football_Association__c footballAssociation = new Football_Association__c();
        footballAssociation.Name = 'South African Football Association';
        footballAssociation.Acronym__c = 'SAFA';
        footballAssociation.Year_Founded__c = 1992;

        List<Football_Association__c> listFA = new List<Football_Association__c>();
        listFA.add(footballAssociation);

        Database.insert(listFA, false);
        List<Database.SaveResult> listSaveResults = Database.insert(listFA, false);
        String errorMessages = DatabaseErrorManager.handleSaveResults(listSaveResults);

        System.assertEquals(true, errorMessages.contains('DuplicateError'));
    }

    @IsTest
    static void testFromUrlToObjectConcacaf() {
        StaticResource jfaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'jamaican_fa_html' LIMIT 1];
        
        String jfaHtmlPageString = jfaHtmlPageObject.body.toString();
        List<String> jfaHtmlPageList = jfaHtmlPageString.split('\n');

        Football_Association__c jff = FootballAssociationObjectHandler.getFootballAssociationObject(jfaHtmlPageList);

        System.assertEquals('Jamaica Football Federation', jff.name);
        System.assertEquals(1910, jff.Year_Founded__c);
        System.assertEquals(1962, jff.Year_FIFA_Affiliation__c);
        System.assertEquals(1963, jff.Year_Continental_Affiliation__c);
        System.assertEquals('Michael Rickets', jff.President__c);
        System.assertEquals('http://www.jff.live', jff.Website__c);
    }
}