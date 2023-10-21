/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-02-2023
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

    @IsTest
    static void testFecafoot() {
        StaticResource fecafootHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'fecafoot_html' LIMIT 1];
        
        String fecafootHtmlPageString = fecafootHtmlPageObject.body.toString();
        List<String> fecafootHtmlPageList = fecafootHtmlPageString.split('\n');

        Football_Association__c fecafoot = FootballAssociationObjectHandler.getFootballAssociationObject(fecafootHtmlPageList);

        System.assertEquals('Cameroonian Football Federation', fecafoot.name);
        System.assertEquals(1959, fecafoot.Year_Founded__c);
        System.assertEquals(1964, fecafoot.Year_FIFA_Affiliation__c);
        System.assertEquals(1963, fecafoot.Year_Continental_Affiliation__c);
        System.assertEquals('Samuel Eto\'o', fecafoot.President__c);
        System.assertEquals('fecafoot-officiel.com', fecafoot.Website__c);
    }

    @IsTest
    static void testFrmf() {
        StaticResource frmfHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'frmf_html' LIMIT 1];
        
        String frmfHtmlPageString = frmfHtmlPageObject.body.toString();
        List<String> frmfHtmlPageList = frmfHtmlPageString.split('\n');

        Football_Association__c fecafoot = FootballAssociationObjectHandler.getFootballAssociationObject(frmfHtmlPageList);

        System.assertEquals('Royal Moroccan Football Federation', fecafoot.name);
        System.assertEquals(1956, fecafoot.Year_Founded__c);
        System.assertEquals(1960, fecafoot.Year_FIFA_Affiliation__c);
        System.assertEquals(1960, fecafoot.Year_Continental_Affiliation__c);
        System.assertEquals('Fouzi Lekjaa', fecafoot.President__c);
        System.assertEquals('www.frmf.ma', fecafoot.Website__c);
    }

    @IsTest
    static void testNigeriaFootball() {
        StaticResource nffHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'nff_html' LIMIT 1];
        
        String nffHtmlPageString = nffHtmlPageObject.body.toString();
        List<String> nffHtmlPageList = nffHtmlPageString.split('\n');

        Football_Association__c nff = FootballAssociationObjectHandler.getFootballAssociationObject(nffHtmlPageList);

        System.assertEquals('Nigeria Football Federation', nff.name);
        System.assertEquals(1933, nff.Year_Founded__c);
        System.assertEquals(1960, nff.Year_FIFA_Affiliation__c);
        System.assertEquals(1959, nff.Year_Continental_Affiliation__c);
        System.assertEquals('Ibrahim Musa Gusau', nff.President__c);
        System.assertEquals('www.thenff.com', nff.Website__c);
    }
}
