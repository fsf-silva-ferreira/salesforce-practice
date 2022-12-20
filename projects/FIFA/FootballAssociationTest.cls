/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-19-2022
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

        System.assertEquals(true, errorMessages.startsWith('The following error has occurred: cannot specify'));
    }
}