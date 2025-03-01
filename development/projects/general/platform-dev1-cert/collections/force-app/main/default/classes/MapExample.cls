/**
 * @description       : Practicing maps.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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
}