/**
 * @description       : Declaring variables.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 02-21-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class IntegerDeclaration {
    
    public static void displayNumbers() {
        Integer firstNumber = (10+6) * (5+2);
        Integer secondNumber = 50*10;
        Integer thirdNumber = 10;
        Integer total = firstNumber + secondNumber + thirdNumber;

        System.debug('First number is: ' + firstNumber);
        System.debug('Second number is: ' + secondNumber);
        System.debug('Third number is: ' + thirdNumber);
        System.debug('Total is: ' + total);
    }
}