/**
 * @description       : The trigger that calls the method in the class to make a callout asynchronously.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CalloutTrigger on Account (before insert, before update) {
    CalloutClass.makeCallout();
}