/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectTest {
    
    @IsTest
    static void testConcacafAssociation() {
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

    @IsTest
    static void testConmebolAssociation() {
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

    @IsTest
    static void testCafAssociation() {
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

    @IsTest
    static void testOfcAssociation() {
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
