/**
 * @description       : Utility class for DML operations on Account records.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-01-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountDmlUtility {
    
    public static void createSingleAccount(String nameParameter, String billingCityParameter) {
        Account accountToCreate = new Account(Name = nameParameter, BillingCity = billingCityParameter);
        insert accountToCreate;

        System.debug('One account got created successfully: ' + accountToCreate.Id);
    }

    public static void createMultipleAccounts(Integer numberOfAccountsToCreate, String nameParameter) {
        List<Account> accountsToCreate = new List<Account>();
        for(Integer count = 1; count <= numberOfAccountsToCreate; count++) {
            Account accountToCreate = new Account(Name = nameParameter + count);
            accountsToCreate.add(accountToCreate);
        }

        insert accountsToCreate;

        System.debug(numberOfAccountsToCreate + ' accounts created successfully');
    }

    public static void updateAccount(String name) {
        Account accountToUpdate = [
            SELECT
                Id
                ,Name
                ,BillingCity
                ,BillingState
                ,BillingCountry
            FROM
                Account
            WHERE
                Name = :name
        ];

        accountToUpdate.BillingCity = 'Austin';
        accountToUpdate.BillingState = 'TX';
        accountToUpdate.BillingCountry = 'USA';

        update accountToUpdate;

        System.debug('Account updated successfully');
    }

    public static void deleteMultipleAccounts(String nameOfAccount) {
        String matchString = nameOfAccount + '%';// % - wild card

        List<Account> listOfAcountsToBeDeleted = [
            SELECT
                Id
                ,Name
                ,BillingCity
                ,BillingState
                ,BillingCountry
            FROM
                Account
            WHERE
                Name LIKE :matchString
        ];

        delete listOfAcountsToBeDeleted;

        System.debug(listOfAcountsToBeDeleted.size() + ' records deleted successfully');
    }

    public static void undeleteMultipleAccounts(String nameOfAccount) {
        String matchString = nameOfAccount + '%';

        List<Account> listOfAcountsToBeDeleted = [
            SELECT
                Id
                ,Name
                ,BillingCity
                ,BillingState
                ,BillingCountry
            FROM
                Account
            WHERE
                Name LIKE :matchString
            ALL ROWS
        ];

        undelete listOfAcountsToBeDeleted;

        System.debug(listOfAcountsToBeDeleted.size() + ' records restored successfully');
    }
}