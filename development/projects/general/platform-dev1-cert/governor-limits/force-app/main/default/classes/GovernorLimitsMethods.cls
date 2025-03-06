/**
 * @description       : Important methods related to Governor Limits.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-06-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_limits.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_System_OrgLimits.htm
**/
public class GovernorLimitsMethods {
    
    public static void runDmlInsertInsideForLoop() {
        for(Integer counter=0; counter<10; counter++) {
            Account newAccount = new Account(Name='My Tutorial Rack - ' + counter);

            try {
                insert newAccount;                
            } catch (Exception governorLimitsException) {
                System.debug('Caught the exception');
                System.debug(governorLimitsException);
            }
        }

        System.debug('Limits.getDmlStatements() ==> ' + Limits.getDmlStatements());
        System.debug('Limits.getDmlRows() ==> ' + Limits.getDmlRows());
        System.debug('Limits.getLimitDmlRows() ==> ' + Limits.getLimitDmlRows());
        System.debug('Limits.getLimitDmlStatements() ==> ' + Limits.getLimitDmlStatements());
    }

    public static void runDmlInsertOutsideForLoop() {
        List<Account> accounts = new List<Account>();

        for(Integer counter=0; counter<3; counter++) {
            Account newAccount = new Account(Name='Deepika - ' + counter);

            try {
                accounts.add(newAccount);
            } catch (Exception governorLimitsException) {
                System.debug('Caught the exception');
                System.debug(governorLimitsException);
            }
        }

        insert accounts;

        System.debug('Limits.getDmlStatements() ==> ' + Limits.getDmlStatements());
        System.debug('Limits.getDmlRows() ==> ' + Limits.getDmlRows());
        System.debug('Limits.getLimitDmlRows() ==> ' + Limits.getLimitDmlRows());
        System.debug('Limits.getLimitDmlStatements() ==> ' + Limits.getLimitDmlStatements());
    }

    public static void displayLimits() {
        System.debug('Maximum numbers of callouts = ' + Limits.getLimitCallouts());
        System.debug('Maximum of records that can be processed = ' + Limits.getLimitDmlRows());
        System.debug('CPU time = ' + Limits.getLimitCpuTime()); 
        System.debug('Limit DML statements = ' + Limits.getLimitDmlStatements());   
        System.debug('Future calls = ' + Limits.getLimitFutureCalls());            
        System.debug('Limits SOSL queries = ' + Limits.getLimitSoslQueries());   
        System.debug('Limit queries = ' + Limits.getLimitQueries());                    
    }
}