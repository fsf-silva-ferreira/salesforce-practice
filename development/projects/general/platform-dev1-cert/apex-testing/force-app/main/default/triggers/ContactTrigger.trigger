/**
 * @description       : Practicing trigger testing.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-24-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (before insert) {

    for(Contact contactToInsert : Trigger.new) {
        contactToInsert.LastName = contactToInsert.LastName + '-test';
    }
}