/**
 * @description       : Class implementing an interface.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-29-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class GoogleClass implements UrlInterface {
    
    public String getUrl() {        
        return 'www.google.com';
    }
}