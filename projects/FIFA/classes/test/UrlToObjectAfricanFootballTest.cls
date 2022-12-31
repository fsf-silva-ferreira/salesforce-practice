/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectAfricanFootballTest {

    @IsTest
    static void testLesothoFootballAssociation() {
        StaticResource lefaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'lesotho_fa_html' LIMIT 1];
        
        String lefaHtmlPageString = lefaHtmlPageObject.body.toString();
        List<String> lefaHtmlPageList = lefaHtmlPageString.split('\n');

        Football_Association__c lefa = FootballAssociationObjectHandler.getFootballAssociationObject(lefaHtmlPageList);

        System.assertEquals('Lesotho Football Association', lefa.name);
        System.assertEquals(1932, lefa.Year_Founded__c);
        System.assertEquals(1964, lefa.Year_FIFA_Affiliation__c);
        System.assertEquals(1963, lefa.Year_Continental_Affiliation__c);
        System.assertEquals('Salemane Phafane', lefa.President__c);
        System.assertEquals('lesothofootball.com', lefa.Website__c);
    }
}
