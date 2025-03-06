/**
 * @description       : Introduction to interfaces.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 *
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_defining.htm
**/
public with sharing class MainClass {

    public static void showUrl(String websiteAddress) {
        try {
            UrlInterface urlInterface = FactoryClass.getWebsite(websiteAddress);
            System.debug(urlInterface.getUrl());
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
    }
}