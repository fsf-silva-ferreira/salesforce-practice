/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-01-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
public with sharing class UrlToObjectAsianFcTest {

    @IsTest
    static void testJapanFootballAssociation() {
        StaticResource jfaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'japan_fa_html' LIMIT 1];
        
        String jfaHtmlPageString = jfaHtmlPageObject.body.toString();
        List<String> jfaHtmlPageList = jfaHtmlPageString.split('\n');

        Football_Association__c jfa = FootballAssociationObjectHandler.getFootballAssociationObject(jfaHtmlPageList);

        System.assertEquals('Japan Football Association', jfa.name);
        System.assertEquals(1921, jfa.Year_Founded__c);
        System.assertEquals(1929, jfa.Year_FIFA_Affiliation__c);
        System.assertEquals(1954, jfa.Year_Continental_Affiliation__c);
        System.assertEquals('Kozo Tashima', jfa.President__c);
        System.assertEquals('www.jfa.jp', jfa.Website__c);
    }

    @IsTest
    static void testChineseFootballAssociation() {
        StaticResource cfaHtmlPageObject = [SELECT Id, Body FROM StaticResource WHERE Name = 'chinese_fa_html' LIMIT 1];
        
        String cfaHtmlPageString = cfaHtmlPageObject.body.toString();
        List<String> cfaHtmlPageList = cfaHtmlPageString.split('\n');

        Football_Association__c cfa = FootballAssociationObjectHandler.getFootballAssociationObject(cfaHtmlPageList);

        System.assertEquals('Chinese Football Association', cfa.name);
        System.assertEquals(1924, cfa.Year_Founded__c);
        System.assertEquals(1931, cfa.Year_FIFA_Affiliation__c);
        System.assertEquals(1974, cfa.Year_Continental_Affiliation__c);
        System.assertEquals('Chen Xuyuan', cfa.President__c);
        System.assertEquals('www.thecfa.cn', cfa.Website__c);
    }
}
