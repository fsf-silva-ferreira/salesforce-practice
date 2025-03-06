/**
 * @description       : NullPointerException example.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-03-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm
**/
public with sharing class NullPointerExample {

    public static void runNullPointerException() {
        String aString;
        Boolean resultOfContainsMethod;
        
        try {
            resultOfContainsMethod = aString.contains('abc'); //NullPointerException
        } catch (NullPointerException nullPointer) {
            System.debug('The following exception has occurred: ' + nullPointer.getMessage());
        }

        //Program continues
        System.debug('aString contains \'abc\'? ' + resultOfContainsMethod);
    }
}