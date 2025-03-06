/**
 * @description       : Practicing maps.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_map_sobject.htm
**/
public with sharing class MapExample {
    
    public static void displayMapOfStudentNames() {
        //Map is a collection of key-value pair
        Map<Integer, String> studentNames = new Map<Integer, String>();
        studentNames.put(1, 'Ravi');
        studentNames.put(500, 'John');
        studentNames.put(2, 'Adam');
        //If an element is added to the map with same key as an existing one, the latter is overwritten
        studentNames.put(500, 'Tina');
        //Maps allow duplicate values
        studentNames.put(22, 'Adam');

        System.debug('Elements og the map: ' + studentNames);
        System.debug('Value for the key 2: ' + studentNames.get(2));
        System.debug('Value for the key 500: ' + studentNames.get(500));
    }

    public static void createMapFromQuery() {
        Map<Id, Account> accountMap = new Map<Id,Account>([SELECT Id, Name, AccountNumber, (SELECT Id, Name, Birthdate, Email FROM Contacts) FROM Account]);

        System.debug('Account map from SOQL: ' + accountMap);
    }
}