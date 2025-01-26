/**
 * @description       : Practicing Batch classes.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Reference:
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
        //We cam also send email as well if that'swhat you want
    }
}