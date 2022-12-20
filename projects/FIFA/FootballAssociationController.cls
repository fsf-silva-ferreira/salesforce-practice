/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-19-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationController {
    
    public static void runWebToBaseProcess() {
        List<Football_Association__c> footballAssociations = new List<Football_Association__c>();
        List<String> footballAssociationUrls = FootballAssociationLinksManager.getLinks();

        for (String footballAssociationUrl : footballAssociationUrls) {
            List<String> footballAssociationHtmlPage = WebPageHtmlCallout.getCalloutResponseContents(footballAssociationUrl);
            Football_Association__c footballAssociation = FootballAssociationObjectHandler.getFootballAssociationObject(footballAssociationHtmlPage);

            footballAssociations.add(footballAssociation);
        }

        Database.SaveResult[] saveResults = Database.insert(footballAssociations, false);
        String errorMessages = DatabaseErrorManager.handleSaveResults(saveResults);

        if(errorMessages != '') {
            MailSender.sendErrorMessagesToAdmins(errorMessages);
            Notification.notifyErrorsToAdmins('Fifa App - Error Notification', errorMessages);
        }
    }
}