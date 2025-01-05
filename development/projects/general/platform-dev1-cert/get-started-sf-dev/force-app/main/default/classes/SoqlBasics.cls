/**
 * @description       : Getting started with SOQL Queries.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SoqlBasics {
    
    public static void debugGetContactByName() {
        try {
            Contact contact = getContactByName('Schwarzenberg');

            System.debug('Contact name: ' + contact.Name);
            System.debug('Contact email: ' + contact.Email);
        } catch (QueryException e) {
            //No rows for assignment
            System.debug('An exception ocurred in getAllContacts method: ' + e.getMessage());
            System.debug('Exception object: ' + e);
        }
    }  

    public static Contact getContactByName(String contactName) {
        Contact contact = [
            SELECT
                Name
                ,Email
            FROM
                Contact
            WHERE
                LastName = :contactName
            LIMIT 1
        ];

        return contact;       
    }  

    //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_builtin.htm
    public static void runQueryException() {
        try {
            /* 
                This statement doesn't cause an exception, even though 
                we don't have a contact with name='XYZ'.
                The list will just be empty.
            */                
            List<Contact> lm = [SELECT Name FROM Contact WHERE Name = 'XYZ'];                
            System.debug(lm.size()); //lm.size() is 0 but the list EXISTS
            
            /*
                However, this statement causes a QueryException because 
                we're assiging the return value to a Contact object
                but no Contact is returned.
            */
            Contact m = [SELECT Name FROM Contact WHERE Name = 'XYZ' LIMIT 1];
        } catch(QueryException queryException) {
            //Contact record named 'XYZ' DOESN'T EXIST
            System.debug('The following exception has occurred: ' + queryException.getMessage());    
        }
    } 
}