/**
 * @description       : Creating SObjct lists.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-27-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SObjectDemo {
    
    public static void createSObjectList() {
        Account myAccount = new Account(Name='My Turorial Rack');
        Opportunity myOpportunity = new Opportunity(Name='My Turorial Rack');
        Case myCase = new Case(Status='New', Origin='Phone');

        List<SObject> objects = new List<SObject>();
        objects.add(myAccount);
        objects.add(myOpportunity);
        objects.add(myCase);

        System.debug('Elements in the SObject list: ' + objects);
    }

    public static void createAccountList() {
        Account myAccount = new Account(Name='My Turorial Rack');

        List<Account> objects = new List<Account>();
        objects.add(myAccount);

        System.debug('Elements in the Account list: ' + objects);
    }
}