/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectOfcTest {
    
    @IsTest
    static void testNewZealandFootball() {
        StaticResource nzfHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'nz_football_html' LIMIT 1];
        
        String nzfHtmlPageString = nzfHtmlPageObject.body.toString();
        List<String> nzfHtmlPageList = nzfHtmlPageString.split('\n');

        Football_Association__c nzf = FootballAssociationObjectHandler.getFootballAssociationObject(nzfHtmlPageList);

        System.assertEquals('New Zealand Football', nzf.name);
        System.assertEquals(1891, nzf.Year_Founded__c);
        System.assertEquals(1948, nzf.Year_FIFA_Affiliation__c);
        System.assertEquals(1966, nzf.Year_Continental_Affiliation__c);
        System.assertEquals('Johanna Wood', nzf.President__c);
        System.assertEquals('www.nzfootball.co.nz', nzf.Website__c);
    }
}
