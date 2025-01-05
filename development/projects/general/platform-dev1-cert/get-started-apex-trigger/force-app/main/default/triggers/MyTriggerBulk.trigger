/**
 * @description       : A sample of bulkified trigger.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger MyTriggerBulk on Account(before insert) {

    System.debug('MyTriggerBulk trigger');

    for(Account a : Trigger.new) {
        a.Description = 'New description';
    }
}