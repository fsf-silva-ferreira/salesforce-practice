/**
 * @description       : Returning Opportunity records to Lightning component.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
//* with sharing = User should not see records if he or she is not allowed
public with sharing class OpportunityController {
    
    //* WARNING:
    //* Use unique names for client-side and server-side actions in a component. 
    //* A JavaScript function (client-side action) with the same name as a server-side action (Apex method) can lead to hard-to-debug issues.
    @AuraEnabled
    public static List<Opportunity> getOpportunityRecords() {
        List<Opportunity> opportunities = [SELECT Id, Name FROM Opportunity];

        return opportunities;
    }
}