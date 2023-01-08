/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-07-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationObjectHandler {

    public static Football_Association__c getFootballAssociationObject(List<String> htmlData) {
        FootballAssociationHtmlReader reader = new FootballAssociationHtmlReader(htmlData);
        Football_Association__c footballAssociation = new Football_Association__c();

        System.debug('      ||--> GETTING WEBSITE ...');
        footballAssociation.website__c = reader.getWebsiteField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING ACRONYM ...');
        footballAssociation.acronym__c = reader.getAcronymField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING FULL NAME ...');
        footballAssociation.name = reader.getFullNameField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING YEAR FOUNDED ...');
        footballAssociation.year_founded__c = reader.getYearFoundedField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING YEAR FIFA AFFILIATION ...');
        footballAssociation.year_Fifa_affiliation__c = reader.getYearFifaAffiliationField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING YEAR CONTINENTAL AFFILIATION ...');
        footballAssociation.year_continental_affiliation__c = reader.getYearContinentalAffiliationField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING NAME CONTINENTAL AFFILIATION ...');
        footballAssociation.continental_affiliation__c = reader.getNameContinentalAffiliationField();
        System.debug('      ||--> DONE!');
        System.debug('      ||--> GETTING PRESIDENT ...');
        footballAssociation.president__c = reader.getPresidentField();
        System.debug('      ||--> DONE!');

        return footballAssociation;
    }
}