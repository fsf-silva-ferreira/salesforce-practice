/**
 * @description       : SObjectException example.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-03-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm
**/
public with sharing class SObjectExceptionExample {
    
    public static void runNoFetchedFieldScenario() {
        Account anAccount;
        
        try {
            anAccount = [SELECT Name FROM Account WHERE Name = 'Acct Test'];
            String description = anAccount.Description; //Throw SObjectException
        } catch (SObjectException sObjectException) {
            System.debug('The following exception occurred: ' + sObjectException.getMessage());
        }

        System.debug('Fetched account is ' + anAccount);
    }
}