/**
 * @description       : Practicing DML Exception including its methods.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm
**/
public with sharing class DmlExceptionExample {
    
    public static void runExceptionExampleOnIsert() {
        Account account1 = new Account(Name='Coffeemaker', Description='Kitchenware');
        Account account2 = new Account();
        Account account3 = new Account();

        List<Account> accounts = new List<Account>();
        accounts.add(account1);
        accounts.add(account2);
        accounts.add(account3);

        try {
            insert accounts;
        } catch (DmlException dmlException) {
            Integer numberOfDmlErrors = DmlException.getNumDml();
            System.debug('Number of DML errors: ' + numberOfDmlErrors);

            for(Integer counter=0; counter<numberOfDmlErrors; counter++) {
                System.debug('DML field name: ' + dmlException.getDmlFieldNames(counter));
                System.debug('DML message: ' + dmlException.getDmlMessage(counter));
            }
        }
    }
}