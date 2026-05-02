/**
 * @description       : Apex code used to test spinner transition in Lightning Web Component (LWC).
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 05-02-2026
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SampleApexController {
    
    @AuraEnabled
    public static List<Account> processTransition() {
        List<Account> accounts = [
            SELECT Name FROM Account
        ];

        return accounts;
    }
}