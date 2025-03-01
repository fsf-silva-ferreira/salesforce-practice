/**
 * @description       : Practicing sets.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SetExample {

    public static void displaySetOfStudentNames() {
        //Sets are unordered and allow NO duplicates.
        Set<String> studentNames = new Set<String>();
        studentNames.add('Ravi');
        studentNames.add('John');
        studentNames.add('Adam');
        studentNames.add('Tina');
        studentNames.add('Adam');

        System.debug('Size of the set: ' + studentNames.size());
        System.debug('Elements in the set: ' + studentNames);
    }
}