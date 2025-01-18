/**
 * @description       : Getting a list of custom object records.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 01-18-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FootballAssociationController {

    public static List<Football_Association__c> getFootballAssociations() {
        List<Football_Association__c> footballAssociations = [
            SELECT 
                Acronym__c
                ,Name
                ,Continental_Affiliation__c
                ,Year_Founded__c
                ,President__c
            FROM
                Football_Association__c 
            WHERE 
                Year_Founded__c != null AND 
                Acronym__c != null AND
                President__c != ''
            LIMIT 50
        ];

        return footballAssociations;
    }
}