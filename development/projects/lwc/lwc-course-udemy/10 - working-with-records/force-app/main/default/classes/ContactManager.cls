/**
 * @description       : Handling Contact data.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactManager {

    @AuraEnabled
    public static List<Contact> getContacts(Integer numberOfRecords) {
        List<Contact> contacts = 
        [
            SELECT 
                 FirstName
                ,LastName
                ,Phone
                ,Email
            FROM
                Contact
            LIMIT
                :numberOfRecords
        ];

        return contacts;
    }
}