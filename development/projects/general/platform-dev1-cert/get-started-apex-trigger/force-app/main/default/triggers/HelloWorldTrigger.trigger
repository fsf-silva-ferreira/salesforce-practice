/**
 * @description       : Getting started with Apex triggers.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger HelloWorldTrigger on Account (before insert) {
	System.debug('Hello World! - Trigger operation: ' + Trigger.operationType);
    System.debug('Trigger operation: ' + Trigger.operationType);
    System.debug('Number of records: ' + Trigger.size);
}