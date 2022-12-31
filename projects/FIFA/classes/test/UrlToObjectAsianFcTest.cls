/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectAsianFcTest {

    @IsTest
    static void testJapanFootballAssociation() {
        StaticResource svffHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'japan_fa_html' LIMIT 1];
        
        String jfaHtmlPageString = svffHtmlPageObject.body.toString();
        List<String> jfaHtmlPageList = jfaHtmlPageString.split('\n');

        Football_Association__c jfa = FootballAssociationObjectHandler.getFootballAssociationObject(jfaHtmlPageList);

        System.assertEquals('Japan Football Association', jfa.name);
        System.assertEquals(1921, jfa.Year_Founded__c);
        System.assertEquals(1929, jfa.Year_FIFA_Affiliation__c);
        System.assertEquals(1954, jfa.Year_Continental_Affiliation__c);
        System.assertEquals('Kozo Tashima', jfa.President__c);
        System.assertEquals('www.jfa.jp', jfa.Website__c);
    }
}
