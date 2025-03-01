/**
 * @description       : Understanding sObjcts and DML.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SalesforceObjectDmlManager {
    
    public static void insertAnAccount() {
        Account myAccount = new Account();
        myAccount.Name = 'The Tea Factory';
        myAccount.Phone= '555-0129';
        myAccount.AccountNumber = '35628121';

        insert myAccount;
    }

    public static void insertMultipleRecords(Integer numberOfRecordsToInsert){
        Integer recordCounter = 1;
        //Create a list to add our accounts
        List<Account> teaFactoryAccounts = new List<Account>();

        while(recordCounter <= numberOfRecordsToInsert){
            //Display the current counter value
            System.debug('Counter Value before Incrementing ' + recordCounter);
            //Create a new account
            Account store = new Account();
            store.Name = 'The Tea Factory ' + recordCounter;
            store.AccountNumber = '3562911' + recordCounter;
            teaFactoryAccounts.add(store);
            System.debug(teaFactoryAccounts);
            //Increment the counter
            recordCounter = recordCounter + 1;
            System.debug('Counter Value after incrementing ' + recordCounter);
        }

        System.debug('Size of Account List: ' + teaFactoryAccounts.size());
        System.debug('Elements in Account List: ' + teaFactoryAccounts);

        //Insert all of the accounts in the list
        insert teaFactoryAccounts;
    }
}