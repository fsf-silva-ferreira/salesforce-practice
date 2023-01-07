/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationController {
    
    public static void runWebToBaseProcess() {
        List<Football_Association__c> footballAssociations = new List<Football_Association__c>();
        Set<Football_Association__c> footballAssociationsNoDuplicates = new Set<Football_Association__c>();

        System.debug('************************ ||PROCESS START|| ************************');

        System.debug('||--> STEP 1: GET WIKIPEDIA URL LINKS');
        List<String> footballAssociationUrls = FootballAssociationLinksManager.getLinks();
        System.debug('||--> STEP 1 DONE!');

        System.debug('||--> STEP 2: CONVERT URLS INTO Football_Association__c OBJECT');
        for (String footballAssociationUrl : footballAssociationUrls) {
            System.debug('      ||--> URL: ' + footballAssociationUrl);
            List<String> footballAssociationHtmlPage = WebPageHtmlCallout.getCalloutResponseContents(footballAssociationUrl);
            Football_Association__c footballAssociation = FootballAssociationObjectHandler.getFootballAssociationObject(footballAssociationHtmlPage);
            System.debug('      ||--> OBJECT: ' + footballAssociation);

            footballAssociationsNoDuplicates.add(footballAssociation);
        }
        System.debug('||--> STEP 2 DONE!');

        System.debug('||--> STEP 3: INSERT Football_Association__c OBJECTS INTO DATABASE');
        footballAssociations.addAll(footballAssociationsNoDuplicates);
        Database.SaveResult[] saveResults = Database.insert(footballAssociations, false);
        String errorMessages = DatabaseErrorManager.handleSaveResults(saveResults);
        System.debug('||--> STEP 3 DONE!');

        System.debug('||--> STEP 4: NOTIFY ADMINS IN CASE OF DATABASE ERROR');
        if(errorMessages != '') {
            MailSender.sendErrorMessagesToAdmins(errorMessages);
            Notification.notifyErrorsToAdmins('Fifa App - Error Notification', errorMessages);
            System.debug('||--> STEP 4 DONE!');
        } else {
            System.debug('NO DATABASE ERROR FOUND');    
        }
        
        System.debug('************************ ||PROCESS END|| ************************');
    }
}