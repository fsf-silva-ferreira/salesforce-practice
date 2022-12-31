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
}
