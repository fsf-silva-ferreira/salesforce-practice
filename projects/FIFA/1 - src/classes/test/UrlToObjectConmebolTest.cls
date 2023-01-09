/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-01-2023
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

    @IsTest
    static void testArgentineFootballAssociation() {
        StaticResource afaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'afa_html' LIMIT 1];
        
        String afaHtmlPageString = afaHtmlPageObject.body.toString();
        List<String> afaHtmlPageList = afaHtmlPageString.split('\n');

        Football_Association__c afa = FootballAssociationObjectHandler.getFootballAssociationObject(afaHtmlPageList);

        System.assertEquals('Argentine Football Association', afa.name);
        System.assertEquals(1893, afa.Year_Founded__c);
        System.assertEquals(1912, afa.Year_FIFA_Affiliation__c);
        System.assertEquals(1916, afa.Year_Continental_Affiliation__c);
        System.assertEquals('Claudio Tapia', afa.President__c);
        System.assertEquals('www.afa.com.ar', afa.Website__c);
    }

    @IsTest
    static void testChileanFootballFederation() {
        StaticResource ffchHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'ffch_html' LIMIT 1];
        
        String ffchHtmlPageString = ffchHtmlPageObject.body.toString();
        List<String> ffchHtmlPageList = ffchHtmlPageString.split('\n');

        Football_Association__c ffch = FootballAssociationObjectHandler.getFootballAssociationObject(ffchHtmlPageList);

        System.assertEquals('Football Federation of Chile', ffch.name);
        System.assertEquals(1895, ffch.Year_Founded__c);
        System.assertEquals(1913, ffch.Year_FIFA_Affiliation__c);
        System.assertEquals(1916, ffch.Year_Continental_Affiliation__c);
        System.assertEquals('Pablo Milad Abusleme', ffch.President__c);
        System.assertEquals('laroja.cl', ffch.Website__c);
    }
}
