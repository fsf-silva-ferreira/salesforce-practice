/**
 * @description       : Understanding sObjcts and DML.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-01-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * References:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_dml_section.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_SOQL_query_all_rows.htm
**/
public with sharing class SalesforceObjectDmlManager {
    
    public static void insertOneAccount() {
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

    public static void updateLeadRecord() {
        Lead berthaBoxerLead = [
            SELECT 
                FirstName
                ,LastName
                ,LeadSource 
                ,Company
                ,MobilePhone
                ,Email
            FROM
                Lead
            WHERE
                FirstName = 'Bertha'
            LIMIT 1
        ];

        berthaBoxerLead.MobilePhone = '887907162';
        berthaBoxerLead.LeadSource = 'Phone';

        update berthaBoxerLead;
    }

    public static void updateListOfLeadRecord() {
        List<Lead> leadsWithoutPhoneNumber = [
            SELECT
                FirstName
                ,LastName
                ,LeadSource 
                ,Company
                ,MobilePhone
                ,Email
            FROM
                Lead
            WHERE
                MobilePhone = null
            LIMIT 10
        ];

        for(Integer count = 0; count<leadsWithoutPhoneNumber.size(); count++) {
            Lead leadRecord = leadsWithoutPhoneNumber.get(count);
            leadRecord.MobilePhone = '666666666' + count;
        }

        update leadsWithoutPhoneNumber;
    }

    public static void deleteNoSubjectCases() {
        List<Case> noSubjectCases = [
            SELECT 
                Id
                ,CaseNumber
                ,Status
                , Subject
                , Description 
            FROM 
                Case 
            WHERE 
                Subject = null
        ];

        delete noSubjectCases;
    }

    public static void undeleteNoSubjectCases() {
        List<Case> noSubjectCases = [
            SELECT 
                Id
                ,CaseNumber
                ,Status
                ,Subject
                ,Description 
            FROM 
                Case 
            WHERE 
                Subject = null
            ALL ROWS //To query records in org's Recycle Bin
        ];

        undelete noSubjectCases;
    }

    public static void upsertAccounts() {
        //* 1. Create new accounts
        List<Account> newAccounts = new List<Account>();
        newAccounts.add(new Account(Name = 'My Tutorial Rack Account #1'));
        newAccounts.add(new Account(Name = 'My Tutorial Rack Account #2'));

        //* 2. Retrieve existing accounts
        List<Account> existingAccounts = [select id, name, BillingCity from account where name like '%United%'];
        for(Account existingAccount : existingAccounts) {
            //* 2.1 Update billing city
            existingAccount.BillingCity = 'Washington, DC';
        }

        //* 3. Add two lists to one
        List<Account> accountsToUpsert = new List<Account>();
        accountsToUpsert.addAll(newAccounts);
        accountsToUpsert.addAll(existingAccounts);

        //* 4. Execute DML upsert
        upsert accountsToUpsert;

        System.debug('Account upsert completed.');
    }
}