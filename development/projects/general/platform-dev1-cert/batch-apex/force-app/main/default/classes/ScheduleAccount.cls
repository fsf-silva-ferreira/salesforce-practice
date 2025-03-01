/**
 * @description       : Practicing Batch classes.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Reference:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_scheduler.htm
**/
global class ScheduleAccount implements Schedulable {
    
    global void execute(SchedulableContext accountScheduleConcetxt) {
        try {
            BatchAccount batchAccount = new BatchAccount();
            Database.executeBatch(batchAccount, 2);
        } catch (Exception e) {
            System.debug('ScheduleAccount error: ' + e.getMessage());
        }
    }
}