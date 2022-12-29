/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-16-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationObjectHandler {

    public static Football_Association__c getFootballAssociationObject(List<String> htmlData) {
        FootballAssociationHtmlReader reader = new FootballAssociationHtmlReader(htmlData);
        Football_Association__c footballAssociation = new Football_Association__c();

        footballAssociation.name = reader.getFullNameField();
        footballAssociation.year_founded__c = reader.getYearFoundedField();
        footballAssociation.year_Fifa_affiliation__c = reader.getYearFifaAffiliationField();
        footballAssociation.year_continental_affiliation__c = reader.getYearContinentalAffiliationField();
        footballAssociation.president__c = reader.getPresidentField();
        footballAssociation.website__c = reader.getWebsiteField();

        return footballAssociation;
    }
}