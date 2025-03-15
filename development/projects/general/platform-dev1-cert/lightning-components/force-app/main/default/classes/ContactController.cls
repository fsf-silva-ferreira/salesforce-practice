/**
 * @description       : Class to manage Contact records.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-13-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/controllers_server_apex_returning_data.htm
 * https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/controllers_server_apex_auraenabled_annotation.htm
**/
//* with sharing = To take into consideration field-level and record-level security.
public with sharing class ContactController {
    
    @AuraEnabled //This allows client-side to call Apex
    public static List<Contact> findAll() {
        return [SELECT Id, Name, Phone FROM Contact];
    }

    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%' + searchKey + '%';

        return [SELECT Id, Name, Phone FROM Contact WHERE Name LIKE :name];
    }

    @AuraEnabled
    public static Contact findById(String contactId){
        return [SELECT Id, Name, Title, Phone FROM Contact WHERE Id = :contactId];
    }
}