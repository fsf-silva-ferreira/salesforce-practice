/**
 * @description       : Practicing limite of DML operations.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-05-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_limits.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_System_OrgLimits.htm
**/
public with sharing class DmlLimitExample {
    
    public static void insertAccounts() {
        for(Integer counter=0;counter<200; counter++) {
            Account newAccount = new Account(Name='My Account - ' + counter);

            try {
                insert newAccount; //DML statements limit: 150
                System.debug(Limits.getLimitDmlStatements());
            } catch (Exception governorLimitsException) { //You cannot handle it
                System.debug('Caught the exception');
                System.debug(governorLimitsException);
            }
        }

        //This account WILL NOT be inserted
        insert new Account(Name='My Account - My Tutorial Rack');
    }
}