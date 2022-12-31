/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectConmebolTest {

    @IsTest
    static void testBrazilianFootballConfederation() {
        StaticResource bfcHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'brazilian_fc_html' LIMIT 1];
        
        String bfcHtmlPageString = bfcHtmlPageObject.body.toString();
        List<String> bfcHtmlPageList = bfcHtmlPageString.split('\n');

        Football_Association__c bfc = FootballAssociationObjectHandler.getFootballAssociationObject(bfcHtmlPageList);

        System.assertEquals('Brazilian Football Confederation', bfc.name);
        System.assertEquals(1914, bfc.Year_Founded__c);
        System.assertEquals(1923, bfc.Year_FIFA_Affiliation__c);
        System.assertEquals(1916, bfc.Year_Continental_Affiliation__c);
        System.assertEquals('Ednaldo Rodrigues', bfc.President__c);
        System.assertEquals('www.cbf.com.br', bfc.Website__c);
    }
}
