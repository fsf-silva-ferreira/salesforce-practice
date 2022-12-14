/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationController {
    
    public static void runWebToBaseProcess() {
        List<Football_Association__c> footballAssociations = new List<Football_Association__c>();
        List<String> footballAssociationUrls = FootballAssociationLinksManager.getLinks();

        for (String footballAssociationUrl : footballAssociationUrls) {
            Football_Association__c footballAssociation = FootballAssociationHandler.getFootballAssociationObject(footballAssociationUrl);

            footballAssociations.add(footballAssociation);
        }

        insert footballAssociations;
    }
}