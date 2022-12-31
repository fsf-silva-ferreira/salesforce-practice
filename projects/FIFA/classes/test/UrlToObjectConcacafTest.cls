/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectConcacafTest {

    @IsTest
    static void testJamaicanFootballAssociation() {
        StaticResource jfaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'jamaican_fa_html' LIMIT 1];
        
        String jfaHtmlPageString = jfaHtmlPageObject.body.toString();
        List<String> jfaHtmlPageList = jfaHtmlPageString.split('\n');

        Football_Association__c jff = FootballAssociationObjectHandler.getFootballAssociationObject(jfaHtmlPageList);

        System.assertEquals('Jamaica Football Federation', jff.name);
        System.assertEquals(1910, jff.Year_Founded__c);
        System.assertEquals(1962, jff.Year_FIFA_Affiliation__c);
        System.assertEquals(1963, jff.Year_Continental_Affiliation__c);
        System.assertEquals('Michael Rickets', jff.President__c);
        System.assertEquals('www.jff.live', jff.Website__c);
    }
}
