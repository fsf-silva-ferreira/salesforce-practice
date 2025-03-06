/**
 * @description       : Expose a class as a SOAP service.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_web_services.htm
**/
global with sharing class MySoapWebService {
    
    webservice static Account getRecord(String id) {
        //Add your code
        return [SELECT Id, Name, AccountNumber FROM Account WHERE Id = :id];
    }
}