/**
 * @description       : Handling Football_Association__c object.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 08-11-2025
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

        System.debug('      ||--> CREATING EXTERNAL ID ...');
        footballAssociation.External_ID__c = getExternalId(footballAssociation.acronym__c, footballAssociation.website__c);
        System.debug('      ||--> DONE!');

        return footballAssociation;
    }

    private static String getExternalId(String acronym, String website) {
        String externalId = '';
        
        if(acronym != null && website != null) {
            externalId = acronym + '-' + website;
        } else 
        if(acronym != null) {
            externalId = acronym;
        } else {
            externalId = website;
        }

        return externalId;
    }
}