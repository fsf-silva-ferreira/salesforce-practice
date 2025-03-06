/**
 * @description       : Practicing Database class operations.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database_saveresult.htm
**/
public with sharing class DatabaseMethods {

    public static void inserAccountListPartially() {
        Account account1 = new Account(Name='Jack & Jill');
        Account account2 = new Account(); //Account without name will cause exception
        Account account3 = new Account(Name='McDonald\'s');

        List<Account> accountsToInsert = new List<Account>();
        accountsToInsert.add(account1);
        accountsToInsert.add(account2);
        accountsToInsert.add(account3);

        //insert accountsToInsert; //DmlException (REQUIRED_FIELD_MISSING)

        Database.SaveResult[] saveResultList = Database.insert(accountsToInsert,false); //Will insert 2 out of 3 accounts

        for(Database.SaveResult saveResult : saveResultList) {
            if(saveResult.isSuccess()) {
                System.debug('Record successfully inserted. Account ID: ' + saveResult.getId());
            } else {
                for(Database.Error error : saveResult.getErrors()) {
                    System.debug('The following error ocurred:');
                    System.debug(error.getStatusCode() + ' : ' + error.getMessage());
                    System.debug('Acount fields that affected this error: ' + error.getFields());
                }
            }
        }        
    }
}
