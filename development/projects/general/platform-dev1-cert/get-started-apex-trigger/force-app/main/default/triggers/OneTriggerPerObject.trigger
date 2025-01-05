/**
 * @description       : Good practices for triggers.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 12-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Sources:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_bestpract.htm
 * https://salesforcegeek.in/apex-triggers-best-practices-in-salesforce/#:~:text=We%20should%20always%20write%20one,to%20handle%20the%20specific%20logic.
**/

//* Write one trigger per object as multiple triggers can lead to problems because there is no specific order. 
//* We cannot know which trigger will execute first. 
trigger OneTriggerPerObject on Asset (
    before insert, 
    before update, 
    before delete, 
    after insert, 
    after update, 
    after delete
) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            //Call class to handle logic on before isert
        }

        if(Trigger.isUpdate) {
            //Call class to handle logic on before update
        }

        if(Trigger.isDelete) {
            //Call class to handle logic on before delete
        }
    }

    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            //Call class to handle logic on after isert
        }

        if(Trigger.isUpdate) {
            //Call class to handle logic on after update
        }

        if(Trigger.isDelete) {
            //Call class to handle logic on after delete
        }        
    }
}