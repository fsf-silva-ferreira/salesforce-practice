/**
 * @description       : Practicing unit tests.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountClass {

    public static void createAccountWithContact() {        
        try {
            Account myAccount = new Account();
            myAccount.Name = 'Demo account Test 2';
            myAccount.AccountNumber = '12345601';

            insert myAccount;

            Contact myContact = new Contact();
            myContact.LastName = 'Contact Demo Test 1';
            myContact.AccountId = myAccount.Id;

            insert myContact;
        } catch (Exception e) {
            System.debug('Error on creating account: ' + e.getMessage());
        }        
    }
}