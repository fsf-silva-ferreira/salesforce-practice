/**
 * @description       : Introduction to SOSL = Salesforce Object Search Language.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 12-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SoslBasics {

    /*
        SOSL query sample to be run in Developer Console Query Editor:

        FIND {sa} IN ALL FIELDS RETURNING Account(Name), Contact(FirstName,LastName)
    */

    public static void findTextOnAccounts(String soslText) {
        List<List<sObject>> searchList = [
            FIND 
                :soslText
            RETURNING 
                Account(Name)
        ];

        Account[] searchAccounts = (Account[]) searchList[0];
        if(searchAccounts.size() > 0) {
            System.debug('Found the following accounts:');
            for (Account a : searchAccounts) {
                System.debug('-> ' + a.Name);
            }
        } else {
            System.debug('No accounts found.');
        }
    }

    public static void findTextOnContacts(String soslText) {        
        List<List<sObject>> searchList = [
            FIND 
                :soslText 
            IN ALL FIELDS
            RETURNING 
                Contact(FirstName,LastName,Department)
        ];

        Contact[] searchContacts = (Contact[]) searchList[0];
        if(searchContacts.size() > 0) {
            System.debug('Found the following contacts.');
            for (Contact c : searchContacts) {
                System.debug('-> ' +  c.LastName + ', ' + c.FirstName);
            }
        } else {
            System.debug('No contacts found.');
        }
    }
}