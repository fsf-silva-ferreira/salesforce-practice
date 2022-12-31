/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectUefaTest {

    @IsTest
    static void testSwedishFootballAssociation() {
        StaticResource svffHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'swedish_fa_html' LIMIT 1];
        
        String svffHtmlPageString = svffHtmlPageObject.body.toString();
        List<String> svffHtmlPageList = svffHtmlPageString.split('\n');

        Football_Association__c svff = FootballAssociationObjectHandler.getFootballAssociationObject(svffHtmlPageList);

        System.assertEquals('Swedish Football Association', svff.name);
        System.assertEquals(1904, svff.Year_Founded__c);
        System.assertEquals(1904, svff.Year_FIFA_Affiliation__c);
        System.assertEquals(1954, svff.Year_Continental_Affiliation__c);
        System.assertEquals('Karl-Erik Nilsson', svff.President__c);
        System.assertEquals('svenskfotboll.se', svff.Website__c);
    }

    @IsTest
    static void testSanMarinoFootballFederation() {
        StaticResource smffHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'san_marino_ff_html' LIMIT 1];
        
        String smffHtmlPageString = smffHtmlPageObject.body.toString();
        List<String> smffHtmlPageList = smffHtmlPageString.split('\n');

        Football_Association__c smff = FootballAssociationObjectHandler.getFootballAssociationObject(smffHtmlPageList);

        System.assertEquals('San Marino Football Federation', smff.name);
        System.assertEquals(1931, smff.Year_Founded__c);
        System.assertEquals(1988, smff.Year_FIFA_Affiliation__c);
        System.assertEquals(1988, smff.Year_Continental_Affiliation__c);
        System.assertEquals('Marco Tura', smff.President__c);
        System.assertEquals('www.fsgc.sm', smff.Website__c);
    }
}
