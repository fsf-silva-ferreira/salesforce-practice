/**
 * @description       : Practicing Batch classes.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountDML {
    
    public static void processAccounts(List<Account> accounts) {
        List<Account> accountsToUpdate = new List<Account>();
        String endingStringInAccountName = 'ACC';

        try {
            for (Account anAccount : accounts) {
                if(anAccount.Name.endsWith(endingStringInAccountName)) {
                    Integer accountNameEndIndex = anAccount.Name.length() - endingStringInAccountName.length();
                    anAccount.Name = anAccount.Name.substring(0, accountNameEndIndex);

                    accountsToUpdate.add(anAccount);
                }
            }

            Database.SaveResult[] saveResults = Database.update(accountsToUpdate, false);

            System.debug('Save results: ' + saveResults);
        } catch (Exception e) {
            System.debug('ScheduleAccount error: ' + e.getMessage());
        }
    }

    public static Database.QueryLocator getAccountNames() {
        String query = 'SELECT id, name FROM Account WHERE Name like \'%ACC\'';
        return Database.getQueryLocator(query);
    }
}