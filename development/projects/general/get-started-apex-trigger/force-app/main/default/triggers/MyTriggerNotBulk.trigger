/**
 * @description       : A sample of not bulkified trigger.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger MyTriggerNotBulk on Account(before insert) {

    System.debug('MyTriggerNotBulk trigger');

    Account a = Trigger.new[0];
    a.Description = 'New description';
}