/**
 * @description       : Practicing parent-to-child and child-to-parent relationships.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class RelationshipQueries {
    
    public static void runParentToChildStandard() {
        List<Account> accounts = [
            SELECT
                Id
                ,Name
                ,Rating
                ,Industry
                ,AnnualRevenue
                ,(SELECT Id, FirstName, LastName, Email, Phone FROM Contacts)
                ,(SELECT Id, Name, Amount, StageName, CloseDate from Opportunities)
                ,(SELECT Id, Subject, Description, Status, Priority, Origin from Cases)
            FROM
                Account
            WHERE
                Name like '%Burlington%'                
        ];

        for(Account parent : accounts) {
            System.debug('Parent found: ' + parent.Name);
            System.debug('Child contacts found: ' + parent.Contacts);
            System.debug('Child opportunities found: ' + parent.Opportunities);
            System.debug('Child contacts found: ' + parent.Cases);
        }
    }

    public static void runChildToParentStandard(String Id) {
        //Sample Id: 003Hu00003nEuJ3IAK
        Contact contact = [
            SELECT
                Id
                ,FirstName
                ,LastName
                ,Email
                ,Title
                ,Account.Name
                ,Account.Rating
                ,Account.Industry
                ,Account.Active__c
                ,Account.Owner.FirstName
                ,Account.Owner.Email
                ,Account.Owner.Profile.Name
            FROM
                Contact
            WHERE
                Id = :Id            
        ];

        System.debug('Child found: ' + contact);
        System.debug('Parent found from child: ' + contact.Account);
    }

    public static void runParentToChildCustom() {
        List<Candidate__c> candidates = [
            SELECT 
                Id
                ,Name
                ,First_Name__c
                //To query child records from parent record:
                ,(SELECT Id, Name FROM Job_Applications__r) //Relationship name + __r
            FROM 
                Candidate__c              
        ];

        for(Candidate__c candidate : candidates) {
            System.debug('Custom child object records found in candidate ' + candidate.First_Name__c + ': ' + candidate.Job_Applications__r);
        }
    }

    public static void runChildToParentCustom() {
        List<Job_Application__c> jobApplications = [
            SELECT 
                Id
                ,Name
                ,Stage__c
                ,Status__c
                ,Number_of_Reviews__c
                ,Total_Review_Score__c
                ,Average_Review_Score__c
                ,Review_Indicator__c
                //Position__r = Child relationship name
                ,Position__r.Name
                ,Position__r.Hiring_Manager__c 
                //Candidate__r = Child relationship name
                ,Candidate__r.First_Name__c
                ,Candidate__r.Education__c
            FROM 
                Job_Application__c              
        ];

        for(Job_Application__c jobApplication : jobApplications) {
            System.debug('Custom child object record found: ' + jobApplication.Name);
            System.debug('Custom parent object record found - Position__r: ' + jobApplication.Position__r.Name);
            System.debug('Custom parent object record found - Candidate__r: ' + jobApplication.Candidate__r.First_Name__c);
        }
    }
}