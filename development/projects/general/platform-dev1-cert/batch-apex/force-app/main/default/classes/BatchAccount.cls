/**
 * @description       : Practicing Batch classes.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
**/
global class BatchAccount implements Database.Batchable<SObject> {
    
    global Database.QueryLocator start(Database.BatchableContext accountBatchableContext) {
        return AccountDML.getAccountNames();
    }

    global void execute(Database.BatchableContext accountBatchableContext, List<Account> accounts) {
        AccountDML.processAccounts(accounts);
    }

    global void finish(Database.BatchableContext accountBatchableContext) {
        System.debug('Finished processing');
        //We can also send email as well if that's what you want
    }
}