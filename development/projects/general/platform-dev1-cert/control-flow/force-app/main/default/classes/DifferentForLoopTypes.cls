/**
 * @description       : Practicing different types of for loops.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-23-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DifferentForLoopTypes {

    public static void runTraditionalForLoop() {
        for(Integer counter = 1; counter <= 10; counter++) {
            System.debug('Value of counter = ' + counter);    
        }
    }

    public static void runCollectionForLoop() {
        List<String> employeeNames = new List<String> {'Gustavo', 'Lu', 'Flávio'};

        for (String employeeName : employeeNames) {
            System.debug('Employee name = ' + employeeName);
        }
    }

    //We'll go through this type of for loop in the next tutorials about SOQL
    public static void runSoqlForLoop() {    
        for (Contact loopContact : [SELECT Name FROM Contact LIMIT 10]) {
            System.debug('Employee name = ' + loopContact.Name);
        }
    }
}