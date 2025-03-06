/**
 * @description       : Handling exception in Apex with try-catch block. 
 *                      An exception denotes an error that disrupts the normal flow of code execution.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 03-04-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * 
 * Documentation:
 * https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_exception_methods.htm
 * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_types_catching.htm
**/
public class ExceptionHandlingExample {
    
    public static void createLeadRecord() {
        try {
            Lead myLead = new Lead();
            insert myLead;
        } catch (DmlException dmlException) {
            System.debug('The following exception has ocurred: ' + dmlException.getMessage());
        } 
        
        //After try-catch block the program continues the normal flow
        System.debug('Trying to insert e new Lead record');
    }

    public static void handleListException() {
        Integer first, second;

        try{
            List<Integer> integerList = new List<Integer>();
            //2 elements
            integerList.add(15);
            integerList.add(30);

            first = integerList.get(0);
            second = integerList.get(4);            
        } catch (Exception listException) { //Exception class handles any kind of exception
            System.debug('The exception has ocurred: ' + listException.getMessage());
        }

        //Normal flow continues
        System.debug('Element at index 0: ' + first);
    }

    
    public static void runNoExceptionScenario() {
        String firstElement;

        try{
            List<String> listOfStrings = new List<String>();
            listOfStrings.add('A');
            listOfStrings.add('B');

            firstElement = listOfStrings.get(0);    
        //In this scenario no exception occurs                   
        } catch (Exception listException) {
            System.debug('The exception has ocurred: ' + listException.getMessage());
        }


        System.debug('First element of the String list: ' + firstElement);
    }

    public static void getExceptionDetails() {
        try{
            Lead leadSample = [SELECT Name FROM Lead LIMIT 1];
            String leadDescription = leadSample.Description;// Exception is thrown here
        } catch (Exception exceptionDetails) {
            System.debug('Exception type caught: ' + exceptionDetails.getTypeName());
            System.debug('Message: ' + exceptionDetails.getMessage());
            System.debug('Cause: ' + exceptionDetails.getCause());
            System.debug('Line number: ' + exceptionDetails.getLineNumber());
            System.debug('Stack Ttrace: ' + exceptionDetails.getStackTraceString());
        }
    }

    public static void runMultipleCatchBlockExample() {
        try {
            Account myAccount = [SELECT Name FROM Account LIMIT 1];
            String accountSite = myAccount.Site;
        } catch (DmlException dmlException) {
            System.debug('DmlException ocurred: ' + dmlException.getMessage());
        } catch (SObjectException sObjectException) {
            System.debug('SObjectException ocurred: ' + sObjectException.getMessage());
        } catch (Exception genericException) {
            System.debug('Exception occurred: ' + genericException.getMessage());
        } finally {
            System.debug('Cleaning up resources in finally');
        }
    }
}