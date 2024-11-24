/**
 * @description       : Class to access data from Contacts.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class MyContactListController {
    
    //Apex methods designated @AuraEnabled are able to be called from a Lightning component.
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId) {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :recordId];
    }
}