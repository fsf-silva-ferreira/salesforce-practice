/**
 * @description       : Introduction to SOQL = Salesforce Object Query Language.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 12-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SoqlBasics {

    private static final Integer ACCOUNT_NUMBER_LENGTH = 8;

    public static void updateAccountsWithoutAccountNumber() {
        Integer accountNumberIntermediate;
        String accountNumberFinal; 

        Account[] accounts = [
            SELECT 
                Id
                ,Name
                ,AccountNumber
            FROM 
                Account
        ];
        
        Integer totalInvalidAccountNumbersToFix = 0;
        for(Account accountToUpdateAccountNumber : accounts) {            
            if(accountToUpdateAccountNumber.AccountNumber.length() < ACCOUNT_NUMBER_LENGTH) {
                totalInvalidAccountNumbersToFix++;

                do {
                    accountNumberIntermediate = Integer.valueof((Math.random() * 100000000)); 
                    accountNumberFinal = String.valueOf(accountNumberIntermediate); 
                } while (accountNumberFinal.length() != ACCOUNT_NUMBER_LENGTH);

                accountToUpdateAccountNumber.AccountNumber = accountNumberFinal;
            }
        }

        if(totalInvalidAccountNumbersToFix > 0) {
            update accounts;

            System.debug(accounts.size() + ' updated.');
            for(Account accountWithNumberOfEmployeesUpdated : accounts) {
                System.debug(
                    '-> Account Name: ' + accountWithNumberOfEmployeesUpdated.Name + 
                    ' - Account Number: ' + accountWithNumberOfEmployeesUpdated.AccountNumber
                );
            }
        }
    }

    public static void updateAccountsWithoutNumberOfEmployees() {
        Account[] accounts = [
            SELECT 
                Id
                ,Name
                ,NumberOfEmployees
            FROM 
                Account
            WHERE
                NumberOfEmployees = null
        ];
 
        for(Account accountToUpdateNumberOfEmployees : accounts) {                      
            accountToUpdateNumberOfEmployees.NumberOfEmployees = Integer.valueof((Math.random() * 1000));
        }

        if(accounts.size() > 0) {
            update accounts;

            System.debug(accounts.size() + ' updated.');
            for(Account accountWithNumberOfEmployeesUpdated : accounts) {
                System.debug(
                    '-> Account Name: ' + accountWithNumberOfEmployeesUpdated.Name + 
                    ' - Number of employees: ' + accountWithNumberOfEmployeesUpdated.NumberOfEmployees
                );
            }
        }        
    }
}