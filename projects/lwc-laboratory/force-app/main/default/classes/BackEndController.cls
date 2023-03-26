/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class BackEndController {

    @AuraEnabled
    public static String sayHelloLwc() {
        return 'Hello LWC!';
    }
}