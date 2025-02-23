/**
 * @description       : Overview of Apex code.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-20-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class MyFirstApexClass {
    
    public static void updateAccount() {
        List<Account> listOfAccounts = new List<Account>();
        listOfAccounts = [
            SELECT 
                Id
                ,Name 
                ,Description 
            FROM 
                Account 
            WHERE 
                Name LIKE '%teste Postman%' AND 
                Support_Tier__c = null
        ];

        List<Account> listOfAccountsUpdated = new List<Account>();
        for(Account loopAccount : listOfAccounts) {
            loopAccount.Description = 'This account for testing';
            loopAccount.Support_Tier__c = 'Silver';
            listOfAccountsUpdated.add(loopAccount);
        }        

        if(listOfAccountsUpdated != null && listOfAccountsUpdated.size() > 0) {
            update listOfAccountsUpdated;
        }
    }
}