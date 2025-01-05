/**
 * @description       : Introduction to interfaces.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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