/**
 * @description       : Listening OpportunityChangeEvent records to call OpportunityChangeHandler.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
  	
    OpportunityChangeHandler.createOpportunityChangeEventTasks(Trigger.new);
}