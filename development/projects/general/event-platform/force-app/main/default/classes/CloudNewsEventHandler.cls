/**
 * @description       : Insert cases about Cloud_News__e event messages.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CloudNewsEventHandler {
    
    public static void openEventCases(List< Cloud_News__e> cloudNewsEventMessages) {
        Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
        
        List<Case> cases = new List<Case>();
        for (Cloud_News__e eventMessage : cloudNewsEventMessages) {
            if (eventMessage.Urgent__c == true) {
                Case eventCase = new Case();
                eventCase.Priority = 'High';
                eventCase.Subject = 'News team dispatch to ' + eventMessage.Location__c;
                eventCase.OwnerId = queue.Id;
                eventCase.Status = 'Open';
                
                cases.add(eventCase);
            }
        }
            
        insert cases; 
    }
}